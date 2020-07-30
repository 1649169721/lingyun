<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>会员列表 - Powered By SHOP++</title>
    <meta name="author" content="SHOP++ Team"/>
    <meta name="copyright" content="SHOP++"/>
    <link href="../css/common.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript" src="../js/list.js"></script>

    <script src="../vue/vue.min.js"></script>
    <script src="../plugins/bootstrap/bootstrap-paginator.js"></script>
</head>
<body>

<div id="app">
    <div class="breadcrumb">
        <a href="/shopxxb2b2c/admin/common/index">首页</a> &raquo; 会员列表 <span>(共0条记录)</span>
    </div>
    <form id="listForm" action="list" method="get">
        <div class="bar">
            <a href="/addMember" class="iconButton">
                <span class="addIcon">&nbsp;</span>添加
            </a>
            <div class="buttonGroup">
                <a onclick="deleteMemberAll()" class="iconButton">
                    <span class="deleteIcon">&nbsp;</span>删除
                </a>
                <a href="javascript:;" id="refreshButton" class="iconButton">
                    <span class="refreshIcon">&nbsp;</span>刷新
                </a>

            </div>
            <div id="searchPropertyMenu" class="dropdownMenu">
                <div class="search">
                    <span class="arrow">&nbsp;</span>
                    <input type="text" id="searchValue" name="searchValue" value="" maxlength="200"/>
                    <button type="submit">&nbsp;</button>
                </div>
                <ul>
                    <li val="username">用户名</li>
                    <li val="email">E-mail</li>
                </ul>
            </div>
        </div>
        <table id="listTable" class="list">

            <thead>
            <tr>
                <th class="" style="padding-right:0px">
                    <input id="selall" type="checkbox" class="icheckbox_square-blue">
                </th>
                <th class="sorting_asc">用户名</th>
                <th class="sorting">会员等级</th>
                <th class="sorting">E-mail</th>
                <th class="sorting">创建日期</th>
                <th class="sorting">状态</th>
                <th class="text-center">操作</th>
            </tr>
            </thead>

            <tr v-for="memberList in member">
                <td><input type="checkbox" v-on:click="updateSelectStatus($event, memberList.id)"></td>
                <td>{{memberList.yonghuname}}</td>
                <td>{{memberList.name}}</td>
                <td>{{memberList.youxiang}}</td>
                <td>{{memberList.cjtime}}</td>
                <td>{{memberList.isdefault==1?"是":"否"}}</td>
                <td class="text-center">
                    <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#editModal">修改
                    </button>
                </td>
            </tr>


        </table>
        <input type="hidden" id="pageSize" name="pageSize" value="20"/>
        <input type="hidden" id="searchProperty" name="searchProperty" value=""/>
        <input type="hidden" id="orderProperty" name="orderProperty" value=""/>
        <input type="hidden" id="orderDirection" name="orderDirection" value=""/>
    </form>

    <div id="example" style="text-align: center">
        <ul id="pageLimit"></ul>
    </div>
</div>
</body>
<script type="text/javascript">
    var vm = new Vue({
        el: '#app',
        data: {
            //member:'',
            memberList: '',/*{
                id:'',
                youxiang:'',
                cjtime:'',
                name:'',
                yonghuname:'',
                cjtime:'',
                isdefault:'',

            },*/
            selectIds: ''
        }
    })
    $(function () {
        findMember();
    })

    function findMember() {
        $.ajax({
            type: 'post',
            url: '../memberRank/findtwo',
            dataType: 'json',
            success: function (result) {
                vm.memberList = result;
            },
            error: function () {
                alert("系统错误，请联系管理员！");
            }
        })

    }

    vm.selectIds = [];

    //复选框选中
    function updateSelectStatus($event, id) {
        if ($event.target.checked) {
            vm.selectIds.push(id);
        } else {
            var idx = vm.selectIds.indexOf(id);
            vm.selectIds.splice(idx, 1);//删除
        }

        console.info(vm.selectIds.toString());
    }

    function deleteMemberAll() {

        $.ajax({
            url: '../memberRank/deleteMember',
            type: 'post',
            //数组转化为字符串传输
            data: {'ids': vm.selectIds.toString()},
            function() {
                findMember();
            }
        })
    }


</script>
</html>