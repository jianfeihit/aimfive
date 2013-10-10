<?php
Wind::import('APPS:space.controller.SpaceBaseController');
/**
 * the last known user to change this file in the repository <$LastChangedBy$>
 * 
 * @author $Author$ Foxsee@aliyun.com
 * @copyright ?2003-2103 phpwind.com
 * @license http://www.phpwind.com
 * @version $Id$
 * @package
 *
 */
class ProfileController extends SpaceBaseController {

	/**
	 * 用户资料
	 */
	public function run() {
		$lang = Wind::getComponent('i18n');
		$gid = ($this->space->spaceUser['groupid'] == 0) ? $this->space->spaceUser['memberid'] : $this->space->spaceUser['groupid'];
		$group = Wekit::load('usergroup.PwUserGroups')->getGroupByGid($gid);
		$constellation = Wekit::load('space.srv.PwSpaceService')->getConstellation(
		$this->space->spaceUser['byear'], $this->space->spaceUser['bmonth'], 
		$this->space->spaceUser['bday']);
		$address = $this->getSpace()->getArea('aim_windid_area',$this->space->spaceUser['location']);
		$add = str_replace('|',' ',$address['joinname']);
		$l_address = $this->getSpace()->getArea('aim_windid_area',$this->space->spaceUser['hometown']);
		$l_add = str_replace('|',' ',$l_address['joinname']);
		$job =$this->getSpace()->getJob($this->space->spaceUser['uid']);
		$jobAll =$this->getSpace()->getJobAll($this->space->spaceUser['uid']);
		$schoolAll =$this->getSpace()->getSchoolAll($this->space->spaceUser['uid']);
		foreach ($schoolAll as $k=>$v){
			$schoolAll[$k]['xueli']=$this->getXueli($v['degree']);
		}
		$showTag= $this->getSpace()->getTag($this->space->spaceUser['uid']);
		$this->setOutput($showTag,'showTag');
		$this->setOutput($schoolAll,'schoolAll');
		$this->setOutput($jobAll,'jobAll');
		$this->setOutput($job,'job');
		$this->setOutput($add,'address');
		$this->setOutput($l_add,'home');
		$this->setOutput($group['name'], 'groupName');
		$this->setOutput($lang->getMessage('USER:profile.constellation.' . $constellation), 'constellation');
		$this->setOutput('profile', 'src');
		// seo设置
		Wind::import('SRV:seo.bo.PwSeoBo');
		$seoBo = PwSeoBo::getInstance();
		$lang = Wind::getComponent('i18n');
		$seoBo->setCustomSeo(
			$lang->getMessage('SEO:space.profile.run.title', 
				array($this->space->spaceUser['username'], $this->space->space['space_name'])), '', 
			$lang->getMessage('SEO:space.profile.run.description', 
				array($this->space->spaceUser['username'])));
		Wekit::setV('seo', $seoBo);
	}
	
	public function getSpace(){
		return Wekit::loadDao('space.dao.PwSpaceDao');
	}
	/**
	 * 获取学历
	 */
	public function getXueli($param) {
		switch($param){
	case 1:
		return '小学'; 
	break;
	case 2:
		return '初中'; 
	break;	
	case 3:
		return '高中'; 
	break;
	case 4:
		return '大学专科'; 
	break;
	case 5:
		return '大学本科'; 
	break;
	case 6:
		return '硕士'; 
	break;
	case 7:
		return '博士'; 
	break;
	case 8:
		return '博士后'; 
	break;
		}
	}
	
	
}
?>