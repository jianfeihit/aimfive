<?php

Wind::import('SRV:forum.srv.PwThreadDisplay');
Wind::import('SRV:credit.bo.PwCreditBo');

/**
 * 帖子阅读页
 *
 * @author Jianmin Chen <sky_hold@163.com>
 * @license http://www.phpwind.com
 * @version $Id: ReadController.php 24888 2013-02-25 08:12:54Z jieyin $
 * @package forum
 */
class ReadController extends PwBaseController {

	/**
	 * 帖子阅读页
	 */
	public function run() {
		if (!$this->loginUser->isExists()) {
			$this->forwardAction('u/login/run', array('backurl' => WindUrlHelper::createUrl('bbs/forum/my')));
		}
		$tid = intval($this->getInput('tid'));
		list($page, $uid, $desc) = $this->getInput(array('page', 'uid', 'desc'), 'get');
		
		$threadDisplay = new PwThreadDisplay($tid, $this->loginUser);
		$this->runHook('c_read_run', $threadDisplay);
		
		if (($result = $threadDisplay->check()) !== true) {
			$this->showError($result->getError());
		}
		$_cache = Wekit::cache()->fetch(array('level', 'group_right'));

		$pwforum = $threadDisplay->getForum();
		if ($pwforum->foruminfo['password']) {
			if (!$this->loginUser->isExists()) {
				$this->forwardAction('u/login/run', array('backurl' => WindUrlHelper::createUrl('bbs/cate/run', array('fid' => $$pwforum->fid))));
			} elseif (Pw::getPwdCode($pwforum->foruminfo['password']) != Pw::getCookie('fp_' . $pwforum->fid)) {
				$this->forwardAction('bbs/forum/password', array('fid' => $pwforum->fid));
			}
		}
		if ($uid) {
			Wind::import('SRV:forum.srv.threadDisplay.PwUserRead');
			$dataSource = new PwUserRead($threadDisplay->thread, $uid);
		} else {
			Wind::import('SRV:forum.srv.threadDisplay.PwCommonRead');
			$dataSource = new PwCommonRead($threadDisplay->thread);
		}
		$dataSource->setPage($page)
			->setPerpage($pwforum->forumset['readperpage'] ? $pwforum->forumset['readperpage'] : Wekit::C('bbs', 'read.perpage'))
			->setDesc($desc);
		
		$threadDisplay->setImgLazy(Wekit::C('bbs', 'read.image_lazy'));
		$threadDisplay->execute($dataSource);
		
		$operateReply = $operateThread = array();
		$isBM = $pwforum->isBM($this->loginUser->username);
		if ($threadPermission = $this->loginUser->getPermission('operate_thread', $isBM, array())) {
			$operateReply = Pw::subArray(
				$threadPermission, 
				array('toppedreply',/* 'unite', 'split',  */'remind', 'shield', 'delete', 'ban', 'inspect', 'read')
			);
			$operateThread = Pw::subArray(
				$threadPermission, 
				array(
					'digest', 'topped', 'up', 'highlight', 
					'copy', 
					'type', 'move', /*'unite', 'print' */ 'lock', 
					'down', 
					'delete', 
					'ban'
				)
			);
		}
		$arr= $threadDisplay->getList();
		foreach($arr as $k=>$v){
			if($v['v_type']){
				$name = $this->getVender()->getvname($v['v_type']);
			}
			$arr[$k]['v_type']=$name['v_name'];
			if($v['select_id']){
				$re = $this->getPosts()->getOnePost($v['select_id']);				
			}
		}
		
		if(!empty($re)){
			$arr[0]['p_content']=$re['content'];
		}
		
	
		
		$threadInfo = $threadDisplay->getThreadInfo();
		$this->setOutput($threadDisplay, 'threadDisplay');
		$this->setOutput($tid, 'tid');
		$this->setOutput($threadDisplay->fid, 'fid');
		$this->setOutput($threadInfo, 'threadInfo');
		$this->setOutput($arr, 'readdb');
		$this->setOutput($this->loginUser->uid, 'loginuid');
		$this->setOutput($threadDisplay->getUsers(), 'users');
		$this->setOutput($pwforum, 'pwforum');
		$this->setOutput(PwCreditBo::getInstance(), 'creditBo');
		$this->setOutput($threadDisplay->getHeadguide(), 'headguide');
		$this->setOutput(Wekit::C('bbs', 'read.display_member_info'), 'displayMemberInfo');
		$this->setOutput(Wekit::C('bbs', 'read.display_info'), 'displayInfo');
		$this->setOutput(Wekit::C('bbs', 'thread.hotthread_replies'), 'hotIcon');

		$this->setOutput($threadPermission, 'threadPermission');
		$this->setOutput($operateThread, 'operateThread');
		$this->setOutput($operateReply, 'operateReply');
		$this->setOutput((!$this->loginUser->uid && !$this->allowPost($pwforum)) ? ' J_qlogin_trigger' : '', 'postNeedLogin');
		$this->setOutput((!$this->loginUser->uid && !$this->allowReply($pwforum)) ? ' J_qlogin_trigger' : '', 'replyNeedLogin');
		
		$this->setOutput($_cache['level']['ltitle'], 'ltitle');
		$this->setOutput($_cache['level']['lpic'], 'lpic');
		$this->setOutput($_cache['level']['lneed'], 'lneed');
		$this->setOutput($_cache['group_right'], 'groupRight');
		
		$this->setOutput($threadDisplay->page, 'page');
		$this->setOutput($threadDisplay->perpage, 'perpage');
		$this->setOutput($threadDisplay->total, 'count');
		$this->setOutput($threadDisplay->maxpage, 'totalpage');
		$this->setOutput($threadDisplay->getUrlArgs(), 'urlargs');
		$this->setOutput($threadDisplay->getUrlArgs('desc'), 'urlDescArgs');
		$this->setOutput($this->loginUser->getPermission('look_thread_log', $isBM, array()), 'canLook');
		$this->setOutput($this->_getFpage($threadDisplay->fid), 'fpage');
		
		//版块风格
		if ($pwforum->foruminfo['style']) {
			$this->setTheme('forum', $pwforum->foruminfo['style']);
			//$this->addCompileDir($pwforum->foruminfo['style']);
		}
		
		
		
		// seo设置
		Wind::import('SRV:seo.bo.PwSeoBo');
		$seoBo = PwSeoBo::getInstance();
		$lang = Wind::getComponent('i18n');
		$threadDisplay->page <=1 && $seoBo->setDefaultSeo($lang->getMessage('SEO:bbs.read.run.title'), '', $lang->getMessage('SEO:bbs.read.run.description'));
		$seoBo->init('bbs', 'read');
		$seoBo->set(
			array(
				'{forumname}' => $threadDisplay->forum->foruminfo['name'], 
				'{title}' => $threadDisplay->thread->info['subject'], 
				'{description}' => Pw::substrs($threadDisplay->thread->info['content'], 100, 0, false), 
				'{classfication}' => $threadDisplay->thread->info['topic_type'], 
				'{tags}' => $threadInfo['tags'],
				'{page}' => $threadDisplay->page
			)
		);
		Wekit::setV('seo', $seoBo);
		//是否显示回复
		$showReply = true;
		//锁定时间
		if ($pwforum->forumset['locktime'] && ($threadInfo['created_time'] + $pwforum->forumset['locktime'] * 86400) < Pw::getTime()) {
			$showReply = false;
		} elseif (Pw::getstatus($threadInfo['tpcstatus'], PwThread::STATUS_LOCKED) && !$this->loginUser->getPermission('reply_locked_threads')) {
			$showReply = false;
		}
		$this->setOutput($showReply, 'showReply');
		$this->runReadDesign($threadDisplay->fid);
		$this->updateReadOnline($threadDisplay->fid, $tid);
	}

