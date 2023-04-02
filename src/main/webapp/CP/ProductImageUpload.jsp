<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<title></title>
<style type="text/css">
	body {
		font-family:Verdana, Geneva, sans-serif;
		font-size:13px;
		color:#333;
		background:url(bg.jpg);
	}
</style>
<link rel="stylesheet" href="./CP/js/jquery.plupload.queue/css/jquery.plupload.queue.css" type="text/css" media="screen" />

<script type="text/javascript" src="./CP/js/jquery.plupload.queue/jquery.min.js"></script>

<script type="text/javascript" src="./CP/js/jquery.plupload.queue/plupload.js"></script>
<script type="text/javascript" src="./CP/js/jquery.plupload.queue/plupload.flash.js"></script>
<script type="text/javascript" src="./CP/js/jquery.plupload.queue/jquery.plupload.queue.js"></script>
<!-- <script type="text/javascript"  src="http://getfirebug.com/releases/lite/1.2/firebug-lite-compressed.js"></script> -->
</head>
<body>
	<div style="float: left; margin-right: 20px">
		<center><h5>Upload Product Image</h5></center>
		<div id="flash_uploader" align="center" style="width: 900px; height: 400px;">You browser doesn't have Flash installed.</div>

	</div>
<script type="text/javascript">
$(function() {
	// Setup flash version
	
	$("#flash_uploader").pluploadQueue({
		// General settings
		runtimes : 'flash',
		url : 'upload?product_id=<%=request.getParameter("productId")%>',
		multipart : true,
		max_file_size : '5mb',		
		unique_names : true,
		//filters : [
		//	{title : "Image files", extensions : "jpg,gif,png"}
		//],

		// Resize images on clientside if we can
                // try setting beforeUpload to true
		//resize : {width : 320, height : 240, quality : 90, beforeUpload: true},

                // thumbnails
             //  thumb : {width: 100, height: 100, quality: 90},

		// Flash settings
		flash_swf_url : './CP/js/jquery.plupload.queue/plupload.flash.swf'
	});
	

});
</script>
</body>
</html>