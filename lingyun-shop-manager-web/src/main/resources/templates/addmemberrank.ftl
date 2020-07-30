<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>添加会员 - Powered By SHOP++</title>
    <meta name="author" content="SHOP++ Team"/>
    <meta name="copyright" content="SHOP++"/>
    <link href="../css/common.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript" src="../js/list.js"></script>

    <script src="../vue/vue.min.js"></script>
    <script src="../plugins/bootstrap/bootstrap-paginator.js"></script>
    <script type="text/javascript">
        /* $().ready(function() {

             var $inputForm = $("#inputForm");
             var $areaId = $("#areaId");


             // 地区选择
             $areaId.lSelect({
                 url: "/shopxxb2b2c/common/area"
             });

             $.validator.addMethod("notAllNumber",
                 function(value, element) {
                     return this.optional(element) || /^.*[^\d].*$/.test(value);
                 },
                 "不允许全部为数字"
             );

             // 表单验证
             $inputForm.validate({
                 rules: {
                     username: {
                         required: true,
                         minlength: 4,
                         pattern: /^[0-9a-zA-Z_\u4e00-\u9fa5]+$/,
                         notAllNumber: true,
                         remote: {
                             url: "check_username",
                             cache: false
                         }
                     },
                     password: {
                         required: true,
                         minlength: 4
                     },
                     rePassword: {
                         required: true,
                         equalTo: "#password"
                     },
                     email: {
                         required: true,
                         email: true,
                         remote: {
                             url: "check_email",
                             cache: false
                         }
                     },
                     mobile: {
                         pattern: /^1[3|4|5|7|8]\d{9}$/,
                         remote: {
                             url: "check_mobile",
                             cache: false
                         }
                     }
                     ,memberAttribute_7: {
                         pattern: /^\d{3,4}-?\d{7,9}$/
                     }
                 },
                 messages: {
                     username: {
                         pattern: "非法字符",
                         remote: "已存在"
                     },
                     email: {
                         remote: "已存在"
                     },
                     mobile: {
                         remote: "已存在"
                     }
                 }
             });

         });*/
    </script>
</head>
<body>
<div class="breadcrumb">
    <a href="">首页</a> &raquo; 添加会员
</div>
<form id="inputForm" action="/saveInfo" method="post">
    <ul id="tab" class="tab">
        <li>
            <input type="button" value="基本信息"/>
        </li>
        <li>
            <input type="button" value="个人资料"/>
        </li>
    </ul>
    <table class="input tabContent" id="app">
        <input type="hidden" name="id" v-model="memberrankList.id">
        <tr>
            <th>
                消费金额:
            </th>
            <td>
                <input type="text" v-model="memberrankList.amount" name="amount" class="text" maxlength="200"/>
            </td>
        </tr>
        <tr>
            <th>
                优惠比例:
            </th>
            <td>
                <input type="text" name="scale" v-model="memberrankList.scale" class="text" maxlength="200"/>
            </td>
        </tr>
        <tr>
            <th>
                会员等级:
            </th>
            <td>
                <input type="text" name="scale" v-model="memberrankList.name" class="text" maxlength="200"/>
            </td>
        </tr>
        <tr>
            <th>
                设置:
            </th>
            <td>
                <label>
                    <input type="radio" v-model="memberrankList.isdefault" name="isDefault" value="1">可用
                    <input type="radio" v-model="memberrankList.isdefault" name="isDefault" value="0">禁用
                </label>
            </td>
        </tr>
    </table>
    <#--<table class="input tabContent">
        <tr>
            <th>
                姓名:
            </th>
            <td>
                <input type="text" name="memberAttribute_1" class="text" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th>
                性别:
            </th>
            <td>
								<span class="fieldSet">
										<label>
											<input type="radio" name="memberAttribute_2" value="male" />男
										</label>
										<label>
											<input type="radio" name="memberAttribute_2" value="female" />女
										</label>
								</span>
            </td>
        </tr>
        <tr>
            <th>
                电话:
            </th>
            <td>
                <input type="text" name="memberAttribute_7" class="text" maxlength="200" />
            </td>
        </tr>
    </table>-->
    <table class="input">
        <tr>
            <th>
                &nbsp;
            </th>
            <td>
                <input type="button" class="button" value="确 定" onclick="toAdd()"/>
                <input type="button" class="button" value="返 回" onclick="history.back(); return false;"/>
            </td>
        </tr>
    </table>
</form>
</body>
<script type="text/javascript">
    var vm = new Vue({
        el: '#app',
        data: {
            memberrankList: {
                id: '',
                isdefault: '',
                name: '',
                scale: '',
                amount: ''
            }
        }
    })


    $(function () {
        findOne();
    })

    var quId = '';

    function findOne() {
        var a = (window.location.search);
        var aa = a.substring(4);
        quId = aa;
        alert(quId);
        $.ajax({
            type: 'post',
            url: '../memberRank/findOne',
            data: {'id': quId},
            dataType: 'json',
            success: function (result) {
                vm.memberrankList = result;
            },
            error: function () {
                alert("系统错误，请联系管理员！");
            }
        })
    }

    function toAdd() {
        $.ajax({
            type: 'post',
            url: '../memberRank/updatehuiyuan',
            data: vm.memberrankList,
            dataType: 'json',
            success: function (result) {
                if (result.success) {
                    alert(result.message);
                    window.location.reload();
                } else {
                    alert(result.message);
                }
            },
            error: function () {
                alert("系统错误，请联系管理员！");
            }
        })
    }
</script>
</html>