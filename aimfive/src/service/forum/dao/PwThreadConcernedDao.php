<?php
defined('WEKIT_VERSION') || exit('Forbidden');

/**
 * 帖子dao服务
 *
 * @author Jianmin Chen <sky_hold@163.com>
 * @copyright ©2003-2103 phpwind.com
 * @license http://www.phpwind.com
 * @version $Id: PwThreadMergeDao.php 21335 2012-12-05 03:39:26Z jieyin $
 * @package forum
 */

class PwThreadConcernedDao extends PwBaseDao {
	protected $_table = 'bbs_track';
	protected $_mergeTable = 'aim_bbs_vtype_my';
	protected $_dataStruct = array();
	

	/**
	*检测是否已经追踪
	*
	*/
	public  function check_ok($tid,$uid,$bug=''){
		$sql = $this->_bindSql("SELECT id FROM %s WHERE %s", $this->getTable()," tid=$tid AND uid=$uid");
		$smt = $this->getConnection()->createStatement($sql);
		if($bug){
			return $sql;
		}else{
			return $smt->getOne(array(), 'id');
		}
	}
	/**
	*增加新的追踪
	*
	*/
	public  function addTrack($tid,$uid,$bug=''){
		$sql = $this->_bindSql("INSERT INTO %s SET %s", $this->getTable()," tid=$tid,uid=$uid");
		if (($result = $this->getConnection()->execute($sql))) {
			$result = $this->getConnection()->lastInsertId();
		}
		if($bug){
			return $sql;
		}else{
			return $result;
		}
	}
	/**
	*删除单挑追踪
	*
	*/
	public  function delTrack($tid,$uid,$bug=''){
		$sql = $this->_bindSql("DELETE FROM %s WHERE %s", $this->getTable()," tid=$tid AND uid=$uid");
		if($bug){
			return $sql;
		}else{
			if (($result = $this->getConnection()->execute($sql))) {
			$result = $this->getConnection()->lastInsertId();
			}
			return $result;
		}
	}
	
	/**
	*查看自己的追踪信息
	*$uid  当前用户
	*/
	public function checkOutCon($uid,$order,$bug=''){
		if($order=='postdate'){$order = ' ORDER BY  i.created_time DESC';}else{$order = ' ORDER BY i.lastpost_time DESC';}
		$sql = $this->_bindSql("SELECT i.tid FROM %s WHERE %s %s",'aim_bbs_threads_index i,aim_bbs_track t',"t.uid=$uid and t.tid=i.tid","$order");
		$smt = $this->getConnection()->createStatement($sql);
		if($bug){
			return $sql;
		}else{
			return $smt->queryAll(array(), 'tid');
		}
	}
	

	protected function _sqlIn($value, &$arg) {
		if (is_array($value)) {
			return ' IN ' . $this->sqlImplode($value);
		}
		$arg[] = $value;
		return '=?';
	}
}