<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>会员等级列表 - Powered By SHOP++</title>
    <meta name="author" content="SHOP++ Team"/>
    <meta name="copyright" content="SHOP++"/>
    <link href="../css/common.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript" src="../js/list.js"></script>

    <script src="../vue/vue.min.js"></script>
    <script src="../plugins/bootstrap/bootstrap-paginator.js"></script>
    <script type="text/javascript">
        $().ready(function () {


        });
    </script>
</head>
<body>
<div id="app">
    <div class="breadcrumb">
        会员等级列表 <span>(共4条记录)</span>
    </div>

    <form id="listForm" action="list" method="get">
        <div class="bar">
            <a v-on:click="add()" class="iconButton">
                <span class="addIcon">&nbsp;</span>添加
            </a>
            <div class="buttonGroup">
                <a v-on:click="deleteMemberRankPL()" class="iconButton">
                    删除
                </a>
                <a href="javascript:;" id="refreshButton" class="iconButton">
                    <span class="refreshIcon">&nbsp;</span>刷新
                </a>

            </div>
            <div id="searchPropertyMenu" class="dropdownMenu">
                <div class="search">
                    <span class="arrow">&nbsp;</span>
                    <input type="text" id="searchValue" v-model="name" maxlength="200"/>
                    <button type="submit">&nbsp;</button>
                </div>
                <ul>
                    <li val="name">名称</li>
                </ul>
            </div>
        </div>
        <table id="listTable" class="list">
            <tr>
            </tr>

            <thead>
            <tr>
                <th class="" style="padding-right:0px">
                    <input id="selall" type="checkbox" class="icheckbox_square-blue">
                </th>
                <th class="sorting_asc">名称</th>
                <th class="sorting">优惠比例</th>
                <th class="sorting">消费金额</th>
                <th class="sorting">是否默认</th>

                <th class="text-center">操作</th>
            </tr>
            </thead>

            <tbody>
            <tr v-for="memberrank in memberrankList">
                <td><input type="checkbox" v-on:click="updateSelectStatus($event, memberrank.id)"></td>
                <td>{{memberrank.name}}</td>
                <td>{{memberrank.scale}}</td>
                <td>{{memberrank.amount}}</td>

                <td>{{memberrank.isdefault==1?"是":"否"}}</td>
                <td class="text-center">
                    <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#editModal"
                            v-on:click="updateMemberRank(memberrank.id)">修改
                    </button>
                </td>
            </tr>
            </tbody>
        </table>

    </form>
</div>
</body>

<script type="text/javascript">
    var vm = new Vue({
        el: '#app',
        data: {
            memberrankList: '',
            selectIds: ''

        }
    })

    $(function () {
        findMemberRankList();
    })

    function findMemberRankList() {
        $.ajax({
            type: 'post',
            url: '../memberRank/findAll',
            /*data: {'name': vm.name},*/
            dataType: 'json',
            success: function (result) {
                vm.memberrankList = result;
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

    function deleteMemberRankPL() {

        $.ajax({
            url: '../memberRank/deleteMemberRank',
            type: 'post',
            //数组转化为字符串传输
            data: {'ids': vm.selectIds.toString()},
            function() {
                findMemberRankList();
            }
        })
    }

    function updateMemberRank(id) {
        location.href = "../addmemberrank?id=" + id;
    }

    function add() {
        location.href = "../addmemberrank01";
    }
</script>
</html>