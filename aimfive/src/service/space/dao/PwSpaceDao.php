<?php
Wind::import('SRC:library.base.PwBaseDao');
/**
 * the last known user to change this file in the repository  <$LastChangedBy: gao.wanggao $>
 * @author $Author: gao.wanggao $ Foxsee@aliyun.com
 * @copyright ?2003-2103 phpwind.com
 * @license http://www.phpwind.com
 * @version $Id: PwSpaceDao.php 6219 2012-03-19 08:39:40Z gao.wanggao $ 
 * @package 
 */
class PwSpaceDao extends PwBaseDao {
	protected $_table = 'space';
	protected $_dataStruct = array('uid', 'space_name', 'space_descrip', 'space_domain', 'space_style', 'back_image', 'visit_count','space_privacy', 'visitors', 'tovisitors');
	
	
	public function getSpace($uid) {
		$sql = $this->_bindTable('SELECT * FROM %s WHERE uid = ? ');
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->getOne(array($uid));
	}
	/**
	 * 
	 * 获取职位和公司
	 * @param unknown_type $uid
	 */
	public function getJob($uid){
		$sql = $this->_bindSql('SELECT zhiwei,company FROM %s where endy=0 and uid=%s','aim_user_work',$uid);
		$smt = $this->getConnection()->createStatement($sql);
		if($smt->getOne()){
			return $smt->getOne();
		}else{
			$sql = $this->_bindSql('SELECT zhiwei,company FROM `aim_user_work` where endy=(SELECT MAX(endy) FROM `aim_user_work` where uid=%s)',$uid);
			$smt = $this->getConnection()->createStatement($sql);
			return $smt->getOne();
		}
	}
	/**
	 * 获取全部工作信息的方法
	 * @param  $uid
	 */
	public function getJobAll($uid) {
		$sql = $this->_bindSql('SELECT * FROM %s WHERE uid=%s ORDER BY id ASC','aim_user_work',$uid);
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->queryAll();
	}
	/**
	 * 获取教育经历
	 * @param  $uid
	 */
	public function getSchoolAll($uid) {
		$sql = $this->_bindSql('SELECT mys.degree,sch.`name`,mys.major,mys.start_time FROM aim_user_education as mys,aim_windid_school as sch  where mys.uid=%s and mys.schoolid=sch.schoolid',$uid);
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->queryAll();
	}
	/**
	 * 获取爱好
	 * @param  $uid
	 */
	public function getTag($uid) {
		$sql = $this->_bindSql('SELECT t.name FROM aim_user_tag_relation as r,aim_user_tag as t WHERE r.uid=%s AND r.tag_id=t.tag_id ORDER BY r.created_time DESC;',$uid);
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->queryAll();
	}
	
	
	
	public function getArea($table,$id){
		$sql = $this->_bindSql('SELECT joinname FROM %s WHERE areaid=%s',$table,$id);
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->getOne(array(areaid));
	}
	
	public function fetchSpace($uids) {
		$sql = $this->_bindSql('SELECT * FROM %s WHERE uid IN %s', $this->getTable(), $this->sqlImplode($uids));
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->queryAll(array(), 'uid');
	}
	
	public function getSpaceByDomain($domain) {
		$sql = $this->_bindTable('SELECT * FROM %s WHERE space_domain = ? LIMIT 1');
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->getOne(array($domain));
	}

	public function addInfo($data) {
		if (!$data = $this->_filterStruct($data)) return false;
		$sql = $this->_bindSql('INSERT INTO %s SET %s', $this->getTable(),  $this->sqlSingle($data));
		return $this->getConnection()->execute($sql);
	}
	
	public function updateInfo($uid, $data) {
		if (!$data = $this->_filterStruct($data)) return false;
		$sql = $this->_bindSql('UPDATE %s SET %s WHERE uid = ?',$this->getTable(), $this->sqlSingle($data));
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->update(array($uid));
	}
	
	public function updateNumber($uid) {
		$sql = $this->_bindSql('UPDATE %s SET %s WHERE uid = ?', $this->getTable(), $this->sqlSingleIncrease(array('visit_count'=>1)));
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->update(array($uid));
	}
	
	public function deleteInfo($uid) {
		$sql = $this->_bindTable('DELETE FROM %s  WHERE uid = ? ');
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->update(array($uid));
	}

}
?>