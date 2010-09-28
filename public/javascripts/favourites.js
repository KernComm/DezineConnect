
function thumbsUP(job_posting_id) {

    new Ajax.Request('/favourites/create?user_id=2&status_flag=1&job_posting_id='+job_posting_id, 
                     {asynchronous:true, evalScripts:true, method:'post',
                        onSuccess: function(transport){
                         
                          var response = transport.responseText || "no response text";
                          
                        },
                        onFailure: function(){ alert('Something went wrong...') }
                     });

}


function thumbsDOWN() {
    document.getElementById('thumbs_down').style.display='none';
    document.getElementById('thumbs_down_red').style.display='block';
 //new Ajax.Request('/job_postings.js?page=' + currentPage, {asynchronous:true, evalScripts:true, method:'get'});
}
function thumbsUP_gray()
{
    document.getElementById('thumbs_down_red').style.display='none';
    document.getElementById('thumbs_down').style.display='block';
    
}