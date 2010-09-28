// endless_page.js
var currentPage = 1;
//---------
//DB Count


var display_records_no_sets=0;
var ii=0;
for(i=1; i<=db_count; i++){
    ii=ii+1;
    if(ii==display_records){
        display_records_no_sets=display_records_no_sets+1;
        ii=0;
    }
}


var Cat=db_count-display_records*display_records_no_sets; //if below set count value
var Cat_identity=0; //for loop one time Cat records
display_records_no_sets=display_records_no_sets-2;
//--------

function moreJobs(record_count) {
    

    //var show_current = display_records_no_sets;
    if ((display_records_no_sets==0)&&(Cat!="")&&(Cat_identity==0)){

        ///http request code line
        currentPage++;
        new Ajax.Request('/jobs.js?page=' + currentPage, {
            asynchronous:true,
            evalScripts:true,
            method:'get'
        });

        Cat_identity=1;
        document.getElementById('more_button').style.display="none";
    }

  // else if (display_records_no_sets<0){ document.getElementById('more').style.display="none"; }

    else if (display_records_no_sets>0){
        
        display_records_no_sets=display_records_no_sets-2;
        ///http request code line
        currentPage++;
        new Ajax.Request('/jobs.js?page=' + currentPage, {
            asynchronous:true,
            evalScripts:true,
            method:'get'
        });
    }

     else if((display_records_no_sets==0)&&(Cat=="")){
            alert("no records");
            document.getElementById('more_button').style.display="none";
        }
    //alert(display_records_no_sets);
    
}


function nearBottomOfPage() {
    return scrollDistanceFromBottom() < 150;
}

function scrollDistanceFromBottom(argument) {
    return pageHeight() - (window.pageYOffset + self.innerHeight);
}

function pageHeight() {
    return Math.max(document.body.scrollHeight, document.body.offsetHeight);
}
