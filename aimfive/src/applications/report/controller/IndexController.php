<?php

/**
 * 举报Controller
 *
 * @author jinlong.panjl <jinlong.panjl@aliyun-inc.com>
 * @copyright ©2003-2103 phpwind.com
 * @license http://www.phpwind.com
 * @version $Id$
 * @package wind
 */

class IndexController extends PwBaseController {
	
	public function beforeAction($handlerAdapter) {
		parent::beforeAction($handlerAdapter);
		if (!$this->loginUser->isExists()) {
			$this->forwardAction('u/login/run',array('backurl' => WindUrlHelper::createUrl('my/article/run')));
		}
		if (!$this->loginUser->getPermission('allow_report')) {
			$this->showError(array('report.allow',array('{grouptitle}' => $this->loginUser->getGroupInfo('name'))));
		}
	}
	
	/**
	 * 举报弹窗
	 *
	 * @return void
	 */
	public function reportAction() {
		list($type,$type_id) = $this->getInput(array('type','type_id'));
		$this->setOutput($type, 'type');
		$this->setOutput($type_id, 'type_id');
	}
	
	/**
	 * 邀请弹窗
	 *
	 * @return void
	 */
	public function warnAction() {
		list($loginuid,$tid) = $this->getInput(array('loginuid','tid'));
		if($loginuid){
			$f_ids = $this->_getDs()->getFans($loginuid);
			
			if($f_ids){
				foreach($f_ids as $kk=>$vv){
						$u_ids[] = $vv['uid'];
				}
				$u_ids=implode(',',$u_ids);
				$u_name = $this->getThread()->getUserAll($u_ids);
				$this->setOutput($u_name, 'u_name');
				$this->setOutput($loginuid, 'loginuid');
				$this->setOutput($tid, 'tid');
			}else{
				return false;
			}
		}
	}
	
	/**
	 * 提交邀请
	 *
	 * @return void
	 */
	public function addwarnAction() {
		$carid= $_POST['uid'];
		$tid= $_POST['tid'];
		$fids = implode(',',$_POST['se_type']);
		$check= $this->getThread()->checkwarns($carid,$tid,$fids);
		if(!$check){
			$re = $this->getThread()->addwarns($carid,$tid,$fids,$time=time());
			if($re){
				$this->showMessage('推荐邀请成功',"/jump/?tid=$tid",true);
			}
		}else{
				$this->showMessage('请不要重复邀请',"/jump/?tid=$tid",true);
		}
	}
	
	
	/**
	 * Email弹窗
	 *
	 * @return void
	 */
	public function emailAction() {
		list($loginuid,$tid) = $this->getInput(array('loginuid','tid'));
		if($loginuid){
			$f_ids = $this->_getDs()->getFollows($loginuid);
			if($f_ids){
				foreach($f_ids as $kk=>$vv){
					$u_ids[] = $vv['touid'];
					}
				$u_ids=implode(',',$u_ids);
				$u_name = $this->getThread()->getUserAll($u_ids);
				$this->setOutput($u_name, 'u_name');
				$this->setOutput($loginuid, 'loginuid');
				$this->setOutput($tid, 'tid');
			}else{
				$this->setOutput($tid, 'tid');
				$this->setTemplate('index_selemail');
			}
		}
	}
	
	public function selemailAction(){
	
		list($tid) = $this->getInput(array('tid'));
		$userid=implode(',',$_POST['se_type']);
		$email_user=array();
		if($userid){
			$u_email=$this->getThread()->getUserAll($userid);
			foreach($u_email as $v){
				$email_user[]=$v['email'];
			}
		}
		$text_email=explode(',',$_POST['textemail']);
		$toEmail=array_merge($email_user,$text_email);
		//获取激活码
		$pwInviteUrlLogSrv = Wekit::load('invite.srv.PwInviteFriendService');
		$invite = $pwInviteUrlLogSrv->createInviteCode($this->loginUser->uid);
		$cusername= $this->getThread()->getUser($this->loginUser->uid);
		$url = WindUrlHelper::createUrl('u/register/run', array('invite' => $invite));
		$url ="如果您还是不是[".$cusername['username']."]的好友,请点击此链接:<a href='$url'>$url</a>";
		$turl = 'http://'.$_SERVER['HTTP_HOST']."/read.php?tid=$tid&fid=2";
		$turl ="您的好友[".$cusername['username']."]邀请您关注此文章,请登录后点击链接:<a href='$turl'>$turl</a>";
		$contents=$turl.'<br>'.$url;
		Wind::import('LIB:utility.PwMail');
		list($fromEmail) = $this->getInput(array('fromEmail'), 'post');
		$mail = new PwMail();
		$title = Wekit::C('site', 'info.name') . ' 好友邀请您关注.';
		$content = $contents;
		foreach($toEmail as $v){
			if($v){
				$result = $mail->sendMail($v, $title, $content);
			}	
		}
		if ($result === true) {
			$this->showMessage('ADMIN:email.test.success',"/jump/?tid=$tid",true);
		}
		$i18n = Wind::getComponent('i18n');
		$this->showError(array('ADMIN:email.test.error', array('{error}' => $i18n->getMessage($result->getError()))));
	}

	
	public function getThread(){
		return Wekit::loadDao('forum.dao.PwThreadsDao');
	}
	
	protected function _getDs() {
		return Wekit::load('attention.PwAttention');
	}
	
	/**
	 * do举报
	 *
	 * @return void
	 */
	public function doReportAction() {
		list($type, $type_id, $reason) = $this->getInput(array('type', 'type_id', 'reason'));
		$report = Wekit::load('report.srv.PwReportService');
		$result = $report->sendReport($type,$type_id,$reason);
		if ($result instanceof PwError) {
			$this->showError($result->getError());
		}
		$this->showMessage('success');
	}
}
