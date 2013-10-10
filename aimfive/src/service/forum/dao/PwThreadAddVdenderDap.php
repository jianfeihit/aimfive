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

class PwThreadAddVdenderDap extends PwBaseDao {
	protected $_table = 'bbs_vtype';
	protected $_mergeTable = 'aim_bbs_vtype_my';
	protected $_dataStruct = array();
	
	public  function _add(){
		$sql = $this->_bindSql('SELECT * FROM %s WHERE tid IN %s AND disabled=0 ORDER BY special_sort DESC, lastpost_time DESC %s', $this->getTable(), $this->sqlImplode($tids), $this->sqlLimit($limit, $offset));
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->queryAll(array(), 'tid');
	
	}	
	/**
	*根据$UID查询自己的器件
	*
	*/
	public  function getVtype($uid){
		$sql = $this->_bindSql('SELECT * FROM %s WHERE %s  AND is_show=1',$this->_mergeTable,"uid=$uid");
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->queryAll(array(), 'id');
	}
	
	/**
	*根据$UID查询自己的器件
	*
	*/
	public  function getVtypeShow($uid){
		$sql = $this->_bindSql('SELECT * FROM %s WHERE %s  group by vid',$this->_mergeTable,"uid=$uid");
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->queryAll(array(), 'id');
	}
	
	
	/**
	*检测此器件是否存在
	*
	*/
	public  function check_vtype($name){
		$sql = $this->_bindSql("SELECT id FROM %s WHERE v_name='%s'", $this->getTable(),$name);
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->getOne(array(), 'id');
	}
	
	
	/*
	*删除选择的器件
	*/
	public  function delInType($uid,$vids){
		$sql = $this->_bindSql("DELETE FROM %s WHERE  uid=%s and vid IN(%s)",$this->_mergeTable,$uid,$vids);
		return $this->getConnection()->execute($sql);
	}
	
	/**
	*器件库增加新的器件
	*
	*/
	public  function add_vtype($name){
		$sql = $this->_bindSql("INSERT INTO %s SET %s", $this->getTable(),"v_name='$name'");
		if (($result = $this->getConnection()->execute($sql))) {
			$result = $this->getConnection()->lastInsertId();
		}
		return $result;
	}
	/**
	*增加自己的器件信息
	*
	*/
	public  function add_vtype_my($id,$uid,$tid=''){
		if($tid){
			$sql = $this->_bindSql("INSERT INTO %s (vid,uid,tid) value (%s)", $this->_mergeTable,"$id,$uid,$tid");
		}else{
			$sql = $this->_bindSql("INSERT INTO %s (vid,uid) value (%s)", $this->_mergeTable,"$id,$uid");
		}
		if (($result = $this->getConnection()->execute($sql)) && $getId) {
			$result = $this->getConnection()->lastInsertId();
		}
		return $result;
	}
	/**
	*查看自己的器件信息
	*$vid  器件ID
	*/
	public function check_my($vid,$uid,$tid=''){
		if($tid){
			$sql = $this->_bindSql("SELECT id FROM %s WHERE %s", $this->_mergeTable,"vid=$vid AND uid=$uid AND tid=$tid");
		}else{
			$sql = $this->_bindSql("SELECT id FROM %s WHERE %s", $this->_mergeTable,"vid=$vid AND uid=$uid");
		}
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->getOne(array(), 'id');
	}
	
	
	/**
	*用器件ID获取器件名称
	*$vid
	*/
	public function getvname($vid){
		if(!$vid){return false;}
		$sql = $this->_bindSql("SELECT v_name FROM %s WHERE %s", $this->getTable(),"id=$vid");
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->getOne(array(), 'name');
	}

	protected function _sqlIn($value, &$arg) {
		if (is_array($value)) {
			return ' IN ' . $this->sqlImplode($value);
		}
		$arg[] = $value;
		return '=?';
	}
}