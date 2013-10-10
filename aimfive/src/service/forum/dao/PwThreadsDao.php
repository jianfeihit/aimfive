<?php

/**
 * 帖子dao服务
 *
 * @author Jianmin Chen <sky_hold@163.com>
 * @copyright ©2003-2103 phpwind.com
 * @license http://www.phpwind.com
 * @version $Id: PwThreadsDao.php 24251 2013-01-23 09:07:13Z jinlong.panjl $
 * @package forum
 */

class PwThreadsDao extends PwBaseDao {
	
	protected $_table = 'bbs_threads';
	protected $_pk = 'tid';
	protected $_dataStruct = array('tid', 'fid', 'topic_type', 'subject', 'topped', 'digest','overtime', 'highlight', 'inspect', 'ifshield', 'disabled', 'ischeck', 'replies', 'hits','like_count', 'special', 'tpcstatus', 'ifupload', 'created_time', 'created_username', 'created_userid', 'created_ip', 'modified_time', 'modified_username', 'modified_userid', 'modified_ip', 'lastpost_time', 'lastpost_userid', 'lastpost_username', 'reply_notice', 'reply_topped', 'special_sort', 'app_mark');
	
	
	public function getThread($tid) {
		return $this->_get($tid);
	}
	//修改了成为查询提问的方法
	public function fetchThread($tids,$type='',$uid='') {
		if($type==1 || $type==2){
			return $this->_fetch_tw($tids,$type,$uid, 'tid');
		}else{
			return $this->_fetch($tids, 'tid');
		}
	}
	//查询筛选器件的方法
	public function fetchThreadA3($tids,$uid='') {
		return $this->_fetchA3($tids, 'tid','0',$uid);
	}
	//查询回复的方法
		public function fetchThreada($tids) {
			return $this->_fetch($tids, 'tid');
	}
	//查询难题的方法
		public function fetchThread_le($tids,$type,$hist) {
		if($hist==1){
			return $this->_fetch_hist($tids,$type, 'tid');
		}else{
			return $this->_fetch_le($tids,$type, 'tid');
		}
			
	}
		//修改筛选器件
		public function savDevice($vid,$uid,$state){
		$sql = $this->_bindSql('UPDATE %s SET is_show=%s WHERE uid=%s AND vid=%s' , 'aim_bbs_vtype_my',$state,$uid,$vid);
		return $this->getConnection()->execute($sql);
		}
		
		//增加补充内容
		public function addcon($tid,$con){
		$sql = $this->_bindSql('UPDATE %s SET add_content=%s WHERE tid=%s' , $this->getTable(),"'$con'",$tid);
		return $this->getConnection()->execute($sql);
		}
	
	
		//查询我的器件列表
		public function getDname($uid){
			$sql = $this->_bindSql('SELECT distinct  v_type,created_userid,vtp_is_show FROM %s WHERE created_userid=%s   ORDER BY  created_time DESC', $this->getTable(),$uid);
			$smt = $this->getConnection()->createStatement($sql);
			return $smt->queryAll(array($uid));
		}
		
		//查询我的器件-我的帖子
		public function getMyThread($tids,$order){
			$sql = $this->_bindSql('SELECT * FROM %s WHERE tid  in(%s)   ORDER BY  %s', $this->getTable(),$tids,$order);
			$smt = $this->getConnection()->createStatement($sql);
			return $smt->queryAll(array($uid));
		}
	
	
	//查询积分的方法
		public function getCredit($uid){
			$sql = $this->_bindSql('SELECT credit2,credit3,notices FROM %s WHERE uid=%s ','aim_user_data',$uid);
			$smt = $this->getConnection()->createStatement($sql);
			return $smt->getOne(array($uid));
		}
		
	//查询指定用户信息
		public function getUser($uid){
			$sql = $this->_bindSql('SELECT uid,username FROM %s WHERE uid=%s ','aim_user',$uid);
			$smt = $this->getConnection()->createStatement($sql);
			return $smt->getOne(array($uid));
		}
		
