<?php
namespace app\common\controller;

use think\Request;
use think\Db;
use app\common\adapter\AuthAdapter;
use app\common\controller\Common;

class BaseCommon extends Common
{
    // 检查header并从header提取authkey并获取uid
    public $uid;
    public function _initialize()
    {
        parent::_initialize();
        $header = Request::instance()->header();
        $authKey = $header['authkey'];
        $userModel = model('app\admin\model\User');
        $uid = $userModel->getUid($authKey);
        if(!empty($authKey) && $uid){
            $this->uid = $uid;
        }else{
            header('Content-Type:application/json; charset=utf-8');
            exit(json_encode(['code'=>101, 'error'=>'登录已失效']));
        }
    }
}