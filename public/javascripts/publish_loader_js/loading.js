/***************************/
//@Author: Adrian "yEnS" Mato Gondelle & Ivan Guardado Castro
//@website: www.yensdesign.com
//@email: yensamg@gmail.com
//@license: Feel free to use it, but keep this credits please!					
/***************************/


var LoadBar = function(){
	this.value = 0;
	this.sources = Array();
	this.sourcesDB = Array();
	this.totalFiles = 0;
	this.loadedFiles = 0;
};
//Show the loading bar interface
LoadBar.prototype.show = function() {
	this.locate();
	document.getElementById("loadingZone").style.display = "block";
};
//Hide the loading bar interface
LoadBar.prototype.hide = function() {
	document.getElementById("loadingZone").style.display = "none";
};
//Add all scripts to the DOM
LoadBar.prototype.run = function(){
	this.show();
	var i;
	for (i=0; i<this.sourcesDB.length; i++){
		var source = this.sourcesDB[i];
		var head = document.getElementsByTagName("head")[0];
		var script = document.createElement("script");
		script.type = "text/javascript";
		script.src = "js/" + source
		head.appendChild(script);
	}	
};
//Center in the screen remember it from old tutorials? ;)
LoadBar.prototype.locate = function(){
	var loadingZone = document.getElementById("loadingZone");
	var windowWidth = document.documentElement.clientWidth;
	var windowHeight = document.documentElement.clientHeight;
	var popupHeight = loadingZone.clientHeight;
	var popupWidth = loadingZone.clientWidth;
	loadingZone.style.position = "absolute";
	loadingZone.style.top = parseInt(windowHeight/2-popupHeight/2) + "px";
	loadingZone.style.left = parseInt(windowWidth/2-popupWidth/2) + "px";
};
//Set the value position of the bar (Only 0-100 values are allowed)
LoadBar.prototype.setValue = function(value){
	if(value >= 0 && value <= 100){
		document.getElementById("progressBar").style.width = value + "%";
		document.getElementById("infoProgress").innerHTML = parseInt(value) + "%";
	}
};
//Set the bottom text value
LoadBar.prototype.setAction = function(action){
	document.getElementById("infoLoading").innerHTML = action;
};
//Add the specified script to the list
LoadBar.prototype.addScript = function(source){
	this.totalFiles++;
	this.sources[source] = source;
	this.sourcesDB.push(source);
};
//Called when a script is loaded. Increment the progress value and check if all files are loaded
LoadBar.prototype.loaded = function(file) {
	this.loadedFiles++;
	delete this.sources[file];
	var pc = (this.loadedFiles * 100) / this.totalFiles;
	this.setValue(pc);
	this.setAction(file + " loaded");
	//Are all files loaded?
	if(this.loadedFiles == this.totalFiles){
		setTimeout("myBar.hide()",300);
		//load the reset button to try one more time!
		document.getElementById("restart").style.display = "block";
	}
};
//Global var to reference from other scripts
var myBar = new LoadBar();

//Checking resize window to recenter :)
window.onresize = function(){
	myBar.locate();
};
//Called on body load
start = function(){
	myBar.addScript("../../../javascripts/publish_loader_js/jsfile2.js");
	myBar.addScript("../../../javascripts/publish_loader_js/jsfile3.js");
	myBar.addScript("../../../javascripts/publish_loader_js/jsfile4.js");
	myBar.addScript("../../../javascripts/publish_loader_js/jsfile1.js");
	myBar.addScript("../../../javascripts/publish_loader_js/jsfile5.js");
	myBar.addScript("../../../javascripts/publish_loader_js/jsfile6.js");
	myBar.addScript("../../../javascripts/publish_loader_js/jsfile7.js");
	myBar.addScript("../../../javascripts/publish_loader_js/jsfile8.js");
	myBar.run();
};
//Called on click reset button
restart = function(){
	window.location.reload();
};