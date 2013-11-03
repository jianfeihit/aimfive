<?php
Wind::import('SRV:forum.srv.PwThreadList');
/**
 * 版块相关页面
 *
 * @author Jianmin Chen <sky_hold@163.com>
 * @version $Id: ForumController.php 23994 2013-01-18 03:51:46Z long.shi $
 * @package forum
 */

class ForumController extends PwBaseController {

	public function run() {	
			//开启了游客功能.,但是需要强制登陆
		if (!$this->loginUser->isExists()) {
			$this->forwardAction('u/login/run', array('backurl' => WindUrlHelper::createUrl('bbs/forum/my')));
		}
		$order = $this->getInput('order', 'get');
		$page = intval($this->getInput('page', 'get'));
		$threadList = new PwThreadList();
		// $this->runHook('c_thread_run', $forumDisplay);
		$threadList->setPage($page)->setPerpage(Wekit::C('bbs', 'thread.perpage'));
		Wind::import('SRV:forum.srv.threadList.PwNewThread');
		$forbidFids = Wekit::load('forum.srv.PwForumService')->getForbidVisitForum($this->loginUser);
		$dataSource = new PwNewThread($forbidFids);
		if ($order == 'postdate') {
			$dataSource->setOrderBy($order);
		} else {
			$dataSource->setOrderBy('lastpost');
		}
		$threadList->execute($dataSource);
		
		if ($threadList->total > 12000) {
			Wekit::load('forum.PwThreadIndex')->deleteOver($threadList->total - 10000);
		}
		
		$threaddb = $threadList->getList();
		$fids = array();
		foreach ($threaddb as $key => $value) {
		$name = $this->getVender()->getvname($value['v_type']);
			$threaddb[$key]['v_type']=$name['v_name'];
			$fids[] = $value['fid'];
		}
		$forums = Wekit::load('forum.srv.PwForumService')->fetchForum($fids);
		

		$this->setOutput($this->loginUser->uid, 'uid');
		$this->setOutput($threaddb, 'threadList');
		$this->setOutput($forums, 'forums');
		$this->setOutput($threadList->icon, 'icon');
		$this->setOutput($threadList->uploadIcon, 'uploadIcon');
		$this->setOutput(26, 'numofthreadtitle');
		$this->setOutput($order, 'order');
		$this->setOutput($operateThread, 'operateThread');
		$this->setOutput($threadList->page, 'page');
		$this->setOutput($threadList->perpage, 'perpage');
		$this->setOutput($threadList->total, 'count');
		$this->setOutput($threadList->maxPage, 'totalpage');
		$this->setOutput($threadList->getUrlArgs(), 'urlargs');
		
		// seo设置
		Wind::import('SRV:seo.bo.PwSeoBo');
		$seoBo = PwSeoBo::getInstance();
		$lang = Wind::getComponent('i18n');
		$threadList->page <=1 && $seoBo->setDefaultSeo($lang->getMessage('SEO:bbs.forum.run.title'), '', $lang->getMessage('SEO:bbs.forum.run.description'));
		$seoBo->init('bbs', 'new');
		$seoBo->set('{page}', $threadList->page);
		Wekit::setV('seo', $seoBo);
	}
	
