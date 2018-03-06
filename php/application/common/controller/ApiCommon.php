<?php
// +----------------------------------------------------------------------
// | Description: Api基础类，验证权限
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\common\controller;

use think\Request;
use think\Db;
use app\common\adapter\AuthAdapter;

class ApiCommon extends BaseCommon
{
    public function _initialize()
    {
        parent::_initialize();
        // 检查账号有效性
        $uid = $this->uid;
        $userInfo = model('app\admin\model\User')->getUserById($uid);
        $map['id'] = $userInfo['id'];
        $map['status'] = 1;
        if (!Db::name('admin_user')->where($map)->value('id')) {
            header('Content-Type:application/json; charset=utf-8');
            exit(json_encode(['code'=>103, 'error'=>'账号已被删除或禁用']));   
        }
        $authAdapter = new AuthAdapter($userInfo['id']);
        $request = Request::instance();
        $ruleName = $request->module().'-'.$request->controller() .'-'.$request->action(); 
        if (!$authAdapter->checkLogin($ruleName, $userInfo['id'])) {
            header('Content-Type:application/json; charset=utf-8');
            exit(json_encode(['code'=>102,'error'=>'没有权限']));
        }
        $GLOBALS['userInfo'] = $userInfo;
    }
}
