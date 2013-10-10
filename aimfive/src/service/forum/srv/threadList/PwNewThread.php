<?php
defined('WEKIT_VERSION') || exit('Forbidden');

Wind::import('SRV:forum.srv.threadList.PwThreadDataSource');

/**
 * 帖子列表数据接口 / 普通列表
 *
 * @author Jianmin Chen <sky_hold@163.com>
 * @copyright ©2003-2103 phpwind.com
 * @license http://www.phpwind.com
 * @version $Id: PwNewThread.php 17054 2012-08-30 10:51:39Z jieyin $
 * @package forum
 */

class PwNewThread extends PwThreadDataSource {
	
	protected $forbidFids;
	protected $order;
	protected $specialSortTids;
	protected $count;
	public $type;
	public $uid;

	public function __construct($forbidFids = array()) {
		$this->forbidFids = $forbidFids;
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
		return $this->_getThreadIndexDs()->countThreadNotInFids($this->forbidFids) + $this->count;
	}

	public function getType($type){
		return $this->type=$type;
	}
	
		public function getUid($uid){
		return $this->uid=$uid;
	}
	
	public function getData($limit, $offset) {
		$type=$this->type;
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
			$tids = $this->_getThreadIndexDs()->fetchNotInFid($this->forbidFids, $limit, $offset, $this->order);
			if($type){
				$tmp = $this->_getThreadDs()->fetchThread($tids,$type,$this->uid);
				if($tmp){
					foreach($tmp as $key=>$value){
						$atids[]=$value['tid'];
					}
					$d_ids = array_diff($tids,$atids);
					foreach($d_ids as $k=>$v){
						$haha = array_search($v,$tids,true);
						array_splice($tids,$haha,1);
					}
				}else{
					$tids ='';
				}
			}else{
				$tmp = $this->_getThreadDs()->fetchThread($tids);
			}
			$tmp = $this->_sort($tmp, $tids);
			$tmp && $threaddb = array_merge($threaddb,$tmp);
		}
		
		return $threaddb;
	}
	
	/**
	*获取难题的方法
	*/
		public function getData_le($limit, $offset) {
		
		$type=$this->type;
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
			$tids = $this->_getThreadIndexDs()->fetchNotInFid($this->forbidFids, $limit, $offset, $this->order);
		
			$tmp = $this->_getThreadDs()->fetchThread_le($tids,$type);
			
			$tids='';
			foreach($tmp as $key=>$value){
					$tids[]=$value['tid'];
			}
			$tmp = $this->_sort($tmp, $tids);
			$tmp && $threaddb = array_merge($threaddb,$tmp);
		}
		
		return $threaddb;
	}
	
	/**
	*获取热门的方法
	*/
		public function getData_hist($limit, $offset) {
		$type=$this->type;
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
			$this->order='hist';
			$this->forbidFids=2;
			$tids = $this->_getThreadIndexDs()->fetchNotInFid($this->forbidFids, $limit, $offset, $this->order);
// 		var_dump($tids);
			$tmp = $this->_getThreadDs()->fetchThread_le($tids,$type,$hist=1);
			$tids='';
			foreach($tmp as $key=>$value){
					$tids[]=$value['tid'];
			}
			$tmp = $this->_sort($tmp, $tids);
			$tmp && $threaddb = array_merge($threaddb,$tmp);
		}
		
		return $threaddb;
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