	public function getVender(){
		return Wekit::loadDao('forum.dao.PwThreadAddVdenderDap');
	}
	
	
	/**
	 * 我的分享
	 */
	public function myAction() {
			//开启了游客功能.,但是需要强制登陆
		if (!$this->loginUser->isExists()) {
			$this->forwardAction('u/login/run', array('backurl' => WindUrlHelper::createUrl('bbs/forum/my')));
		}
		$order = $this->getInput('order', 'get');
		$page = intval($this->getInput('page', 'get'));
		
		$threadList = new PwThreadList();
		// $this->runHook('c_thread_run', $forumDisplay);
		$threadList->setPage($page)->setPerpage(Wekit::C('bbs', 'thread.perpage'));
		
		Wind::import('SRV:forum.srv.threadList.PwNewThread');
		$forbidFids = Wekit::load('forum.srv.PwForumService')->getForbidVisitForum($this->loginUser);
		$dataSource = new PwNewThread($forbidFids);
		if ($order == 'postdate') {
			$dataSource->setOrderBy($order);
		} else {
			$dataSource->setOrderBy('lastpost');
		}
	
		$threadList->execute($dataSource,$type=2,'','',$this->loginUser->uid);
		
		if ($threadList->total > 12000) {
			Wekit::load('forum.PwThreadIndex')->deleteOver($threadList->total - 10000);
		}
		
		$threaddb = $threadList->getList();
		
		$fids = array();
		foreach ($threaddb as $key => $value) {
		$name = $this->getVender()->getvname($value['v_type']);
			$threaddb[$key]['v_type']=$name['v_name'];
			$fids[] = $value['fid'];
		}
		$forums = Wekit::load('forum.srv.PwForumService')->fetchForum($fids);
		

		$this->setOutput('fenxiang', 'topmenu');
		$this->setOutput('guanzhu', 'menu');
		$this->setOutput($this->loginUser->uid, 'uid');
		$this->setOutput($threaddb, 'threadList');
		$this->setOutput($forums, 'forums');
		$this->setOutput($threadList->icon, 'icon');
		$this->setOutput($threadList->uploadIcon, 'uploadIcon');
		$this->setOutput(26, 'numofthreadtitle');
		$this->setOutput($order, 'order');
		$this->setOutput($operateThread, 'operateThread');
		$this->setOutput($threadList->page, 'page');
		$this->setOutput($threadList->perpage, 'perpage');
		$this->setOutput($threadList->total, 'count');
		$this->setOutput($threadList->maxPage, 'totalpage');
		$this->setOutput($threadList->getUrlArgs(), 'urlargs');
		
		// seo设置
		Wind::import('SRV:seo.bo.PwSeoBo');
		$seoBo = PwSeoBo::getInstance();
		$lang = Wind::getComponent('i18n');
		$seoBo->setCustomSeo($lang->getMessage('SEO:bbs.forum.my.title'), '', '');
		Wekit::setV('seo', $seoBo);
	}
	
	
	
/**
 * 
 * 我的回复
 */
	public function mybackAction(){
		if (!$this->loginUser->isExists()) {
			$this->forwardAction('u/login/run', array('backurl' => WindUrlHelper::createUrl('bbs/forum/my')));
		}
		$order = $this->getInput('order', 'get');
		$page = intval($this->getInput('page', 'get'));
		
		$threadList = new PwThreadList();
		// $this->runHook('c_thread_run', $forumDisplay);
		$threadList->setPage($page)->setPerpage(Wekit::C('bbs', 'thread.perpage'));
		
		Wind::import('SRV:forum.srv.threadList.PwMyForumThread');
		$dataSource = new PwMyForumThread($this->loginUser);

		if ($order == 'postdate') {
			$dataSource->setOrderBy($order);
		} else {
			$dataSource->setOrderBy('lastpost');
		}
		
		$threadList->execute_back($dataSource,$this->loginUser->uid);
	
		$threaddb = $threadList->getList();
		$fids = array();
		foreach ($threaddb as $key => $value) {
			$name = $this->getVender()->getvname($value['v_type']);
			$threaddb[$key]['v_type']=$name['v_name'];
			$fids[] = $value['fid'];
		}
		$forums = Wekit::load('forum.PwForum')->fetchForum($fids);
		
		$this->setOutput('huifu', 'topmenu');
		$this->setOutput('guanzhu', 'menu');
		$this->setOutput($this->loginUser->uid, 'uid');
		$this->setOutput($threaddb, 'threadList');
		$this->setOutput($forums, 'forums');
		$this->setOutput($threadList->icon, 'icon');
		$this->setOutput($threadList->uploadIcon, 'uploadIcon');
		$this->setOutput($order, 'order');
		
		$this->setOutput($threadList->page, 'page');
		$this->setOutput($threadList->perpage, 'perpage');
		$this->setOutput($threadList->total, 'count');
		$this->setOutput($threadList->maxPage, 'totalpage');
		$this->setOutput($threadList->getUrlArgs(), 'urlargs');
		// seo设置
		Wind::import('SRV:seo.bo.PwSeoBo');
		$seoBo = PwSeoBo::getInstance();
		$lang = Wind::getComponent('i18n');
		$seoBo->setCustomSeo($lang->getMessage('SEO:bbs.forum.my.title'), '', '');
		Wekit::setV('seo', $seoBo);
		
	}
	/**
	 * 
	 *器件管理
	 */	
	public function deviceAction(){
		//开启了游客功能.,但是需要强制登陆
		if (!$this->loginUser->isExists()) {
			$this->forwardAction('u/login/run', array('backurl' => WindUrlHelper::createUrl('bbs/forum/my')));
		}
		$order = $this->getInput('order', 'get');
		if ($order == 'postdate') {
			$order='created_time desc ';
		} else {
			$order='lastpost_time desc';
		}
		//首先要查询自己的器件库
		$my_type= $this->getMyType()->getVtype($this->loginUser->uid);
		if($my_type){
				foreach($my_type as $k=>$v){
					if($v['tid']){
						$tids[] = $v['tid'];	
					}
				}
				$t_ids = implode(',',$tids);
				$threaddb = $this->getThreadCredit()->getMyThread($t_ids,$order);
				foreach ($threaddb as $key => $value) {
					$name = $this->getVender()->getvname($value['v_type']);
					$threaddb[$key]['v_type_name']=$name['v_name'];
				}
		}
			$my_typeshow= $this->getMyType()->getVtypeShow($this->loginUser->uid);
			if($my_typeshow){
				foreach($my_typeshow as $k=>$v){
					$my_typeshow[$k]['v_name'] = $this->getVender()->getvname($v['vid']);
				}
			}else{
				$my_typeshow='';
			}
			
		if($_GET['type']){
				$this->setOutput($_GET['type'], 'type');
		}
		$this->setOutput('guanzhu', 'menu');
		$this->setOutput('qijian', 'topmenu');
		$this->setOutput($my_typeshow, 'd_name');
		$this->setOutput($threaddb, 'threadList');
		// seo设置
		Wind::import('SRV:seo.bo.PwSeoBo');
		$seoBo = PwSeoBo::getInstance();
		$lang = Wind::getComponent('i18n');
		$seoBo->setCustomSeo($lang->getMessage('SEO:bbs.forum.my.title'), '', '');
		Wekit::setV('seo', $seoBo);
	}
	
