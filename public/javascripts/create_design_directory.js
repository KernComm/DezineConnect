function limitLength(obj, length) {
    var desc = obj.value;
    obj.value = substr(obj.value,length);
}
function substr(str,length){
    var l=0,i=0;
    while(l <length && i<str.length){
        l+=1;
        if(str.substring(i,i+1).match(/[\u4e00-\u9fa5]/))l+=2;// A Chinese is the equivalent of three English
        i+=1;
    }
    return str.substring(0,i);
}

/*Textarea Maxlength script*/
function ismaxlength(obj){
var mlength=obj.getAttribute? parseInt(obj.getAttribute("maxlength")) : ""
if (obj.getAttribute && obj.value.length>mlength)
obj.value=obj.value.substring(0,mlength)
}

var upload_images_count=0;
function validate()
{
  //alert('hi');
    if(upload_images_count=='0') {
      document.getElementById('validation_upload_image').style.color="red";
      document.getElementById('portfolio_imageupload_error_msg').style.display="block";
      document.getElementById('portfolio_imageupload_8count_error_msg').style.display="none";
      return false
      }
    else if(upload_images_count=='1') {
      document.super_form.submit();
      return true;
    }
    else{
      return false;
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
//body on load function//
function start(){
  document.getElementById('ValidationUploadImage').value=1;
  }