		//查询是否是互相关注的好友
		public function getGzUser($uid,$tid){
			$sql = $this->_bindSql('SELECT * FROM %s WHERE %s ','aim_attention',"touid = $uid  and  uid=$tid");
			$smt = $this->getConnection()->createStatement($sql);
			return $smt->getOne(array($uid));
		}
		
		//添加关注信息
		public function addwarns($uid,$tid,$fid,$time){
		$sql = $this->_bindSql('INSERT INTO %s SET  created_id=%s,tid=%s,fid=%s,w_time=%s', 'aim_bbs_warns',$uid,$tid,"'$fid'",$time);
		return $this->getConnection()->execute($sql);
		}
		
		//查询关注信息
		public function getwarns($uid){
			$sql = $this->_bindSql('SELECT * FROM %s WHERE %s','aim_bbs_warns',"created_id  in($uid)");
			$smt = $this->getConnection()->createStatement($sql);
			return $smt->queryAll(array($uid));
		}
		
		//查询是否重复提交邀请
		public function checkwarns($uid,$tid,$fid){
			$sql = $this->_bindSql('SELECT * FROM %s WHERE %s ','aim_bbs_warns',"created_id = $uid  and  tid=$tid  AND fid='$fid'");
			$smt = $this->getConnection()->createStatement($sql);
			return $smt->getOne(array($uid));
		}
		
		
		//邀请重新排序
		public function sortWarns($ids){
			$sql = $this->_bindSql('SELECT * FROM %s WHERE  id IN(%s)  ORDER BY id DESC','aim_bbs_warns',$ids);
			$smt = $this->getConnection()->createStatement($sql);
			return $smt->queryAll(array($uid));
		}
		
		//查询多用户信息
		public function getUserAll($uid){
			$sql = $this->_bindSql('SELECT username,uid,email FROM %s WHERE %s ','aim_user'," uid in($uid) ");
			$smt = $this->getConnection()->createStatement($sql);
			return $smt->queryAll(array($uid));
		}
		
		
		//修改积分能力 通知的方法
		public function savCredit($uid,$sum,$sum2,$sum3){
		$sql = $this->_bindSql('UPDATE %s SET credit2=%s,credit3=%s,notices=%s WHERE uid=%s', 'aim_user_data',$sum,$sum2,$sum3,$uid);
		return $this->getConnection()->execute($sql);
		}
		
		//单积分的方法
		public function savCreditjf($uid,$sum){
		$sql = $this->_bindSql('UPDATE %s SET credit2=%s WHERE uid=%s', 'aim_user_data',$sum,$uid);
		return $this->getConnection()->execute($sql);
		}
		
	//增加通知
		public function addNotices($uid,$info,$time){
		$sql = $this->_bindSql('INSERT INTO %s SET  uid=%s,typeid=6,param=0,is_read=0,is_ignore=0,title=%s,%s', 'aim_message_notices',$uid,"'$info'","created_time=$time,modified_time=$time");
		return $this->getConnection()->execute($sql);
		}
		
		//公用的增加通知
		public function addNotice($uid,$info,$sum,$time){
		$sql = $this->_bindSql('INSERT INTO %s SET  uid=%s,typeid=6,param=0,is_read=0,is_ignore=0,title=%s,%s', 'aim_message_notices',$uid,"'$info'","created_time=$time,modified_time=$time");
		$this->savenotice($uid,$sum);
		 return $this->getConnection()->execute($sql);
		}
		public function savenotice($uid,$sum){
			$sql = $this->_bindSql('UPDATE %s SET notices=%s WHERE uid=%s', 'aim_user_data',$sum,$uid);
			return $this->getConnection()->execute($sql);
		}

	
	
		//增加能力日志的方法
		public function addLogCredit($uid,$username,$time){
			$sql = $this->_bindSql('INSERT INTO %s SET %s', 'aim_credit_log'," ctype=2,affect=2,logtype='select_back',descrip='被发帖用户选择为最佳答案;能力变化［能力+1］',created_userid=$uid,created_username='$username',created_time=$time");
			
			return $this->getConnection()->execute($sql);
		}
		//增加积分日志的方法
		public function addLogCreditjf($uid,$username,$info,$time){
			$sql = $this->_bindSql('INSERT INTO %s SET %s', 'aim_credit_log'," ctype=2,affect=2,logtype='post_reply',descrip='$info',created_userid=$uid,created_username='$username',created_time=$time");
			
			return $this->getConnection()->execute($sql);
		}
		