	/*
	*器件删除
	*/
	public function deldeviceAction(){
		$vid = $_POST['vid'];
		$uid = $_POST['uid'];
		$vids = implode(',',$vid);
		if($vid){
			$re = $this->getMyType()->delInType($uid,$vids);
			$this->showMessage('操作成功','/forum/device/',true);
		}else{
			$this->showError('请选择要删除的器件!');
		}
	}
	/*
	*添加器件
	*/
	public function addldeviceAction(){
		$d_name=$_GET['d_name'];
		if($d_name){
			$check_dname= $this->getMyType()->check_vtype($d_name);
			if($check_dname){
					$my_dname= $this->getMyType()->check_my($check_dname['id'],$this->loginUser->uid);
					if($my_dname){
						echo json_encode(array('error'=>'1','info'=>'您已经添加过这个器件啦!'));
					}else{
						$mys_iser_id=$this->getMyType()->add_vtype_my($check_dname['id'],$this->loginUser->uid);
						if($mys_iser_id){
							echo json_encode(array('error'=>'0','info'=>'添加成功'));
						}else{
							echo json_encode(array('error'=>'1','info'=>'亲,添加失败!'));
						}
					}
			}else{
				$iser_id=$this->getMyType()->add_vtype($d_name);
				if($iser_id){
					$mys_iser_id=$this->getMyType()->add_vtype_my($iser_id,$this->loginUser->uid);
					if($mys_iser_id){
						echo json_encode(array('error'=>'0','info'=>'添加成功'));
					}else{
						echo json_encode(array('error'=>'1','info'=>'亲,添加失败!'));
					}
				}else{
					echo json_encode(array('error'=>'1','info'=>'添加失败!'));
				}
			}
		}
		$this->setTemplate('forum_ajax_con');
	}
	
	/**
	 * 
	 * AJAX筛选器件
	 */
	 public function device_stateAction(){
		list($vid,$uid,$state) = $this->getInput(array('vid', 'uid','state'), 'get');
		if($state==1){$state=0;}else{$state=1;}
		$re = $this->getThreadCredit()->savDevice($vid,$uid,$state);
		echo json_encode(array('error'=>'0','info'=>'操作成功'));
		$this->setTemplate('forum_ajax_con');
	 }
	
	public function getThreadCredit(){
		return Wekit::loadDao('forum.dao.PwThreadsDao');
	}
	