		public function getVender(){
		return Wekit::loadDao('forum.dao.PwThreadAddVdenderDap');
	}
	
		protected function _getDs() {
		return Wekit::load('attention.PwAttention');
	}
	/*
	*Ajax 选择正确答案
	*/
	function ajaxGoodsAction(){
		list($tid, $uid,$pid,$lou) = $this->getInput(array('tid', 'uid','pid','lou'));
		$credit = $this->getThread()->getCredit($uid);	//查询积分的方法
		$userInfo = $this->getThread()->getUser($uid);	//查询指定用户信息
		$re_jf=$this->getThread()->getThread($tid);		//查询单条信息
		 $res= $this->getThread()->addSelect($tid,$pid,$lou); 	//修改解决状态并添加回复ID
		if($res){
			$sum = $credit['credit2']+$re_jf['jf'];	//计算积分
			$sum2 = $credit['credit3']+1;		//计算能力值
			$sum3=	$credit['notices']+1;		//计算提醒通知条数
			$jf = $this->getThread()->savCredit($uid,$sum,$sum2,$sum3);						//增加积分和能力值及提醒通知条数
			$msg = "您的回复被".$this->loginUser->username."选为最佳答案,积分增加".$re_jf['jf']."点,能力增加1点.";
			$notice = $this->getThread()->addNotices($uid,$msg,$time=time());		
			$info =$this->loginUser->username."获取主题悬赏".$re_jf['jf']." 积分;积分变化【积分:+ ".$re_jf['jf']." 】";
			$logre = $this->getThread()->addLogCredit($userInfo['uid'],$userInfo['username'],$time=time());				//增加能力日志的方法
			$this->getThread()->addLogCreditjf($this->loginUser->uid,$this->loginUser->username,$info,$time=time());				//增加积分日志的方法
			echo json_encode(array(
						'info'=>'选择成功'
			));
		}
		$this->setTemplate('forum_ajax_con');
	}
	
