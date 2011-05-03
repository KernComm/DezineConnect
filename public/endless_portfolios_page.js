// endless_page.js
var currentPage = 1;

function morePortfolioResults() {

    currentPage++;
    new Ajax.Request('/portfolios.js?page=' + currentPage, {asynchronous:true, evalScripts:true, method:'get'});

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