	public function getMyType(){
		return Wekit::loadDao('forum.dao.PwThreadAddVdenderDap');
	}
	/**
	 * 
	 * 朋友管理
	 */
	public function firendAction(){		
	if (!$this->loginUser->isExists()) {
			$this->forwardAction('u/login/run', array('backurl' => WindUrlHelper::createUrl('bbs/forum/my')));
		}
		$order = $this->getInput('order', 'get');
		$page = intval($this->getInput('page', 'get'));
		
		$threadList = new PwThreadList();
		// $this->runHook('c_thread_run', $forumDisplay);
		$threadList->setPage($page)->setPerpage(Wekit::C('bbs', 'thread.perpage'));
		
		Wind::import('SRV:forum.srv.threadList.PwMyForumThread');
		$dataSource = new PwMyForumThread($this->loginUser);

		if ($order == 'postdate') {
			$dataSource->setOrderBy($order);
		} else {
			$dataSource->setOrderBy('lastpost');
		}
		//获取朋友ID
		$f_ids = $this->_getDs()->getFollows($this->loginUser->uid);
		if(!$f_ids){
			$f_ids=asd;
		}else{
			foreach($f_ids as $v){
				$fid.=$v['touid'].',';
			}
		}
		$fid=substr($fid,0,-1);
		if($fid)$fname= $this->getThreadCredit()->getUserAll($fid);
		$threadList->execute_back($dataSource,$this->loginUser->uid,'',$f_ids);
		$threaddb = $threadList->getList();
		$fids = array();
		foreach ($threaddb as $key => $value) {
		if($value['v_type']){
			$name = $this->getVender()->getvname($value['v_type']);
		}
		
			$threaddb[$key]['v_type']=$name['v_name'];
			$fids[] = $value['fid'];
		}
		$forums = Wekit::load('forum.PwForum')->fetchForum($fids);
		$this->setOutput('pengyou', 'topmenu');
		$this->setOutput('guanzhu', 'menu');
		$this->setOutput($this->loginUser->uid, 'uid');
		$this->setOutput($fname, 'fname');
		$this->setOutput($threaddb, 'threadList');
		$this->setOutput($forums, 'forums');
		$this->setOutput($threadList->icon, 'icon');
		$this->setOutput($threadList->uploadIcon, 'uploadIcon');
		$this->setOutput($order, 'order');
		$this->setOutput($threadList->page, 'page');
		$this->setOutput($threadList->perpage, 'perpage');
		$this->setOutput($threadList->total, 'count');
		$this->setOutput($threadList->maxPage, 'totalpage');
		$this->setOutput($threadList->getUrlArgs(), 'urlargs');
		// seo设置
		Wind::import('SRV:seo.bo.PwSeoBo');
		$seoBo = PwSeoBo::getInstance();
		$lang = Wind::getComponent('i18n');
		$seoBo->setCustomSeo($lang->getMessage('SEO:bbs.forum.my.title'), '', '');
		Wekit::setV('seo', $seoBo);
	}
	
	protected function _getDs() {
		return Wekit::load('attention.PwAttention');
	}
	/**
	 * 
	 * 追踪管理
	 */
	public function trackAction(){
		if (!$this->loginUser->isExists()) {
			$this->forwardAction('u/login/run', array('backurl' => WindUrlHelper::createUrl('bbs/forum/my')));
		}
		$order = $this->getInput('order', 'get');
		$page = intval($this->getInput('page', 'get'));
		
		$threadList = new PwThreadList();
		// $this->runHook('c_thread_run', $forumDisplay);
		$threadList->setPage($page)->setPerpage(Wekit::C('bbs', 'thread.perpage'));
		
		Wind::import('SRV:forum.srv.threadList.PwMyForumThread');
		$dataSource = new PwMyForumThread($this->loginUser);

		if ($order == 'postdate') {
			$dataSource->setOrderBy($order);
		} else {
			$dataSource->setOrderBy('lastpost');
		}
		$threadList->execute_back($dataSource,$this->loginUser->uid,$track=1);
	
		$threaddb = $threadList->getList();
		$fids = array();
		foreach ($threaddb as $key => $value) {
		$name = $this->getVender()->getvname($value['v_type']);
			$threaddb[$key]['v_type']=$name['v_name'];
			$fids[] = $value['fid'];
		}
		$forums = Wekit::load('forum.PwForum')->fetchForum($fids);
		$this->setOutput('zhuizong', 'topmenu');
		$this->setOutput($this->loginUser->uid, 'uid');
		$this->setOutput($track, 'flag');
		$this->setOutput($threaddb, 'threadList');
		$this->setOutput($forums, 'forums');
		$this->setOutput($threadList->icon, 'icon');
		$this->setOutput($threadList->uploadIcon, 'uploadIcon');
		$this->setOutput($order, 'order');
		$this->setOutput('guanzhu', 'menu');
		$this->setOutput($threadList->page, 'page');
		$this->setOutput($threadList->perpage, 'perpage');
		$this->setOutput($threadList->total, 'count');
		$this->setOutput($threadList->maxPage, 'totalpage');
		$this->setOutput($threadList->getUrlArgs(), 'urlargs');
		// seo设置
		Wind::import('SRV:seo.bo.PwSeoBo');
		$seoBo = PwSeoBo::getInstance();
		$lang = Wind::getComponent('i18n');
		$seoBo->setCustomSeo($lang->getMessage('SEO:bbs.forum.my.title'), '', '');
		Wekit::setV('seo', $seoBo);
	}
	/**
	 * Ajax添加追踪列表
	 */
		public function ajax_conAction(){
			$tid=$_GET['tid'];
			$fuid=$_GET['uid'];
			if($fuid==$this->loginUser->uid){
					$arr = array('error'=>1,'msg'=>'亲,不能关注自己的帖子.');
			}else{
				$uid = $this->loginUser->uid;
				if($tid && $uid){
					if($_GET['type']=='del'){
							$isDel=$this->getTrack()->delTrack($tid,$uid);
							$arr = array('error'=>0,'msg'=>'取消成功');
					}else{
						$is_exist=$this->getTrack()->check_ok($tid,$uid);
						if(empty($is_exist)){
								$isAdd=$this->getTrack()->addTrack($tid,$uid);
								$sum =  $this->getThreadCredit()->getCredit($uid);
								$title= $this->getThreadCredit()->getThread($tid);
								$msg=$this->loginUser->username."关注了您的帖子,标题为:".$title['subject'];
								$this->getThreadCredit()->addNotice($fuid,$msg,$sum['notices']+1,$time=time());
								$arr = array('error'=>0,'msg'=>'关注成功');
						}else{
							$arr = array('error'=>1,'msg'=>'这篇帖子您已经关注过了.');
						}
					}
				}
			}
			echo json_encode($arr);
		}

