function validate()
{
    if((document.getElementById('name').value=="")||(document.getElementById('email').value=="")||(echeck(document.getElementById('email').value)==false)) {
        
        if(document.getElementById('name').value=="") {
          document.getElementById('name').style.border="1px red solid";
          document.getElementById('name').style.background="#ffefef";
          document.getElementById('error_name').style.display="block";
          }
          if((echeck(document.getElementById('email').value)==false)||(document.getElementById('email').value=="")){
           document.getElementById('email').style.border="1px red solid";
           document.getElementById('email').style.background="#ffefef";
           document.getElementById('error_email').style.display="block";
           return false;
          }
        if(document.getElementById('email').value=="") {
           document.getElementById('email').style.border="1px red solid";
           document.getElementById('email').style.background="#ffefef";
           document.getElementById('error_email').style.display="block";
            return false;
          }
       return false;
    }
    else {
         return true;
    }
}


function validation(ctl,ct2) {
    if((document.getElementById(ctl).value=="")) {
       document.getElementById(ctl).style.border="1px red solid";
       document.getElementById(ctl).style.background="#ffefef";
       document.getElementById(ct2).style.display="block";
       return false;
       }
    else {
       document.getElementById(ctl).style.border="1px #ccc solid";
       document.getElementById(ctl).style.background="#fff";
       document.getElementById(ct2).style.display="none";
       return true;
       }
}

function popup_show(ct1) {
    document.getElementById(ct1).style.display="block";
}
function popup_hide(ct1) {
    document.getElementById(ct1).style.display="none";
}
function background_show(ct1) {
    document.getElementById(ct1).style.background="#eee";
}
function background_hide(ct1) {
    document.getElementById(ct1).style.background="none";
}


function echeck(str) {
		var at="@"
		var dot="."
		var lat=str.indexOf(at)
		var lstr=str.length
		var ldot=str.indexOf(dot)
		if (str.indexOf(at)==-1){
		   //alert("Invalid E-mail ID")
		   return false
		}
		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   //alert("Invalid E-mail ID")
		   return false
		}
		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
		    //alert("Invalid E-mail ID")
		    return false
		}
		 if (str.indexOf(at,(lat+1))!=-1){
		   // alert("Invalid E-mail ID")
		    return false
		 }
		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		   // alert("Invalid E-mail ID")
		    return false
		 }
		 if (str.indexOf(dot,(lat+2))==-1){
		   // alert("Invalid E-mail ID")
		    return false
		 }
		 if (str.indexOf(" ")!=-1){
		    //alert("Invalid E-mail ID")
		    return false
		 }
 		 return true
	}