	/*
	*Ajax 补充内容
	*/
	function ajaxaddconAction(){
		list($tid, $con) = $this->getInput(array('tid', 'con'));
	
		$this->getThread()->addcon($tid,$con);
		echo json_encode(array(
						'info'=>'补充成功'
			));
		$this->setTemplate('forum_ajax_con');
	}	
	
	/**
	 * 帖子阅读页-楼层跳转
	 */
	public function jumpAction() {
		$tid = $this->getInput('tid');
		$pid = $this->getInput('pid');
		if (!$tid) {
			$post = Wekit::load('forum.PwThread')->getPost($pid);
			$tid = $post['tid'];
		}
		Wind::import('SRV:forum.bo.PwForumBo');
		$thread = Wekit::load('forum.PwThread')->getThread($tid);
		$pwforum = new PwForumBo($thread['fid']);
		$perpage = $pwforum->forumset['readperpage'] ? $pwforum->forumset['readperpage'] : Wekit::C('bbs', 'read.perpage');
		$count = Wekit::load('forum.PwThread')->countPostByTidUnderPid($tid, $pid) + 1;
		$page = ceil(($count + 1) / $perpage);
		
		$this->forwardRedirect(WindUrlHelper::createUrl('bbs/read/run/', array('tid' => $tid, 'fid' => $thread['fid'], 'page' => $page), $pid));
	}

	/**
	 * 帖子阅读页-下一页
	 */
	public function nextAction() {
		$tid = $this->getInput('tid');
		$thread = Wekit::load('forum.PwThread')->getThread($tid);
		if (!$thread) {
			$this->showError('thread.not');
		}
		$nextThread = Wekit::load('forum.PwThreadExpand')->getThreadByFidUnderTime($thread['fid'], $thread['lastpost_time'], 1);
		if ($nextThread) {
			$nextTid = key($nextThread);
			$this->forwardRedirect(WindUrlHelper::createUrl('bbs/read/run/', array('tid' => $nextTid, 'fid' => $thread['fid'])));
		} else {
			$this->forwardRedirect(WindUrlHelper::createUrl('bbs/thread/run/', array('fid' => $thread['fid'])));
		}
	}