	/**
	 * 
	 * 推荐管理
	 */
	public function warnAction(){
		$this->setOutput('guanzhu', 'menu');
		if (!$this->loginUser->isExists()) {
			$this->forwardAction('u/login/run', array('backurl' => WindUrlHelper::createUrl('bbs/forum/my')));
		}
		$this->setOutput('tuijian', 'topmenu');
		$infos = $this->getThreadCredit()->getwarns($this->loginUser->uid);
		$f_ids = $this->_getDs()->getFollows($this->loginUser->uid);
		if($f_ids){
			foreach($f_ids as $kk=>$vv){
					$u_ids[] = $vv['touid'];
			}
			if($u_ids){
					$all_uids = implode(',',$u_ids);
					$con = $this->getThreadCredit()->getwarns($all_uids);
					if($con){
						foreach($con as $k=>$ko){
							if(strpos($ko['fid'],$this->loginUser->uid)>=0){
										$find_ids[]= $ko;
							}
						}
					}
					$new_ids= array_merge($infos,$find_ids);
					$count = count($new_ids);
					if($count>1){
							foreach($new_ids as $id){
									$fid[] = $id['id'];
							}
						$ids = implode(',',$fid);
						$new_ids = $this->getThreadCredit()->sortWarns($ids);
					}
					if($new_ids){
							foreach($new_ids as $k=>$v){
								$c_user = $this->getThreadCredit()->getUser($v['created_id']);
								$f_user_all= $this->getThreadCredit()->getUserAll($v['fid']);
								$t_info = $this->getThreadCredit()->getThread($v['tid']);
								$new_ids[$k]['t_info']=$t_info;
								$new_ids[$k]['cread_name']=$c_user['username'];
								$new_ids[$k]['fid_name']=$f_user_all;
							}
					}
					
					$this->setOutput($new_ids, 'threadList');
			}
			
			
		
		// seo设置
		Wind::import('SRV:seo.bo.PwSeoBo');
		$seoBo = PwSeoBo::getInstance();
		$lang = Wind::getComponent('i18n');
		$seoBo->setCustomSeo($lang->getMessage('SEO:bbs.forum.my.title'), '', '');
		Wekit::setV('seo', $seoBo);
		}
	
		
		
		
		// seo设置
		Wind::import('SRV:seo.bo.PwSeoBo');
		$seoBo = PwSeoBo::getInstance();
		$lang = Wind::getComponent('i18n');
		$seoBo->setCustomSeo($lang->getMessage('SEO:bbs.forum.my.title'), '', '');
		Wekit::setV('seo', $seoBo);
	}
	
	
	/**
	 * 难题模块
	 */
	public function puzzleAction() {
		if (!$this->loginUser->isExists()) {
			$this->forwardAction('u/login/run', array('backurl' => WindUrlHelper::createUrl('bbs/forum/my')));
		}
		// $hot = $_GET['type'];
		$hot = 0;
		$solveType = $this->getInput('solveType', 'get');
		if ($solveType != 'allnanti' && $solveType != 'yesnanti' && $solveType != 'nonanti') {
			$solveType = 'allnanti';
		}
		
		$order = $this->getInput('order', 'get');
		if ($order != 'postdate' && $order != 'replies' && $order != 'lastpost') {
			$order = 'lastpost';
		} 
		$page = intval($this->getInput('page', 'get'));
		$threadList = new PwThreadList();
		// $this->runHook('c_thread_run', $forumDisplay);
		$threadList->setPage($page)->setPerpage(Wekit::C('bbs', 'thread.perpage'));
		
		Wind::import('SRV:forum.srv.threadList.PwNewThread');
		$forbidFids = Wekit::load('forum.srv.PwForumService')->getForbidVisitForum($this->loginUser);
		$dataSource = new PwNewThread($forbidFids);
		$dataSource->setOrderBy($order);
		$dataSource->setSolveType($solveType);
		$threadList->execute($dataSource,$type=1,$puzzle=1,$hits=1);
		if($hot){
			$threaddb = $threadList->getList_list();
		}else{
			$threaddb = $threadList->getList();
		}
		if ($threadList->total > 12000) {
			Wekit::load('forum.PwThreadIndex')->deleteOver($threadList->total - 10000);
		}
		/*
		if($hot){

			$threaddb = $threadList->getList_list();
		}else{
			var_dump("<LLLLLLLLLLLLL>>>>");
			$threaddb = $threadList->getList();
		}
		*/
		$fids = array();
		foreach ($threaddb as $key => $value) {
		$name = $this->getVender()->getvname($value['v_type']);
			$threaddb[$key]['v_type']=$name['v_name'];
			$fids[] = $value['fid'];
		}
		$forums = Wekit::load('forum.srv.PwForumService')->fetchForum($fids);
		/*
		if($hot){
			$this->setOutput('hot', 'menu');
		}else{
			$this->setOutput('nanti', 'menu');
		}	
		*/
		$this->setOutput($solveType, 'solveType');
		$this->setOutput($this->loginUser->uid, 'uid');
		$this->setOutput($threaddb, 'threadList');
		$this->setOutput(count($threaddb), 'cnt');
		$this->setOutput($forums, 'forums');
		$this->setOutput($threadList->icon, 'icon');
		$this->setOutput($threadList->uploadIcon, 'uploadIcon');
		$this->setOutput($order, 'order');
		
		$this->setOutput($threadList->page, 'page');
		$this->setOutput($threadList->perpage, 'perpage');
		$this->setOutput($threadList->total, 'count');
		$this->setOutput($threadList->maxPage, 'totalpage');
		$this->setOutput($threadList->getUrlArgs(), 'urlargs');
		
		// seo设置
		Wind::import('SRV:seo.bo.PwSeoBo');
		$seoBo = PwSeoBo::getInstance();
		$lang = Wind::getComponent('i18n');
		$seoBo->setCustomSeo($lang->getMessage('SEO:bbs.forum.my.title'), '', '');
		Wekit::setV('seo', $seoBo);
	}

