<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Spring pagination using data tables</title>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css">
    <script type="text/javascript" src="//code.jquery.com/jquery-1.12.0.min.js"></script>
    <script type="text/javascript" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">

        //Plug-in to fetch page data
        //        jQuery.fn.dataTableExt.oApi.fnPagingInfo = function (oSettings) {
        //            return {
        //                "iStart": oSettings._iDisplayStart,
        //                "iEnd": oSettings.fnDisplayEnd(),
        //                "iLength": oSettings._iDisplayLength,
        //                "iTotal": oSettings.fnRecordsTotal(),
        //                "iFilteredTotal": oSettings.fnRecordsDisplay(),
        //                "iPage": oSettings._iDisplayLength === -1 ?
        //                        0 : Math.ceil(oSettings._iDisplayStart / oSettings._iDisplayLength),
        //                "iTotalPages": oSettings._iDisplayLength === -1 ?
        //                        0 : Math.ceil(oSettings.fnRecordsDisplay() / oSettings._iDisplayLength)
        //            };
        //        };

        //DataTables 1.10+ provides the page.info() method, built-in, provide
        //        the same information as this method. As such this method is marked
        //        deprecated, but is available for use with legacy version of DataTables.
        //                Please use the new API if you are used DataTables 1.10 or newer.

        $(document).ready(function () {

            $("#example").DataTable({
                "processing": true,
                "serverSide": true,
                "language": {
                    "sProcessing": "处理中...",
                    "sLengthMenu": "显示 _MENU_ 项结果",
                    "sZeroRecords": "没有匹配结果",
                    "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                    "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                    "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                    "sInfoPostFix": "",
                    "sSearch": "搜索:",
                    "sUrl": "",
                    "sEmptyTable": "表中数据为空",
                    "sLoadingRecords": "载入中...",
                    "sInfoThousands": ",",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "上页",
                        "sNext": "下页",
                        "sLast": "末页"
                    },
                    "oAria": {
                        "sSortAscending": ": 以升序排列此列",
                        "sSortDescending": ": 以降序排列此列"
                    }
                },
                "sort": "position",
                //bStateSave variable you can use to save state on client cookies: set value "true"
                "stateSave": false,
                //Default: Page display length
                "displayLength": 10,
                //We will use below variable to track page number on server side(For more information visit: http://legacy.datatables.net/usage/options#iDisplayStart)
                "displayStart": 0,
                "drawCallback": function () {
                    //Get page numer on client. Please note: number start from 0 So
                    //for the first page you will see 0 second page 1 third page 2...
                    //Un-comment below alert to see page number
                    //alert("Current page number: "+this.fnPagingInfo().iPage);
                },
                "ajax": {
                    "url": "springPaginationDataTables.json",
                    "type": "POST"
                },
                "columns": [
                    {"data": "name"},
                    {"data": "position"},
                    {"data": "office"},
                    {"data": "phone"},
                    {"data": "start_date"},
                    {"data": "salary"}

                ]
            });

        });

    </script>
</head>
<body>
<form:form action="" method="POST">
    <h2>Spring MVC pagination using data tables<br><br></h2>
    <table width="70%" style="border: 3px;background: rgb(243, 244, 248);">
        <tr>
            <td>
                <table id="example" class="display" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Office</th>
                        <th>Phone</th>
                        <th>Start Date</th>
                        <th>Salary</th>
                    </tr>
                    </thead>
                </table>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>