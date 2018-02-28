<?php
namespace app\admin\controller;

use think\Request;
use think\Db;
use app\common\adapter\AuthAdapter;
use app\common\controller\Common;

class BaseCommon extends Common
{
    public $uid;
    public function _initialize()
    {
        parent::_initialize();
        $header = Request::instance()->header();
        $authKey = $header['authkey'];
        $userModel = model('User');
        $uid = $userModel->getUid($authKey);
        if($uid){
            $this->uid = $uid;
        }else{
            header('Content-Type:application/json; charset=utf-8');
            exit(json_encode(['code'=>101, 'error'=>'登录已失效']));
        }
    }
}