	/**
	 * 加载追踪模型
	 */
	public function getTrack(){
		return Wekit::loadDao('forum.dao.PwThreadConcernedDao');
	}
	
	/**
	 * 分类浏览
	 */	
	public function sortAction(){
			//开启了游客功能.,但是需要强制登陆
		if (!$this->loginUser->isExists()) {
			$this->forwardAction('u/login/run', array('backurl' => WindUrlHelper::createUrl('bbs/forum/my')));
		}
		$order = $this->getInput('order', 'get');
		$page = intval($this->getInput('page', 'get'));
		$threadList = new PwThreadList();
		// $this->runHook('c_thread_run', $forumDisplay);
		$threadList->setPage($page)->setPerpage(Wekit::C('bbs', 'thread.perpage'));
		Wind::import('SRV:forum.srv.threadList.PwNewThread');
		$forbidFids = Wekit::load('forum.srv.PwForumService')->getForbidVisitForum($this->loginUser);
		$dataSource = new PwNewThread($forbidFids);
		if ($order == 'postdate') {
			$dataSource->setOrderBy($order);
		} else {
			$dataSource->setOrderBy('lastpost');
		}
		$threadList->execute($dataSource);
		if ($threadList->total > 12000) {
			Wekit::load('forum.PwThreadIndex')->deleteOver($threadList->total - 10000);
		}
		
		$threaddb = $threadList->getList();
		$fids = array();
		foreach ($threaddb as $key => $value) {
		$name = $this->getVender()->getvname($value['v_type']);
			$threaddb[$key]['v_type']=$name['v_name'];
			$fids[] = $value['fid'];
		}
		$forums = Wekit::load('forum.srv.PwForumService')->fetchForum($fids);
		
		$this->setOutput('fenlei', 'menu');
		$this->setOutput($this->loginUser->uid, 'uid');
		$this->setOutput($threaddb, 'threadList');
		$this->setOutput($forums, 'forums');
		$this->setOutput($threadList->icon, 'icon');
		$this->setOutput($threadList->uploadIcon, 'uploadIcon');
		$this->setOutput(26, 'numofthreadtitle');
		$this->setOutput($order, 'order');
		$this->setOutput($operateThread, 'operateThread');
		$this->setOutput($threadList->page, 'page');
		$this->setOutput($threadList->perpage, 'perpage');
		$this->setOutput($threadList->total, 'count');
		$this->setOutput($threadList->maxPage, 'totalpage');
		$this->setOutput($threadList->getUrlArgs(), 'urlargs');
	
		Wind::import('SRV:seo.bo.PwSeoBo');
		$seoBo = PwSeoBo::getInstance();
		$lang = Wind::getComponent('i18n');
		$seoBo->setCustomSeo($lang->getMessage('SEO:bbs.forum.my.title'), '', '');
		Wekit::setV('seo', $seoBo);
	}
	
	
	/**
	 * 版块列表 弹窗
	 */
	public function listAction() {
		$withMyforum = $this->getInput('withMyforum');
		$service = Wekit::load('forum.srv.PwForumService');
		$forums = $service->getForumList();
		$map = $service->getForumMap();
		$cate = array();
		$forum = array();
		foreach ($map[0] as $key => $value) {
			if (!$value['isshow']) continue;
			$array = $service->findOptionInMap($value['fid'], $map, 
				array('sub' => '--', 'sub2' => '----'));
			$tmp = array();
			foreach ($array as $k => $v) {
				if ($forums[$k]['isshow'] && (!$forums[$k]['allow_post'] || $this->loginUser->inGroup(
					explode(',', $forums[$k]['allow_post'])))) {
					$tmp[] = array($k, strip_tags($v));
				}
			}
			if ($tmp) {
				$cate[] = array($value['fid'], strip_tags($value['name']));
				$forum[$value['fid']] = $tmp;
			}
		}
		if ($withMyforum && $this->loginUser->isExists()
			&& ($joinForum = Wekit::load('forum.PwForumUser')->getFroumByUid($this->loginUser->uid))) {
			$tmp = array();
			foreach ($joinForum as $key => $value) {
				if (!$key) continue;
				$tmp[] = array($key, strip_tags($forums[$key]['name']));
			}
			array_unshift($cate, array('my', '我的版块'));
			$forum['my'] = $tmp;
		}
		$response = array('cate' => $cate, 'forum' => $forum);
		$this->setOutput(Pw::jsonEncode($response), 'data');
		$this->showMessage('success');
	}

