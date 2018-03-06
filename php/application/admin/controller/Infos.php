<?php
namespace app\admin\controller;

use think\Request;
use app\common\controller\BaseCommon;

class Infos extends BaseCommon
{
    public function index(){
        $userModel = model('User');
        $uid = $this->uid;
        $data = $userModel->getInfo($uid);
        return resultArray(['data' => $data]);
    }
    public function refresh(){
        $userModel = model('User');
        $uid = $this->uid;
        $authData = $userModel->createJwt($uid);
        return resultArray(['data' => $authData]);
    }
}