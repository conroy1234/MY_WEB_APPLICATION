function printWindow(){
   bV = parseInt(navigator.appVersion)
   if (bV >= 4) window.print()
   return false;
}

function QueryString(){
	fullqs=document.location.search.substring(1)
	pairs=fullqs.split("&")
	for(var i=0;i<pairs.length;i++){
		bits=pairs[i].split("=")
		this[bits[0]]=bits[1] 
	}
}

function addBackButton(){
	qs = new QueryString()
	if (qs.q=="showback"){
		backButHTML='<form><p><input type="submit" name="submit" value="Back" class="formButton" onclick="history.go(-1); return false"/></p></form>'
		document.write(backButHTML)
	}
}

function showInfo(infoID, infoText){
	ieIE = (document.all!=null)

	if (ieIE ){
		innerTag = document.all[infoID].children[0]
		innerTag.innerHTML = '<em>'+infoText+'</em>'
		elementRef = document.all[infoID].style
		if (elementRef.display=="block"){
			elementRef.display="none"
		} else {
			elementRef.display="block"
		}

	} else {
		alert(infoText)
	}

	return false
}