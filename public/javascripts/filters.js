
function fulltime_jobtype_filter(filter_option) {
    
    new Ajax.Request('/job_postings/search',
                     {asynchronous:true, evalScripts:true, method:'post',
                        parameters: {
                                       job_type_full_time : filter_option,
                                       search_textfield: document.getElementById("search_textfield").value
                                    },
                        onSuccess: function(transport){
                         var response = transport.responseText || "no response text";
                        },
                        onFailure: function(){ alert('Something went wrong...') }
                     });

}



   