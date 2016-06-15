<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01

 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>JavaScript file upload</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script type="text/javascript">
var upload = function() {
   var photo = document.getElementById("photo");
   var file = photo.files[0];

   alert("file.fileName");
    console.log("File name: " + file.fileName);
    console.log("File size: " + file.fileSize);
    console.log("Binary content: " + file.getAsBinary());
    console.log("Text content: " + file.getAsText(""));

    var preview = document.getElementById("preview");
    preview.src = file.getAsDataURL();

    return false;

</script>
</head>
<body>

<form action="/" method="post" onsubmit="return upload();">
  <fieldset>
    <legend>Upload photo</legend>
    <input type="file" name="photo" id="photo">
    <input type="submit" value="Upload">
    <hr>
    <img src="" alt="Image preview" id="preview">
  </fieldset>
</form>

</body>

<body>
  
  
  




</body>

</html>