	/**
	 * 帖子阅读页-上一页
	 */
	public function preAction() {
		$tid = $this->getInput('tid');
		$thread = Wekit::load('forum.PwThread')->getThread($tid);
		if (!$thread) {
			$this->showError('thread.not');
		}
		$preThread = Wekit::load('forum.PwThreadExpand')->getThreadByFidOverTime($thread['fid'], $thread['lastpost_time'], 1);
		if ($preThread) {
			$preTid = key($preThread);
			$this->forwardRedirect(WindUrlHelper::createUrl('bbs/read/run/', array('tid' => $preTid, 'fid' => $thread['fid'])));
		} else {
			$this->forwardRedirect(WindUrlHelper::createUrl('bbs/thread/run/', array('fid' => $thread['fid'])));
		}
	}

	/**
	 * 查看帖子操作日志
	 */
	public function logAction() {
		list($tid, $fid) = $this->getInput(array('tid', 'fid'));
		Wind::import('SRV:forum.bo.PwForumBo');
		$forum = new PwForumBo($fid);
		$permission = $this->loginUser->getPermission('look_thread_log', $forum->isBM($this->loginUser->username), array());
		if ($permission) {
			$list = Wekit::load('log.srv.PwLogService')->getThreadLog($tid, 25, 0);
			$this->setOutput($list, 'list');
			$this->setTemplate('read_log');
		} 
	}
	
	/**
	 * 更新阅读页在线状态
	 */
	protected function updateReadOnline($fid = 0, $tid = 0) {
		if ($this->loginUser->uid < 1) return false;
		$service = Wekit::load('online.srv.PwOnlineService');
		$createdTime = $service->forumOnline($fid);
		if (!$createdTime) return false;
		$dm = Wekit::load('online.dm.PwOnlineDm');
		$time = Pw::getTime();
		$dm->setUid($this->loginUser->uid)->setUsername($this->loginUser->username)->setModifytime($time)->setCreatedtime($createdTime)->setGid($this->loginUser->gid)->setFid($fid)->setTid($tid)->setRequest($this->_mca);
		Wekit::load('online.PwUserOnline')->replaceInfo($dm);
	}
	
	

	public function getThread(){
		return Wekit::loadDao('forum.dao.PwThreadsDao');
	}
	
		public function getPosts(){
		return Wekit::loadDao('forum.dao.PwPostsDao');
	}
	
	protected function runReadDesign($fid = 0) {
		Wind::import('SRV:design.bo.PwDesignPageBo');
    	$bo = new PwDesignPageBo();
    	$pageid = $bo->getPageId('bbs/read/run', '帖子阅读页', $fid);
		$pageid && $this->forward->getWindView()->compileDir = 'DATA:compile.design.'.$pageid;
		return true;
	}

	private function allowPost(PwForumBo $forum) {
		return $forum->foruminfo['allow_post'] ? $forum->allowPost($this->loginUser) : $this->loginUser->getPermission('allow_post');
	}

	private function allowReply(PwForumBo $forum) {
		return $forum->foruminfo['allow_reply'] ? $forum->allowPost($this->loginUser) : $this->loginUser->getPermission('allow_reply');
	}

	private function _getFpage($fid) {
		$fpage = 1;
		if ($referer = Pw::getCookie('visit_referer')) {
			$tmp = explode('_', $referer);
			if ($tmp[0] == 'fid' && $tmp[1] == $fid) {
				$fpage = intval($tmp[3]);
			}
		}
		return $fpage;
	}
}