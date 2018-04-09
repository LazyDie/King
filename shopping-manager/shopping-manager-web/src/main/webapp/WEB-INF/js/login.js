layui.use(['form', 'layer'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer,
        $ = layui.jquery;
    
  /*  layer.alert('测试账号：admin 密码：123456', {
    	  skin: 'layui-layer-molv' //样式类名
    	  ,closeBtn: 0,
    	  offset: 't',
    	  anim: 6
    	})*/
    	
    //登录按钮事件
    form.on("submit(login)", function (data) {
        $.ajax({
            type: "POST",
            url: "sys/login",
            data:$("#login_carousel form").serialize(),
            success: function (result) {
                if (result.code == 100) {//登录成功
                    parent.location.href = 'shouye';
                } else{
                    layer.msg(result.entend.key, {icon: 5});
                    refreshCode();
                }
            }
        });
        return false;
    })
});
function refreshCode(){
    var captcha = document.getElementById("captcha");
    captcha.src = "sys/vcode?t=" + new Date().getTime();
}
