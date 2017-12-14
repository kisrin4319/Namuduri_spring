<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Bootstrap Photo Gallery Demo</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<link href="jquery.bsPhotoGallery.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="jquery.bsPhotoGallery.js"></script>
<script>
      $(document).ready(function(){
        $('ul.first').bsPhotoGallery({
          "classes" : "col-lg-2 col-md-4 col-sm-3 col-xs-4 col-xxs-12",
          "hasModal" : true,
          // "fullHeight" : false
        });
      });
      
      function bookSearch() {
        var searchUrl = 'http://localhost:8080/namuduri/efeelogSearchView.do';
        window.open(searchUrl, "confirm", "toolbar=no, location=no, status=no, scrollbars=no, resizable=no, width=350, height=350");
      }

      function goPage() {
        var f = $('form#efeelog');
        f.submit();
      }
    </script>
</head>
<style>
@import url(https://fonts.googleapis.com/css?family=Bree+Serif);

body {
	background: #ebebeb;
}

ul {
	padding: 0 0 0 0;
	margin: 0 0 40px 0;
}

ul li {
	list-style: none;
	margin-bottom: 10px;
}

.text {
	/*font-family: 'Bree Serif';*/
	color: #666;
	font-size: 11px;
	margin-bottom: 10px;
	padding: 12px;
	background: #fff;
}

#bsPhotoGalleryModal .modal-content {
	border-radius: 0;
}

#bsPhotoGalleryModal .modal-dialog img {
	text-align: center;
	margin: 0 auto;
	width: 100%;
}

#bsPhotoGalleryModal .modal-body {
	padding: 0px !important;
}

#bsPhotoGalleryModal .bsp-close {
	position: absolute;
	right: -14px;
	top: -11px;
	font-size: 30px;
	color: #fff;
	text-shadow: 1px 1px 18px #000;
}

#bsPhotoGalleryModal .bsp-close:hover {
	cursor: pointer;
	opacity: .6;
	text-shadow: none;
}

.bspHasModal {
	cursor: pointer;
}

.bspHasModal .text {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.imgWrapper {
	overflow: hidden;
	max-height: 99px;
}

a.bsp-controls, a.bsp-controls:visited, a.bsp-controls:active {
	position: absolute;
	top: 44%;
	font-size: 26px;
	color: #fff;
	text-shadow: 1px 1px 18px #000;
}

a.bsp-controls.next {
	right: -10px;
}

a.bsp-controls.previous {
	left: -10px;
}

a.bsp-controls:hover {
	opacity: .6;
	text-shadow: none;
}

.bsp-text-container {
	clear: both;
	display: block;
	padding-bottom: 5px;
}

#bsPhotoGalleryModal h6 {
	margin-bottom: 0;
	font-weight: bold;
	color: #000;
	font-size: 14px;
	padding-left: 12px;
	padding-right: 12px;
	margin-bottom: 5px;
}

#bsPhotoGalleryModal .pText {
	font-size: 11px;
	margin-bottom: 0px;
	padding: 0 12px 5px;
}

