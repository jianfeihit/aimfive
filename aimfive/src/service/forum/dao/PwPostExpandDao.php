<?php

/**
 * 帖子基础dao服务
 *
 * @author Jianmin Chen <sky_hold@163.com>
 * @copyright ©2003-2103 phpwind.com
 * @license http://www.phpwind.com
 * @version $Id: PwPostExpandDao.php 22336 2012-12-21 09:36:17Z jieyin $
 * @package forum
 */

class PwPostExpandDao extends PwBaseDao {
	
	protected $_table = 'bbs_posts';
	protected $_pk = 'pid';
	protected $_dataStruct = array('pid', 'fid', 'tid', 'ischeck', 'useubb', 'aids', 'subject', 'content', 'created_time', 'created_username', 'created_userid', 'created_ip', 'modified_time', 'modified_username', 'modified_userid', 'modified_ip');

	public function countUserPostByFidAndTime($fid, $time, $limit) {
		$sql = $this->_bindSql('SELECT created_userid,COUNT(*) AS count FROM %s WHERE disabled=0 AND created_time>? AND fid=? GROUP BY created_userid ORDER BY count DESC %s', $this->getTable(), $this->sqlLimit($limit));
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->queryAll(array($time, $fid), 'created_userid');
	}

	public function countPostsByFid() {
		$sql = $this->_bindTable('SELECT fid,COUNT(*) AS sum FROM %s WHERE disabled=0 GROUP BY fid');
		$rst = $this->getConnection()->query($sql);
		return $rst->fetchAll('fid');
	}
		
	public function countDisabledPostByUid($uid) {
		$sql = $this->_bindTable('SELECT COUNT(*) FROM %s WHERE created_userid=? AND disabled<2');
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->getValue(array($uid));
	}

	public function getDisabledPostByUid($uid, $limit, $offset) {
		$sql = $this->_bindSql('SELECT * FROM %s WHERE created_userid=? AND disabled<2 ORDER BY created_time DESC %s', $this->getTable(), $this->sqlLimit($limit, $offset));
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->queryAll(array($uid), 'pid');
	}
	/**
	 * 
	 * 获取自己回复的列表
	 * @param  $uid
	 * @param  $fids
	 * @FORCE INDEX() 强制索引 
	 */
	public function backId($uid,$fids,$limit, $offset, $order){
	
		list($field, $idx) = $this->_getOrderFieldAndIndex($order);
		$sql = $this->_bindSql('SELECT t.tid,t.fid,p.disabled,t.created_time,t.lastpost_time FROM %s t FORCE INDEX(%s),%s p   where p.created_userid=%s AND p.disabled<2 AND p.fid=%s and p.fid=t.fid and p.tid=t.tid order by t.%s desc','aim_bbs_threads',$idx,$this->getTable(),$uid,$fids[0],$field,$this->sqlLimit($limit, $offset));
		$smt = $this->getConnection()->createStatement($sql);
		
		return $smt->queryAll(array($uid), 'tid');
	}
	/**
	 * 
	 * 判断order排序  第二参数为索引值
	 * @param unknown_type $order
	 */
	protected function _getOrderFieldAndIndex($order) {
			if ($order == 'lastpost') {
				return array('lastpost_time', 'idx_fid_disabled_lastposttime');
			}
			return array('tid', 'PRIMARY');
		}

}