	//修改解决状态并添加回复ID
	public function addSelect($tid,$pid,$lou){
		$sql = $this->_bindSql('UPDATE %s SET is_ok=1,select_id=%s,back_lou=%s WHERE tid=%s', $this->getTable(),$pid,$lou,$tid);
		return $this->getConnection()->execute($sql);
	}
	
	public function getThreadByFid($fid, $limit, $offset) {
		$sql = $this->_bindSql('SELECT * FROM %s WHERE fid=? AND disabled=0 ORDER BY lastpost_time DESC %s', $this->getTable(), $this->sqlLimit($limit, $offset));
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->queryAll(array($fid), 'tid');
	}
	
	public function fetchThreadByTid($tids, $limit, $offset) {
		$sql = $this->_bindSql('SELECT * FROM %s WHERE tid IN %s AND disabled=0 ORDER BY special_sort DESC, lastpost_time DESC %s', $this->getTable(), $this->sqlImplode($tids), $this->sqlLimit($limit, $offset));
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->queryAll(array(), 'tid');
	}

	public function countPosts($fid) {
		$sql = $this->_bindTable('SELECT COUNT(*) AS topics,SUM( replies ) AS replies FROM %s WHERE fid=? AND disabled=0');
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->getOne(array($fid));
	}
	
	public function getThreadByFidAndType($fid, $type, $limit, $start) {
		$sql = 'SELECT * FROM %s WHERE fid=? AND topic_type=? AND disabled=0 ORDER BY lastpost_time DESC' . $this->sqlLimit($limit, $start);
		$sql = $this->_bindTable($sql);
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->queryAll(array($fid, $type), 'tid');
	}
	
	public function countThreadByFidAndType($fid, $type) {
		$sql = 'SELECT COUNT(*) AS cnt FROM %s WHERE fid=? AND topic_type=? AND disabled=0';
		$sql = $this->_bindTable($sql);
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->getValue(array($fid, $type));
	}
	
	public function countThreadByUid($uid) {
		$sql = $this->_bindTable('SELECT COUNT(*) AS sum FROM %s WHERE created_userid=? AND disabled=0');
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->getValue(array($uid));
	}

	public function getThreadByUid($uid, $limit, $offset) {
		$sql = $this->_bindSql('SELECT * FROM %s WHERE created_userid=? AND disabled=0 ORDER BY created_time DESC %s', $this->getTable(), $this->sqlLimit($limit, $offset));
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->queryAll(array($uid), 'tid');
	}
	
	public function getThreadsByFidAndUids($fid, $uids, $limit, $offset) {
		$sql = $this->_bindSql('SELECT * FROM %s WHERE fid=? AND created_userid IN %s AND disabled=0 %s', $this->getTable(), $this->sqlImplode($uids), $this->sqlLimit($limit, $offset));
		$smt = $this->getConnection()->createStatement($sql);
		return $smt->queryAll(array($fid), 'tid');
	}
	
	public function addThread($fields) {
		return $this->_add($fields);
	}

	public function updateThread($tid, $fields, $increaseFields = array(), $bitFields = array()) {
		return $this->_update($tid, $fields, $increaseFields, $bitFields);
	}

	public function batchUpdateThread($tids, $fields, $increaseFields = array(), $bitFields = array()) {
		return $this->_batchUpdate($tids, $fields, $increaseFields, $bitFields);
	}

	public function revertTopic($tids) {
		$sql = $this->_bindSql('UPDATE %s SET disabled=ischeck^1 WHERE tid IN %s', $this->getTable(), $this->sqlImplode($tids));
		$result = $this->getConnection()->execute($sql);
		PwSimpleHook::getInstance('PwThreadsDao_revertTopic')->runDo($tids);
		return $result;
	}
	
	public function deleteThread($tid) {
		return $this->_delete($tid);
	}

	public function batchDeleteThread($tids) {
		return $this->_batchDelete($tids);
	}
}