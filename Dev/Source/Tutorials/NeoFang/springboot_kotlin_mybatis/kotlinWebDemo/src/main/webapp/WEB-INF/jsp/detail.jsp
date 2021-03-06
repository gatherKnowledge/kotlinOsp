<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
        <title>상세</title>
        <link rel="stylesheet" href="/css/bootstrap.min.css" />
        <script src="/script/jquery/jquery.min.js"></script>
        <script src="/script/bootstrap/bootstrap.min.js"></script>
        <script type="text/javascript">
            function updateBoard(){
                var formData = new FormData(document.getElementById("_frmBoard"));
                var jsonObject = {};
                formData.forEach(function(value, key){
                    jsonObject[key] = value;
                });

                $.ajax({
                    url : "/board/update",
                    data : JSON.stringify(jsonObject),
                    method : "put",
                    contentType : "application/json",
                    dataType: "json",
                    aSync : false,
                    success : function (result) {
                        var status = result.status;
                        if(status == "00"){
                            alert("정상적으로 수정되었습니다.");
                        }else {
                            alert("오류가 발생했습니다.");
                        }
                    },
                    error : function (e) {
                        alert(e.responseText);
                    }
                });
            }

            function deleteBoard(){
                var formData = new FormData(document.getElementById("_frmBoard"));
                var jsonObject = {};
                formData.forEach(function(value, key){
                    jsonObject[key] = value;
                });

                $.ajax({
                    url : "/board/delete",
                    data : JSON.stringify(jsonObject),
                    method : "delete",
                    contentType : "application/json",
                    dataType: "json",
                    aSync : false,
                    success : function (result) {
                        var status = result.status;
                        if(status == "00"){
                            alert("정상적으로 삭제되었습니다.");
                            location.href = "/";
                        }else {
                            alert("오류가 발생했습니다.");
                        }
                    },
                    error : function (e) {
                        alert(e.responseText);
                    }
                });
            }
        </script>
</head>
<body>
<div class="container">
    <form name="frmBoard" id="_frmBoard" onsubmit="return false;">
        <table class="table table-striped">
            <colgroup>
                <col width="30%" />
                <col width="*" />
            </colgroup>

            <tbody>
                <tr>
                    <th>seq</th>
                    <td>
                        <c:out value="${board.seq}" />
                        <input type="hidden" class="form-control" name="seq" value="${board.seq}">
                    </td>
                </tr>
                <tr>
                    <th>제목</th><td><input type="text" class="form-control" name="title" value="${board.title}"> </td>
                </tr>
                <tr>
                    <th>등록일</th><td><c:out value="${board.ymdFrt}" /></td>
                </tr>
                <tr>
                    <th>내용</th><td><input type="text" class="form-control" name="content" value="${board.content}"></td>
                </tr>
            </tbody>
        </table>
        <button class="btn btn-primary" onclick="updateBoard();" style="float:right;">수정</button>
        <button class="btn btn-primary" onclick="deleteBoard();" style="float:right;">삭제</button>
        <button class="btn btn-primary" onclick="javascript:location.href='/'" style="float:right;">목록</button>
    </form>
</div>

</body>
</html>