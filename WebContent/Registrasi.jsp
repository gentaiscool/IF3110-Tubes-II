<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="public/css/style.css">
<title>Registrasi</title>
<script>
		var list = [];
		function readysubmit(no,val)
		{
			var isValid = 0;
			if(val=='0')list[no]=true;
			else list[no]=false;
			document.getElementById("masuk").disabled = true;
			for(var i=1;i<6;i++){
				if(list[i])isValid++;
			}
			if(isValid==5 &&(document.getElementById("cek").checked))document.getElementById("masuk").disabled = false;
		}
		
		function validate(text,num,pas)
		{
		var xmlhttp;
		var validpic = '<img src="public/img/like.png" width="15" height="15"/>';
		var invalidpic = '<img src="public/img/unlike.png" width="15" height="15"/>';
		var wait = '<img src="public/img/ajaxLoader.gif" width="15" height="15"/>';
		var valid = false;
		var temp = ""+text;
		if (temp.length==0)
		  { 
		  	if(num==1)
		  		document.getElementById("validasiNama").innerHTML="";
		  	else if(num==2)
		  		document.getElementById("validasiUser").innerHTML="";
		  	else if(num==3)
		  		document.getElementById("validasiPass").innerHTML="";
		  	else if(num==4)
		  		document.getElementById("validasiCoPass").innerHTML="";
		  	else if(num==5)
		  		document.getElementById("validasiEmail").innerHTML="";
		  	return;
		  }
		if (window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		  }
		else
		  {// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		xmlhttp.onreadystatechange=function()
		  {
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		    {
		    	readysubmit(num,xmlhttp.responseText);
		    	//alert(xmlhttp.responseText);
		    	switch(num){
		    		case 1:
		    			switch(xmlhttp.responseText){
		    				case '0':
		    					document.getElementById("validasiNama").innerHTML=validpic;			
		    				break;
		    				default:
		    					document.getElementById("validasiNama").innerHTML=invalidpic+" (Nama harus terdiri dari karakter(A-Z)(a-z). Minimal 2 kata.)";
		    				break;
		    			}
		    		break;
		    		case 2:
		    			switch(xmlhttp.responseText){
		    				case '0':
		    					document.getElementById("validasiUser").innerHTML=validpic;			
		    				break;
		    				case '1':
		    					document.getElementById("validasiUser").innerHTML=invalidpic+" (Username sudah pernah terdaftar. Coba cari yang lain.)";
		    				break;
		    				case '2':
		    					document.getElementById("validasiUser").innerHTML=invalidpic+" (Username tidak boleh sama dengan password)";
		    				break;
		    				case '3':
		    					document.getElementById("validasiUser").innerHTML=invalidpic+" (Username minimal 5 karakter)";
		    				break;
		    			}
		    		break;
		    		case 3:
		    			switch(xmlhttp.responseText){
		    				case '0':
		    					document.getElementById("validasiPass").innerHTML=validpic;
		    				break;
		    				case '1':
		    					document.getElementById("validasiPass").innerHTML=invalidpic+" (Password tidak boleh sama dengan username)";
		    				break;
		    				case '2':
		    					document.getElementById("validasiPass").innerHTML=invalidpic+" (Password minimal 8 karakter)";
		    				break;
		    			}
		    		break;
		    		case 4:
		    			switch(xmlhttp.responseText){
		    				case '0':
		    					document.getElementById("validasiCoPass").innerHTML=validpic;
		    				break;
		    				case '1':
		    					document.getElementById("validasiCoPass").innerHTML=invalidpic+" (Silakan isi 'Confirm Password' sama dengan Password awal)";
		    				break;
		    			}
		    		break;
		    		case 5:
		    			switch(xmlhttp.responseText){
		    				case '0':
		    					document.getElementById("validasiEmail").innerHTML=validpic;
		    				break;
		    				case '1':
		    					document.getElementById("validasiEmail").innerHTML=invalidpic+" (Invalid Email)";
		    				break;
		    			}
		    		break;
		    	}
		    }else{
		    	switch(num){
		    		case 1:
		    			document.getElementById("validasiNama").innerHTML=wait;
		    		break;
		    		case 2:
		    			document.getElementById("validasiUser").innerHTML=wait;
		    		break;
		    		case 3:
		    			document.getElementById("validasiPass").innerHTML=wait;
		    		break;
		    		case 4:
		    			document.getElementById("validasiCoPass").innerHTML=wait;
		    		break;
		    		case 5:
		    			document.getElementById("validasiEmail").innerHTML=wait;
		    		break;
		    	}
		    }
		 }
		xmlhttp.open("GET","Validasi?q="+temp+"&num="+num+"&pass="+pas,true);
		xmlhttp.send();
	}
</script>
</head>
<body>
<form id="registerform" method="post" action="Registrasi">
		<strong><h2>Sign up</h2></strong><br>
		<pre>(*) Harus diisi.</pre>
		<pre>Username*			<input type="text" name="username" id="usnm" onblur="validate(usnm.value,2,pwd.value)" onblur="validate(usnm.value,2,pwd.value)"/><span id="validasiUser"></span></pre>
		<pre>Password*			<input type="password" name="password"id="pwd" onblur="validate(pwd.value,3,usnm.value)"/><span id="validasiPass"></span></pre>
		<pre>Confirm Password*		<input type="password" name="password"id="pwd2" onblur="validate(pwd2.value,4,pwd.value)" onblur="validate(pwd2.value,4,pwd.value)"/><span id="validasiCoPass"></span></pre>
		<pre>Nama Lengkap*			<input type="text" name="nama" id="nama" onblur="validate(nama.value,1,'budi')"  onblur="validate(nama.value,1,'budi')"/><span id="validasiNama"></span></pre>
		<pre>Nomor HP			<input type="text" name="nohp"></pre>
		<pre>Alamat				<input type="textarea" name="alamat"></pre>
		<pre>Provinsi			<input type="text" name="provinsi"></pre>
		<pre>Kota/Kabupaten			<input type="text" name="kota"></pre>
		<pre>Kode Pos			<input type="text" name="kodepos"></pre>
		<pre>Email*				<input type="text" name="email"id="email" onblur="validate(email.value,5,pwd.value)"/><span id="validasiEmail"></span></pre>
		<pre><input type="checkbox" name="setuju" id="cek" onclick="readysubmit(9,'1')">I love Indonesia!!!</pre>
		<input type="submit" value="Daftar" id="masuk" disabled> <a href='index.jsp'>Kembali</a></form>	
</body>
</html>