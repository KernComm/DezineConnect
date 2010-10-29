			$(document).ready(function(){

				//To switch directions up/down and left/right just place a "-" in front of the top/left attribute
				//Vertical Sliding

				//Caption Sliding (Partially Hidden to Visible)
				$('.boxgrid.caption').hover(function(){
					$(".cover", this).stop().animate({top:'65px'},{queue:false,duration:500});
				}, function() {
					$(".cover", this).stop().animate({top:'120px'},{queue:false,duration:500});
				});

                                $('.boxgrid_big.caption_big').hover(function(){

					$(".cover_big", this).stop().animate({top:'180px'},{queue:false,duration:500});
				}, function() {

					$(".cover_big", this).stop().animate({top:'240px'},{queue:false,duration:500});
				});
			});