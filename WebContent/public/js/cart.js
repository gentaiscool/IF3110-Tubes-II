function addToCart(quantity, id, desc, stock) {
	var xmlhttp;
	alert(stock);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if(stock < quantity){
		alert("stock is less than your request");
	} else{
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				if(xmlhttp.responseText == -1){
					alert("stock is less than your request");
				} else{
					alert("cart updated by your request");
				}
			}
		}
		xmlhttp.open("GET", "Cart?quantity=" + quantity + "&id=" + id + "&desc="
				+ desc + "&stock=" + stock, true);
		xmlhttp.send();
	}
}