@media screen and (max-width: 380px) {
	.col-xxs-12 {
		width: 100%;
	}
	.col-xxs-12 img {
		width: 100%;
	}
}
</style>
<body>
	<h2 style="text-align: -webkit-center; padding-top: 30px;">eFeelog</h2>
	<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
		<li>
			<a title="Go to Main" href="<%=cp%>/main.do">MAIN</a>
		</li>
		<li>
			<a title="Go to MY PAGE" href="<%=cp%>/mypage.do">MY PAGE</a>
		</li>
	</ul>
	<div class="container">
		<div class="row" style="text-align: center; border-bottom: 1px dashed #ccc; padding: 0 0 20px 0; margin-bottom: 40px;">
			<div class="col-md-2 col-sm-3 col-xs-12">
				<div class="shop-widget">
					<div class="shop-widget-top">
						<aside class="widget widget-categories">
							<h2 class="sidebar-title text-center">CATEGORY</h2>
							<ul class="sidebar-menu">
								<li>
									<a href="<%=cp%>/order/orderListCheckView.do">
										<i class="fa fa-angle-double-right"></i>
										주문/배송 조회
									</a>
								</li>
								<li>
									<a href="<%=cp%>/member/memberModifyView.do">
										<i class="fa fa-angle-double-right"></i>
										회원 정보수정
									</a>
								</li>
								<li>
									<a href="<%=cp%>/member/memberDeleteView.do">
										<i class="fa fa-angle-double-right"></i>
										회원 탈퇴
									</a>
								</li>
								<li>
									<a href="<%=cp%>/eFeelogView.do">
										<i class="fa fa-angle-double-right"></i>
										eFeelog
									</a>
								</li>
							</ul>
						</aside>
					</div>
				</div>
			</div>
			<h3 style="font-family: 'Bree Serif', arial; font-weight: bold; font-size: 30px;">
				<a style="text-decoration: none; color: #666;" href="http://michaelsoriano.com/create-a-responsive-photo-gallery-with-bootstrap-framework/">
					Bootstrap Photo Gallery jQuery plugin
					<span style="color: red;">Demo</span>
				</a>
			</h3>
			<p>
				Resize your browser and watch the gallery adapt to the view port size. Clicking on an image will activate the Modal. Click
				<strong>
					<a style="color: red" href="http://michaelsoriano.com/create-a-responsive-photo-gallery-with-bootstrap-framework/">Here</a>
				</strong>
				to go back to the tutorial
			</p>
		</div>
		<ul class="row first">
			<li>
				<img alt="Rocking the night away" src="http://demo.michaelsoriano.com/images/photodune-174908-rocking-the-night-away-xs.jpg">
				<div class="text">Consectetur adipiscing elit</div>
			</li>
			<li>
				<img alt="Yellow sign" src="http://demo.michaelsoriano.com/images/photodune-287182-blah-blah-blah-yellow-road-sign-xs.jpg">
				<div class="text">Lorem ipsum dolor sit amet, labore et dolore magna aliqua. Ut enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Colors" src="http://demo.michaelsoriano.com/images/photodune-460760-colors-xs.jpg">
				<div class="text">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.</div>
			</li>
			<li>
				<img alt="Retro party" src="http://demo.michaelsoriano.com/images/photodune-461673-retro-party-xs.jpg">
				<div class="text">Lorem, do eiusmod tempor incid Ut enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Technology soup" src="http://demo.michaelsoriano.com/images/photodune-514834-touchscreen-technology-xs.jpg">
				<div class="text">Do eiusmod tempor</div>
			</li>
			<li>
				<img alt="Legal docs" src="http://demo.michaelsoriano.com/images/photodune-916206-legal-xs.jpg" data-bsp-large-src="http://demo.michaelsoriano.com/images/photodune-916206-legal-large.jpg">
				<div class="text">Eiusmod tempor enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Nature shot" src="http://demo.michaelsoriano.com/images/photodune-1062948-nature-xs.jpg">
				<div class="text">Adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Kid with camera" src="http://demo.michaelsoriano.com/images/photodune-1471528-insant-camera-kid-xs.jpg" data-bsp-large-src="http://demo.michaelsoriano.com/images/photodune-1471528-insant-camera-kid-large.jpg">
				<div class="text">Lorem ipsum dolor sit amet, labore et dolore magna aliqua. Ut enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Relax and Chill" src="http://demo.michaelsoriano.com/images/photodune-2255072-relaxed-man-xs.jpg">
				<div class="text">Eiusmod tempor enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Cool colors" src="http://demo.michaelsoriano.com/images/photodune-2360379-colors-xs.jpg">
				<div class="text">Consectetur adipiscing elit</div>
			</li>
			<li>
				<img alt="Jump over" src="http://demo.michaelsoriano.com/images/photodune-2360571-jump-xs.jpg">
				<div class="text">Lorem ipsum dolor sit amet, labore et dolore magna aliqua. Ut enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Culture business" src="http://demo.michaelsoriano.com/images/photodune-2361384-culture-for-business-xs.jpg">
				<div class="text">Adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Spaghetti bitch" src="http://demo.michaelsoriano.com/images/photodune-2441670-spaghetti-with-tuna-fish-and-parsley-s.jpg">
				<div class="text">Lorem ipsum dolor sit amet, labore et dolore magna aliqua. Ut enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Budget this" src="http://demo.michaelsoriano.com/images/photodune-2943363-budget-xs.jpg">
				<div class="text">Adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Street art" src="http://demo.michaelsoriano.com/images/photodune-3444921-street-art-xs.jpg">
				<div class="text">Consectetur adipiscing elit, re magna aliqua. Ut enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Insurance and stuff" src="http://demo.michaelsoriano.com/images/photodune-3552322-insurance-xs.jpg">
				<div class="text">Ut enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Food Explosion" src="http://demo.michaelsoriano.com/images/photodune-3807845-food-s.jpg">
				<div class="text">Eiusmod tempor enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Office worker sad" src="http://demo.michaelsoriano.com/images/photodune-3835655-down-office-worker-xs.jpg">
				<div class="text">Ut enim ad minim veniam</div>
			</li>
			<li>
				<img alt="" src="http://demo.michaelsoriano.com/images/photodune-4619216-ui-control-knob-regulators-xs.jpg">
				<div class="text">Do eiusmod tempor</div>
			</li>
			<li>
				<img alt="Health" src="http://demo.michaelsoriano.com/images/photodune-5771958-health-xs.jpg">
				<div class="text">Lorem ipsum dolor sit amet, labore et dolore magna aliqua. Ut enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Constant consecutuir" src="http://demo.michaelsoriano.com/images/photodune-268693-businesswoman-using-laptop-outdoors-xs.jpg">
				<!--no alt tag-->
				<div class="text">Consectetur adipiscing elit, re magna aliqua. Ut enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Search code" src="http://demo.michaelsoriano.com/images/photodune-352207-search-of-code-s.jpg">
				<div class="text">Adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Pountac" src="http://demo.michaelsoriano.com/images/photodune-247190-secret-email-xs.jpg">
				<!--no alt tag, no text-->
				<div class="text">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.</div>
			</li>
			<li>
				<img alt="Budget again" src="http://demo.michaelsoriano.com/images/photodune-2943363-budget-xs.jpg">
				<div class="text">Adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Some alt tag" src="http://demo.michaelsoriano.com/images/photodune-3444921-street-art-xs.jpg">
				<!--no alt-->
				<div class="text">Consectetur adipiscing elit, re magna aliqua. Ut enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Insurance boy" src="http://demo.michaelsoriano.com/images/photodune-3552322-insurance-xs.jpg">
				<div class="text">Ut enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Food service" src="http://demo.michaelsoriano.com/images/photodune-3807845-food-s.jpg">
				<div class="text">Eiusmod tempor enim ad minim veniam</div>
			</li>
			<li>
				<img alt="Dopamine high" src="http://demo.michaelsoriano.com/images/photodune-3835655-down-office-worker-xs.jpg">
				<div class="text">Ut enim ad minim veniam</div>
			</li>
		</ul>
	</div>
	<!-- /container -->
	<script type="text/javascript">
	(function($) {
	  "use strict";
	  $.fn.bsPhotoGallery = function(options) {

	      var settings = $.extend({}, $.fn.bsPhotoGallery.defaults, options);
	      var id = generateId();
	      var classesString = settings.classes;
	      var classesArray = classesString.split(" ");
	      var clicked = {};

	      function getCurrentUl(){
	        return 'ul[data-bsp-ul-id="'+clicked.ulId+'"][data-bsp-ul-index="'+clicked.ulIndex+'"]';
	      }
	      function generateId() {
	        //http://fiznool.com/blog/2014/11/16/short-id-generation-in-javascript/
	        var ALPHABET = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	        var ID_LENGTH = 4;
	        var out = '';
	        for (var i = 0; i < ID_LENGTH; i++) {
	          out += ALPHABET.charAt(Math.floor(Math.random() * ALPHABET.length));
	        }
	        return 'bsp-'+out;
	      }
	      function createModalWrap(){

	        if($('#bsPhotoGalleryModal').length !== 0){
	          return false;
	        }

	        var modal = '';
	        modal += '<div class="modal fade" id="bsPhotoGalleryModal" tabindex="-1" role="dialog"';
	        modal += 'aria-labelledby="myModalLabel" aria-hidden="true">';
	        modal += '<div class="modal-dialog modal-lg"><div class="modal-content">';
	        modal += '<div class="modal-body"></div></div></div></div>';
	        $('body').append(modal);

	      }
	      function showHideControls(){
	    		var total = $(getCurrentUl()+' li[data-bsp-li-index]').length;

	    		if(total === clicked.nextImg){
	    			$('a.next').hide();
	    		}else{
	    			$('a.next').show()
	    		}
	    		if(clicked.prevImg === -1){
	    			$('a.previous').hide();
	    		}else{
	    			$('a.previous').show()
	    		}
	    	}
	      function showModal(){

	          var src = $(this).find('img').attr('src');
	          var largeImg = $(this).find('img').attr('data-bsp-large-src');
	          if(typeof largeImg === 'string'){
	                src = largeImg;
	          }
	          var index = $(this).attr('data-bsp-li-index');
	          var ulIndex = $(this).parent('ul').attr('data-bsp-ul-index');
	          var ulId = $(this).parent('ul').attr('data-bsp-ul-id');
	          var theImg = $(this).find('img');
	          var pText = $(this).find('.text').html();        
	          var modalText = typeof pText !== 'undefined' ? pText : 'undefined';
	          var alt =  typeof theImg.attr('alt') == 'string' ? theImg.attr('alt') : null;
	          
	          clicked.img = src;
	          clicked.prevImg = parseInt(index) - parseInt(1);
	      		clicked.nextImg = parseInt(index) + parseInt(1);
	          clicked.ulIndex = ulIndex;
	          clicked.ulId = ulId;


	          $('#bsPhotoGalleryModal').modal();

	          var html = '';
	          var img = '<img src="' + clicked.img + '" class="img-responsive"/>';

	          html += img;
	          html += '<span class="' + settings.iconClose + ' bsp-close"></span>';
	          html += '<div class="bsp-text-container">';
	          
	          if(alt !== null){
	            html += '<h6>'+alt+'</h6>'
	          }
	          if(typeof pText !== 'undefined'){
	            html += '<p class="pText">'+pText+'</p>'
	          }        
	          html += '</div>';
	        
				    if(settings.showControl){
	            html += '<a class="bsp-controls next" data-bsp-id="'+clicked.ulId+'" href="'+ (clicked.nextImg) + '"><span class="' + settings.iconRight + '"></span></a>';
	            html += '<a class="bsp-controls previous" data-bsp-id="'+clicked.ulId+'" href="' + (clicked.prevImg) + '"><span class="' + settings.iconLeft + '"></span></a>';
	          }
	          $('#bsPhotoGalleryModal .modal-body').html(html);
	          $('.bsp-close').on('click', closeModal);
	          showHideControls();
	      }

	      function closeModal(){
	        $('#bsPhotoGalleryModal').modal('hide');
	      }

	      function nextPrevHandler(){

	          var ul = $(getCurrentUl());
	          var index = $(this).attr('href');

	          var src = ul.find('li[data-bsp-li-index="'+index+'"] img').attr('src');
	          var largeImg = ul.find('li[data-bsp-li-index="'+index+'"] img').attr('data-bsp-large-src');
	          if(typeof largeImg === 'string'){
	                src = largeImg;
	          } 
	          
	          var pText = ul.find('li[data-bsp-li-index="'+index+'"] .text').html();        
	          var modalText = typeof pText !== 'undefined' ? pText : 'undefined';
	          var theImg = ul.find('li[data-bsp-li-index="'+index+'"] img');
	          var alt =  typeof theImg.attr('alt') == 'string' ? theImg.attr('alt') : null;
	           
	          $('#bsPhotoGalleryModal .modal-body img').attr('src', src);
	          var txt = '';
	          if(alt !== null){
	            txt += '<h6>'+alt+'</h6>'
	          }
	          if(typeof pText !== 'undefined'){
	            txt += '<p class="pText">'+pText+'</p>'
	          }        
	          
	          $('.bsp-text-container').html(txt); 

	          clicked.prevImg = parseInt(index) - 1;
	          clicked.nextImg = parseInt(clicked.prevImg) + 2;

	          if($(this).hasClass('previous')){
	              $(this).attr('href', clicked.prevImg);
	              $('a.next').attr('href', clicked.nextImg);
	          }else{
	              $(this).attr('href', clicked.nextImg);
	              $('a.previous').attr('href', clicked.prevImg);
	          }
	          // console.log(clicked);
	        showHideControls();
	        return false;
	      }
	      function clearModalContent(){
	        $('#bsPhotoGalleryModal .modal-body').html('');
	        clicked = {};
	      }
	      function insertClearFix(el,x){
	        var index = (x+1);
	        $.each(classesArray,function(e){
	           switch(classesArray[e]){
	             //large
	             case "col-lg-1":
	                  if($(el).next('li.clearfix').length == 0){
	                    $(el).after('<li class="clearfix visible-lg-block"></li>');
	                  }
	              break;
	             case "col-lg-2":
	                if(index%6 === 0){
	                  $(el).after('<li class="clearfix visible-lg-block"></li>');
	                }
	              break;
	             case "col-lg-3":
	              if(index%4 === 0){
	                $(el).after('<li class="clearfix visible-lg-block"></li>');
	              }
	             break;
	             case "col-lg-4":
	              if(index%3 === 0){
	                $(el).after('<li class="clearfix visible-lg-block"></li>');
	              }
	             break;
	             case "col-lg-5":
	             case "col-lg-6":
	              if(index%2 === 0){
	                $(el).after('<li class="clearfix visible-lg-block"></li>');
	              }
	             break;
	             //medium
	             case "col-md-1":
	                  if($(el).next('li.clearfix').length == 0){
	                    $(el).after('<li class="clearfix visible-md-block"></li>');
	                  }
	              break;
	             case "col-md-2":
	                if(index%6 === 0){
	                  $(el).after('<li class="clearfix visible-md-block"></li>');
	                }
	              break;
	             case "col-md-3":
	              if(index%4 === 0){
	                $(el).after('<li class="clearfix visible-md-block"></li>');
	              }
	             break;
	             case "col-md-4":
	              if(index%3 === 0){
	                $(el).after('<li class="clearfix visible-md-block"></li>');
	              }
	             break;
	             case "col-md-5":
	             case "col-md-6":
	              if(index%2 === 0){
	                $(el).after('<li class="clearfix visible-md-block"></li>');
	              }
	             break;
	             //small
	             case "col-sm-1":
	                  if($(el).next('li.clearfix').length == 0){
	                    $(el).after('<li class="clearfix visible-sm-block"></li>');
	                  }
	              break;
	             case "col-sm-2":
	                if(index%6 === 0){
	                  $(el).after('<li class="clearfix visible-sm-block"></li>');
	                }
	              break;
	             case "col-sm-3":
	              if(index%4 === 0){
	                $(el).after('<li class="clearfix visible-sm-block"></li>');
	              }
	             break;
	             case "col-sm-4":
	              if(index%3 === 0){
	                $(el).after('<li class="clearfix visible-sm-block"></li>');
	              }
	             break;
	             case "col-sm-5":
	             case "col-sm-6":
	              if(index%2 === 0){
	                $(el).after('<li class="clearfix visible-sm-block"></li>');
	              }
	             break;
	             //x-small
	             case "col-xs-1":
	                  if($(el).next('li.clearfix').length == 0){
	                    $(el).after('<li class="clearfix visible-xs-block"></li>');
	                  }
	              break;
	             case "col-xs-2":
	                if(index%6 === 0){
	                  $(el).after('<li class="clearfix visible-xs-block"></li>');
	                }
	              break;
	             case "col-xs-3":
	              if(index%4 === 0){
	                $(el).after('<li class="clearfix visible-xs-block"></li>');
	              }
	             break;
	             case "col-xs-4":
	              if(index%3 === 0){
	                $(el).after('<li class="clearfix visible-xs-block"></li>');
	              }
	             break;
	             case "col-xs-5":
	             case "col-xs-6":
	              if(index%2 === 0){
	                $(el).after('<li class="clearfix visible-xs-block"></li>');
	              }
	             break;
	           }
	        });
	      }


	      this.each(function(i){
	        //ul
	        var items = $(this).find('li');
	        $(this).attr('data-bsp-ul-id', id);
	        $(this).attr('data-bsp-ul-index', i);

	        items.each(function(x){
	          var theImg = $(this).find('img'); 
	          insertClearFix(this,x);
	          $(this).addClass(classesString);
	          $(this).attr('data-bsp-li-index', x);
	          theImg.addClass('img-responsive');
	          if(settings.fullHeight){
	            theImg.wrap('<div class="imgWrapper"></div>')
	          }
	          if(settings.hasModal === true){
	            $(this).addClass('bspHasModal');
	            $(this).on('click', showModal);
	          }
	        });
	      })

	      if(settings.hasModal === true){
	        //this is for the next / previous buttons
	        $(document).on('click', 'a.bsp-controls[data-bsp-id="'+id+'"]', nextPrevHandler);
	        $(document).on('hidden.bs.modal', '#bsPhotoGalleryModal', clearModalContent);
	        //start init methods
	        createModalWrap();
	      }

	      return this;
	  };
	  /*defaults*/
	  $.fn.bsPhotoGallery.defaults = {
	    'classes' : 'col-lg-2 col-md-2 col-sm-3 col-xs-4',
	    'showControl' : true,
	    'hasModal' : true, 
	    'fullHeight' : true,
	    'iconClose' : 'glyphicon glyphicon-remove-circle',
	    'iconLeft' : 'glyphicon glyphicon-chevron-left',
	    'iconRight' : 'glyphicon glyphicon-chevron-right'
	  }


	}(jQuery));
	</script>
</body>
</html>