	/**
	 * 加入版块
	 */
	public function joinAction() {
		$fid = $this->getInput('fid');
		Wind::import('SRV:forum.bo.PwForumBo');
		$forum = new PwForumBo($fid);
		if (!$forum->isForum()) {
			$this->showError('BBS:forum.exists.not');
		}
		if (!$this->loginUser->isExists()) {
			$this->showError('login.not');
		}
		if (Wekit::load('forum.PwForumUser')->get($this->loginUser->uid, $fid)) {
			$this->showError('BBS:forum.join.already');
		}
		Wekit::load('forum.PwForumUser')->join($this->loginUser->uid, $fid);
		$this->_addJoionForum($this->loginUser->info, $forum->foruminfo);
		$this->showMessage('success');
	}

	/**
	 * 退出版块
	 */
	public function quitAction() {
		$fid = $this->getInput('fid');
		Wind::import('SRV:forum.bo.PwForumBo');
		$forum = new PwForumBo($fid);
		if (!$forum->isForum()) {
			$this->showError('BBS:forum.exists.not');
		}
		if (!$this->loginUser->isExists()) {
			$this->showError('login.not');
		}
		if (!Wekit::load('forum.PwForumUser')->get($this->loginUser->uid, $fid)) {
			$this->showError('BBS:forum.join.not');
		}
		Wekit::load('forum.PwForumUser')->quit($this->loginUser->uid, $fid);
		$this->_removeJoionForum($this->loginUser->info, $fid);
		$this->showMessage('success');
	}

