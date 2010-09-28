function count_words(tbox_input) {
   var msg = "";
   var c = 0;
   w = document.getElementById(tbox_input).value.split(" ");
   no_words = w.length;
   //alert(no_words);
   for (x = 0; x < no_words; x++) {
      if (c >= 50){
         //alert(no_words+"Only thiry words please!");
         //document.getElementById('err_msg').style.display="block";
        document.getElementById('company_overview').style.color="red";
        document.getElementById('company_overview').style.border="red 1px solid";
        document.getElementById('company_overview').style.background="#ffefef";
        //document.getElementById('company_overview').style.background="red";
        //tbox_input.value = msg;
        // break;
        document.getElementById('error_company_overview').style.display="block";
        document.getElementById('error_required').style.display="block";

        return false;
         }
         else {
         //alert('hi1');
         document.getElementById('company_overview').style.color="black";
         document.getElementById('company_overview').style.border="gray 1px solid";
         document.getElementById('company_overview').style.background="#fff";
         document.getElementById('error_company_overview').style.display="none";
         document.getElementById('error_required').style.display="none";
         }
     msg = msg + w[x] + " ";
     c++;
     }
     if(c <= 50){
      // return true;
     }

   }


 function validate()
  {
    if((count_words('company_overview')==false)||
      (document.getElementById('company_name').value=="")||
      (document.getElementById('company_name').value==" ")||
      (document.getElementById('company_name').value=="  ")||
      (document.getElementById('company_name').value=="   ")||


      (document.getElementById('display_name').value=="")||
      (document.getElementById('display_name').value==" ")||
      (document.getElementById('display_name').value=="  ")||
      (document.getElementById('display_name').value=="   ")||

      (document.getElementById('city').value=="")||
      (document.getElementById('city').value==" ")||
      (document.getElementById('city').value=="  ")||
      (document.getElementById('city').value=="   ")||

      (document.getElementById('country').value=="")||
      (document.getElementById('country').value==" ")||
      (document.getElementById('country').value=="  ")||
      (document.getElementById('country').value=="   ")

) {
    //alert('d');
      if((document.getElementById('city').value=="")||
        (document.getElementById('city').value==" ")||
        (document.getElementById('city').value=="  ")||
        (document.getElementById('city').value=="   ")){
        document.getElementById('city').style.border="1px red solid";
        document.getElementById('city').style.background="#ffefef";
        document.getElementById('error_city').style.display="block";
        document.getElementById('error_required').style.display="block";
      }
      if((document.getElementById('country').value=="")||
        (document.getElementById('country').value==" ")||
        (document.getElementById('country').value=="  ")||
        (document.getElementById('country').value=="   "))
        {
        document.getElementById('country').style.border="1px red solid";
        document.getElementById('country').style.background="#ffefef";
        document.getElementById('error_country').style.display="block";
        document.getElementById('error_required').style.display="block";
       }
       if((document.getElementById('display_name').value=="")||
         (document.getElementById('display_name').value==" ")||
         (document.getElementById('display_name').value=="  ")||
         (document.getElementById('display_name').value=="   "))
         {
        document.getElementById('display_name').style.border="1px red solid";
        document.getElementById('display_name').style.background="#ffefef";
        document.getElementById('error_display_name').style.display="block";
        document.getElementById('error_required').style.display="block";
       }
       if((document.getElementById('company_name').value=="")||
         (document.getElementById('company_name').value==" ")||
         (document.getElementById('company_name').value=="  ")||
         (document.getElementById('company_name').value=="   "))
         {
        document.getElementById('company_name').style.border="1px red solid";
        document.getElementById('company_name').style.background="#ffefef";
        document.getElementById('error_company_name').style.display="block";
        document.getElementById('error_required').style.display="block";
        return false;
      }
      return false;
    }
    else {
       return true;
        }
  }

  function validation(ctl,ct2) {
    if((document.getElementById(ctl).value=="")||
      (document.getElementById(ctl).value=="0")||
      (document.getElementById(ctl).value==" ")||
      (document.getElementById(ctl).value=="  ")||
      (document.getElementById(ctl).value=="   ")) {
      document.getElementById(ctl).style.border="1px red solid";
      document.getElementById(ctl).style.background="#ffefef";
      document.getElementById(ct2).style.display="block";
      document.getElementById('error_required').style.display="block";
      return false;
    }
    else {
      document.getElementById(ctl).style.border="1px #ccc solid";
      document.getElementById(ctl).style.background="#fff";
      document.getElementById(ct2).style.display="none";
      document.getElementById('error_required').style.display="none";
      return true;
    }
  }