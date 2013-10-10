<?php
defined('WEKIT_VERSION') || exit('Forbidden');

Wind::import('SRV:forum.srv.threadList.PwThreadDataSource');

/**
 * 帖子列表数据接口 / 普通列表
 *
 * @author Jianmin Chen <sky_hold@163.com>
 * @copyright ©2003-2103 phpwind.com
 * @license http://www.phpwind.com
 * @version $Id: PwMyForumThread.php 19290 2012-10-12 08:13:34Z xiaoxia.xuxx $
 * @package forum
 */

class PwMyForumThread extends PwThreadDataSource {
	
	protected $fids;
	protected $order;
	protected $specialSortTids;
	protected $count;

	public function __construct(PwUserBo $user) {
		$fids = array_keys(Wekit::load('forum.PwForumUser')->getFroumByUid($user->uid));
		$this->fids = Wekit::load('forum.srv.PwForumService')->getAllowVisitForum($user, Wekit::load('forum.PwForum')->fetchForum($fids));
		$this->specialSortTids = array_keys($this->_getSpecialSortDs()->getSpecialSortByTypeExtra('topped',3));
		$this->count = count($this->specialSortTids);
	}

	public function setOrderBy($order) {
		$this->order = $order;
		if ($order != 'lastpost') {
			$this->urlArgs['order'] = $order;
		}
	}

	public function getTotal() {
		return $this->_getThreadIndexDs()->countThreadInFids($this->fids) + $this->count;
	}

	public function getData($limit, $offset) {
		$threaddb = array();
		if ($offset < $this->count) {
			$array = $this->_getThreadDs()->fetchThreadByTid($this->specialSortTids, $limit, $offset);
			foreach ($array as $key => $value) {
				$value['issort'] = true;
				$threaddb[] = $value;
			}
			$limit -= count($threaddb);
		}
		$offset -= min($this->count, $offset);
		if ($limit > 0) {
			$tids = $this->_getThreadIndexDs()->fetchInFid($this->fids, $limit, $offset, $this->order);
			$tmp = $this->_getThreadDs()->fetchThread($tids);
			$tmp = $this->_sort($tmp, $tids);
			$tmp && $threaddb = array_merge($threaddb,$tmp);
		}
		return $threaddb;
	}
	
	/**
	 * 
	 * 查询回复帖子所有的信息
	 * 主要到修改了fetchInFid_back()方法.之后到PwThreadIndex()类中
	 * @param $limit
	 * @param $offset
	 * @param $uid
	 */
	public function getData_back($limit, $offset,$uid,$track='',$firend='') {
		$threaddb = array();
		if ($offset < $this->count) {
			$array = $this->_getThreadDs()->fetchThreadByTid($this->specialSortTids, $limit, $offset);
			foreach ($array as $key => $value) {
				$value['issort'] = true;
				$threaddb[] = $value;
			}
			$limit -= count($threaddb);
		}
		$offset -= min($this->count, $offset);
		if ($limit > 0) {
			$fids=array('2');//固定只有一个模块
			if(!$track && !$firend){
				$tids = $this->_getThreadIndexDs()->fetchInFid_back($fids, $limit, $offset, $this->order,$uid);
			}
			if($track){
			
				$ids=$this->getTrack()->checkOutCon($uid,$this->order);
				foreach($ids as $k=>$v){
						$tids[]=$k;
				}
			}
			if($firend){
				foreach($firend as $k=>$v){
						$fid=$this->getFirend()->checkOne($v['touid']);
						if($fid['tid']){$tids[]=$fid['tid'];}
				}
			}
			$tmp = $this->_getThreadDs()->fetchThreada($tids);
			$tmp = $this->_sort($tmp, $tids);
			$tmp && $threaddb = array_merge($threaddb,$tmp);
		}
		return $threaddb;
	}
	/**
	 * 加载追踪模型
	 */
	public function getFirend(){
		return Wekit::loadDao('forum.dao.PwThreadFirendDao');
	}
	
	/**
	 * 加载追踪模型
	 */
	public function getTrack(){
		return Wekit::loadDao('forum.dao.PwThreadConcernedDao');
	}
	/**
	 * 加载厂商型号模型
	 */
	public function getVender(){
		return Wekit::loadDao('forum.dao.PwThreadAddVdenderDap');
	}
	
	
	protected function _getThreadDs() {
		return Wekit::load('forum.PwThread');
	}


	protected function _getThreadIndexDs() {
		return Wekit::load('forum.PwThreadIndex');
	}

	protected function _sort($data, $sort) {
		$result = array();
		foreach ($sort as $tid) {
			$result[$tid] = $data[$tid];
		}
		return $result;
	}
	
	protected function _getSpecialSortDs() {
		return Wekit::load('forum.PwSpecialSort');
	}
}