	public function topictypeAction() {
		$fid = $this->getInput('fid');
		$topictypes = Wekit::load('forum.PwTopicType')->getTopicTypesByFid($fid, !$this->loginUser->getPermission('operate_thread.type'));
		$data = array();
		foreach ($topictypes['topic_types'] as $key => $value) {
			$tmp = array('title' => strip_tags($value['name']), 'val' => $value['id']);
			if (isset($topictypes['sub_topic_types'][$value['id']])) {
				$sub = array();
				foreach ($topictypes['sub_topic_types'][$value['id']] as $k => $v) {
					$sub[] = array('title' => strip_tags($v['name']), 'val' => $v['id']);
				}
				$tmp['items'] = $sub;
			}
			$data[] = $tmp;
		}
		$this->setOutput($data, 'data');
		$this->showMessage('success');
	}

	/**
	 * 进入版块的密码
	 */
	public function passwordAction() {
		$fid = $this->getInput('fid');
		$this->setOutput($fid, 'fid');
		$this->setLayout('TPL:common.layout_error');
	}

	/**
	 * 验证版块密码
	 */
	public function verifyAction() {
		$fid = $this->getInput('fid');
		$password = $this->getInput('password', 'post');
		Wind::import('SRV:forum.bo.PwForumBo');
		$forum = new PwForumBo($fid);
		if (!$forum->isForum(true)) {
			$this->showError('BBS:forum.exists.not');
		}
		if (md5($password) != $forum->foruminfo['password']) {
			$this->showError('BBS:forum.password.error');
		}
		Pw::setCookie('fp_' . $fid, Pw::getPwdCode(md5($password)), 86400);
		$this->showMessage('success');
	}
	
	/**
	 * 格式化数据  把字符串"1,版块1,2,版块2"格式化为数组
	 *
	 * @param string $string
	 * @return array
	 */
	public static function splitStringToArray($string) {
		$a = explode(',', $string);
		$l = count($a);
		$l % 2 == 1 && $l--;
		$r = array();
		for ($i = 0; $i < $l; $i+=2) {
			$r[$a[$i]] = $a[$i+1];
		}
		return $r;
	}
	
	/**
	 * 加入版块 - 更新我的版块缓存数据
	 *
	 * @param array $userInfo
	 * @param array $foruminfo
	 * @return boolean
	 */
	private function _addJoionForum($userInfo,$foruminfo) {
		// 更新用户data表信息
		$array = array();
		$userInfo['join_forum'] && $array = self::splitStringToArray($userInfo['join_forum']);
		$array = array($foruminfo['fid'] => $foruminfo['name']) + $array;
		count($array) > 20 && $array = array_slice($array, 0, 20, true);
		
		$this->_updateMyForumCache($userInfo['uid'], $array);
		return true;
	}
	
	/**
	 * 推出版块 - 更新我的版块缓存数据
	 *
	 * @param array $userInfo
	 * @param int $fid
	 * @return boolean
	 */
	private function _removeJoionForum($userInfo,$fid) {
		// 更新用户data表信息
		$userInfo['join_forum'] && $array = self::splitStringToArray($userInfo['join_forum']);
		unset($array[$fid]);
		
		$this->_updateMyForumCache($userInfo['uid'], $array);
		return true;
	}

	private function _updateMyForumCache($uid, $array) {
		$joinForums = Wekit::load('forum.srv.PwForumService')->getJoinForum($uid);
		$_tmpArray = array();
		foreach ($array as $k => $v) {
			if (!isset($joinForums[$k])) continue;
			$_tmpArray[$k] = strip_tags($joinForums[$k]);
		}
		
		Wind::import('SRV:user.dm.PwUserInfoDm');
		$dm = new PwUserInfoDm($uid);
		$dm->setJoinForum(self::_formatJoinForum($_tmpArray));
		return $this->_getUserDs()->editUser($dm, PwUser::FETCH_DATA);	
	}
	
	/**
	 * 格式化我的版块缓存数据结构
	 *
	 * @param array $array 格式化成"1,版块1,2,版块2"
	 * @return string
	 */
	private static function _formatJoinForum($array) {
		if (!$array) return false;
		$user = '';
		foreach ($array as $fid => $name) {
			$myForum .= $fid . ',' . $name . ',';
		}
		return rtrim($myForum,',');
	}
	
	/**
	 * @return PwUser
	 */
	private function _getUserDs(){
		return Wekit::load('user.PwUser');
	}
	
	/**
	 * @return PwForum
	 */
	private function _getForumService() {
		return Wekit::load('forum.PwForum');
	}
}