<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(function () {
    $("#upload").click(function () {
        var formData = new FormData($('#uploadForm')[0]);
        $.ajax({
            type: 'post',
            url: "ModifyUpload",
            data: formData,
            cache: false,
            processData: false,
            contentType: false,
        }).success(function (data) {
            alert("上传成功!");
        }).error(function () {
            alert("上传失败!");
        });
    });
});

</script>
  <form id="uploadForm" enctype="multipart/form-data">
    文件:<input id="file" type="file" name="file"/>
   <button id="upload">上传文件</button>
</form>
</body>
</html>