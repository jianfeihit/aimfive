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

class PwThreadFirendDao extends PwBaseDao {
	protected $_table = 'bbs_threads';
	protected $_mergeTable = '';
	protected $_dataStruct = array();
	
	
	public  function checkOne($uid,$bug=''){
		$sql = $this->_bindSql("SELECT tid FROM %s WHERE %s", $this->getTable()," created_userid=$uid ORDER BY tid DESC LIMIT 1");
		if($bug){
			return $sql;
		}else{
			$smt = $this->getConnection()->createStatement($sql);
			return $smt->getOne(array(), 'id');
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