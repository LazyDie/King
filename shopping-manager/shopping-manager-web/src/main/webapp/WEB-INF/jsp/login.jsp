<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>天天批发市场</title>
    <%@ include file="layui.jsp"%>
    <link rel="shortcut icon" href="../images/tubiao.ico" type="image/x-icon" />
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<div class="layui-carousel video_mask" id="login_carousel" >
    <div carousel-item>
        <div class="carousel_div1"></div>
        <div class="carousel_div2"></div>
        <div class="carousel_div3"></div>
    </div>
    <div class="login layui-anim layui-anim-up">
        <h1>登录系统</h1></p>
        <form class="layui-form" action="" method="post">
            <div class="layui-form-item">
                <input type="text" name="username" lay-verify="required" placeholder="请输入账号" autocomplete="off"  value="" class="layui-input">
            </div>
            <div class="layui-form-item">
                <input type="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" value="" class="layui-input">
            </div>
            <!-- <div class="layui-form-item form_code">
                <input class="layui-input" name="code" placeholder="验证码" lay-verify="required" type="text" autocomplete="off">
                <div class="code"><img src="captcha.do" width="116" height="36"></div>
            </div> -->
			<div class="layui-form-item form_code">
	            <input class="layui-input" style="width: 140px;" name="vcode" placeholder="验证码" lay-verify="required" type="text" autocomplete="off" maxlength="4">
	            <div class="code"><img id="captcha" src="sys/vcode" width="100" height="36" onclick="refreshCode(this)"></div>
	        </div>
            <button class="layui-btn login_btn" lay-submit="" lay-filter="login">登陆系统</button>
        </form>

    </div>

</div>
<script type="text/javascript" src="js/login.js"></script>
</body>

</html>
<script>
    layui.config({
        base : "js/"
    }).use(['form','layer','jquery','common','carousel', 'element'], function () {
        var $ = layui.jquery,
            form = layui.form,
            common = layui.common,
            carousel = layui.carousel;

        /**背景图片轮播*/
        carousel.render({
            elem: '#login_carousel',
            width: '100%',
            height: '100%',
            interval:3000,
            arrow: 'none',
            anim: 'fade',
            indicator:'none'
        });
       

        /**重新生成验证码*/
        /* function reqCaptcha() {
            var url = "captcha.do?nocache=" + new Date().getTime()
            $('.code img').attr("src",url)
        }
        //点击验证码重新生成
        $('.code img').on('click', function () {
            reqCaptcha();
        }); */

        /**监听登陆提交*/
       /*  form.on('submit(login)', function (data) {
            //弹出loading
            var loginLoading = top.layer.msg('登陆中，请稍候', {icon: 16, time: false, shade: 0.8});
            //记录ajax请求返回值
            var ajaxReturnData;

            //登陆验证
            $.ajax({
                url: 'loginCheck.do',
                type: 'post',
                async: false,
                data: data.field,
                success: function (data) {
                    ajaxReturnData = data;
                }
            });
            //登陆成功
            if (ajaxReturnData.code == 0000) {
                window.location.href="index.do";
                top.layer.close(loginLoading);
                return false;
            } else {
                top.layer.close(loginLoading);
                common.cmsLayErrorMsg(ajaxReturnData.msg);
                reqCaptcha();
                return false;
            }
        }); */

    });
</script>