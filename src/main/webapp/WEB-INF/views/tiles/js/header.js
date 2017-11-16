var domain = 'http://www.kyobobook.co.kr';
var sslDomain = 'https://www.kyobobook.co.kr';
//var domain = 'http://'+document.domain;
//var sslDomain = 'http://'+document.domain;
var orderDomain = 'http://order.kyobobook.co.kr';
var orderSslDomain = 'https://order.kyobobook.co.kr';

var daumDomain = document.domain;

if(daumDomain == "my.book.daum.net" || daumDomain == "book.daum.net" || daumDomain == "daum.net")
{
    sslDomain = "";
}

//================================================================================
// top 이 되는 위치 찾아내기.. error 가 발생할때 까지 상위를 찾는다 (제휴사 프레임 관련 필요)
//
// 작성자 : mistyi
// 사용예 : top.location.href -> findTop().location.href 이렇게 사용하세요
//================================================================================
function findTop(){
	var dom = "";
	var par = "";

	//================================================================
	// 여기는 제휴사 페이지가 교보문고 안에 존재할때의 경우임
	//================================================================
	//CoomContent 라는 프레임안에 들어있는거라면 top.CoopContent 으로 이동
	var a = eval("top.CoopContent");
	//위에서 오류가 발생하면 아래 return 스크립트는 타지 않는다.
	if (eval("top.CoopContent")!=null) {
		return top.CoopContent;
	}

	//================================================================
	// 이후는 제휴사 페이지가 해당 도메인에 있을 경우의 처리이다.
	//================================================================
	try {
		//아래 스크립트가 정상 작동하면 프레임안에 들어있지 않다
		dom = top.document.domain;
		return top;
	} catch (e) {
		//스크립트 오류가 발생한다면 제휴사 프레임 안에 들어가 있다고 본다.
		try {
			// 3단계이상의 프레임 구조는 없다고 본다...
			for (var i=0; i<4; i++) {
				dom = eval(par+"document.domain");
				par += "parent.";
			}
		} catch (e) {
			if (par=="parent.") {
				// 첫번째단계에서 오류가 발생하면 self 로 처리
				return self;
			}else{
				// 두번째단계이상일때 마지막 parent. 을 떼어내고 객체로 변환하여 반환
				return eval(par.substring(0,par.length-8));
			}
		}
	}
}

// 로그인후 페이지 리프레시가 안될 경우 탑의 로그인 관련 메뉴 부분을 교체해준다
function loginTopRefresh() {
	findTop().document.all.loginTb.style.display='';
	findTop().document.all.noLoginTb.style.display='none';
}


/* Navigation 관련 부분
* 수정 : domain 추가 (2008.01.04 by 이현미)
*/
function openLogin(retURL) {
	if(retURL == null || retURL == "")
		retURL=location.href;

	if(typeof(retURL) == "undefined")	{
		window.location = domain+"/login/login.laf";
	} else {
		window.location = domain+"/login/login.laf?retURL=" + escape(retURL);
	}
}

/* 
* 재로그인 페이지 추가(2015. 8. 6 김수호)
*/
function reLogin(retURL) {
	if(retURL == null || retURL == "")
		retURL=location.href;
	
	if(typeof(retURL) == "undefined")	{
		if(retURL.indexOf("https") != -1){
			window.location = sslDomain+"/myroom/reLogin.laf";
		}else{
			window.location = domain+"/myroom/reLogin.laf";
		}
	} else {
		if(retURL.indexOf("https") != -1){
			window.location = sslDomain+"/myroom/reLogin.laf?retURL=" + escape(retURL);
		}else{
			window.location = domain+"/myroom/reLogin.laf?retURL=" + escape(retURL);
		}
	}
}

// 로그인후 특정 스크립트를 동작시키고자 할때 (로그인창 위주로 생각해야 함. 예를들면 opener.abc())
function openLoginScript(scr) {
	if(typeof(scr) == "undefined")	{
		window.location = domain+"/login/login.laf";
	} else {
		window.location = domain+"/login/login.laf?retScript=" + escape(scr) + "&closeYn=Y";
	}
}

function openLoginSubmit(formname) {
	window.location = domain+"/login/login.laf?formName=" + formname;
}

function openOrderSend() {
	window.location = domain+"/login/loginOrderSend.laf";
}

function goPublisher() {
	document.location.href = domain+"/publisher";
}

// 주문하기 로그인(보안 로그인으로 수정, 2007/06/05 by leehyunmee)
function openLoginOrder(formname) {
	eval("chkIndex = " + formname + ".indexCnt;");
	isCheck = false;
	if(typeof(chkIndex[0]) == 'undefined') {
		if(chkIndex.checked) {
			isCheck = true;
		}
	} else {
		for( var i=0; i<chkIndex.length; i++) {
			if(chkIndex[i].type == 'checkbox') {
				if(chkIndex[i].checked) {
					isCheck = true;
					break;
				}
			}
		}
	}
	if(!isCheck) { 
		alert("주문하실 상품을 하나 이상 선택하셔야 합니다.");
	} else {
		//window.open("/login/login.laf?formname=" + formname, "LoginPop", "width=420,height=283,left=100,top=100");

		// 보안 로그인으로 수정, 2007/06/05 by leehyunmee
		window.open("/login/loginSSLPop.laf?formname=" + formname+"&retScript=opener.goOrderPopup('"+formname+"')&closeYn=Y&loginKind=ordersend", "LoginPop", "width=420,height=283,left=100,top=100,status=yes");

	}
}


//장바구니 로그인창에서 회원로그인하기(popup)
function goOrderLoginPop(formname){
	window.resizeTo(700,283);
	window.location.href=domain+"/login/loginSSLPop.laf?popup=Y&formname="+formname+"&retScript=opener.goOrderPopup0('"+formname+"')&closeYn=Y&loginKind=ordersend";
}

function goOrderPopup(formname) {
	eval("goOrderStep1(" + formname + ");");
}

function goOrderPopup0(formname) {
	eval("goOrderStep0(" + formname + ");");
}

function openLoginJoin(retURL, memid) {
window.open("/login/login.laf?cmemid=" + memid + "&retURL=" + retURL, "LoginPop", "width=420,height=283,left=100,top=100");
}

function openLoginJoinHottracks(retURL, memid) {
window.open("/hottracks/login/login.laf?cmemid=" + memid + "&retURL=" + retURL, "LoginPop", "width=420,height=283,left=100,top=100");
}


function logout() {
	var isFailPopKey = GetCookie('isFailPopKey');

	if(isFailPopKey == "Y")	{
		window.open('/login/PopupLogout.jsp', 'LogoutPop', 'width=325,height=178,left=100,top=100');
	}

	document.location.href = domain+"/login/logout.laf?Kc=GNHHNOlogout&orderClick=c05";
}

/*
 * 회원가입
 * 2007.07.05 이현미 수정 : ssl 적용(https)
 * 2011.07.14 오혜은 수정 : 특정일자 시간 동안 가입 막기
*/
function goMemberJoin(retURL) {
	if(typeof(retURL) == "undefined")	{
    document.location.href = sslDomain+"/member/joinMain.laf?Kc=GNHHNOmemberjoin&orderClick=c04";				
	} else {
		document.location.href = sslDomain+"/member/joinMain.laf?retURL=" + retURL;
	}
}

/*
 * 회원가입
 * 2006.04.25 윤동하 수정 (타겟을 받을 수 있게)
 * 2007.07.05 이현미 수정 : ssl 적용(https)
*/
function goMemberJoinPop(retURL,target) {
	if (target==null) {
		if(typeof(retURL) == "undefined")	{
			opener.document.location.href = sslDomain+"/member/joinMain.laf";
		} else {
			opener.document.location.href = sslDomain+"/member/joinMain.laf?retURL=" + retURL;
		}
		self.close();
	}else{
		if(typeof(retURL) == "undefined")	{
			target.document.location.href = sslDomain+"/member/joinMain.laf";
		} else {
			target.document.location.href = sslDomain+"/member/joinMain.laf?retURL=" + retURL;
		}
	}
}

//아이디 찾기
function goMemberIDSearchForm() {
	var url = "/login/memberIDSearchForm.laf";
	window.open(url,"MemberIDSearchForm","width=420,height=283");

}

//비밀번호찾기
function goMemberPWSearchForm() {
	var url = "/login/memberPWSearchForm.laf";
	window.open(url,"MemberPWSearchForm","width=420,height=283");

}

function goCart() {
	//document.location.href = domain+"/cart/cartList.laf?Kc=GNHHNOcart&orderClick=c06";
	document.location.href = orderDomain + "/cart/cartListMain?Kc=GNHHNOcart&orderClick=c06";
}


//이벤트 호출시 신규 클릭값 수정
function goEventOrderClickKc(barcode, eventId, ejkGb, orderClick, Kc,  targetName) {
	if(typeof(targetName) != 'undefined') {
		document.proCartOneForm.target = targetName;
	}
	//orderClick/Kc 코드 추가
	var clickParam = "";
	if(typeof(orderClick) != 'undefined'){
		if(orderClick != ""){
			clickParam = "orderClick="+orderClick;
		}
	}
	if(typeof(Kc) != 'undefined'){
		if(Kc != ""){
			clickParam = (clickParam != "") ? clickParam+"&Kc="+Kc : "Kc="+Kc;
		}
	}
	
	var goToUrl = "";
	if(ejkGb == 'ENG' || ejkGb == 'JAP' || ejkGb == 'BNT' || ejkGb == 'JNT') {
		goToUrl = domain+"/event/eventEngViewByPid.laf";
	} else if (ejkGb == 'MUC') {
		goToUrl = domain+"/event/eventMucViewByPid.laf";
	} else if (ejkGb == 'DVD') {
		goToUrl = domain+"/event/eventDvdViewByPid.laf";
	} else {
		goToUrl = domain+"/event/eventViewByPid.laf";
	}
	if(clickParam != ""){
		goToUrl = (goToUrl.indexOf("?") == -1)?(goToUrl+"?"+clickParam) : (goToUrl+"&"+clickParam);
	}
	document.proCartOneForm.do = goToUrl;
	
	document.proCartOneForm.eventId.value = eventId;
	document.proCartOneForm.barcode.value = barcode;
	document.proCartOneForm.ejkGb.value = ejkGb;
	document.proCartOneForm.Kc.value = Kc;
		
	document.proCartOneForm.submit();

}


// 20080321 권근호
//디지털 교보문고 상품인 경우 true 아니면 false
function goAddCartIsDigital(ejkGb)
{
	//디지털 교보문고 상품인 경우
	if(ejkGb == 'EBK' || ejkGb == 'AUD' || ejkGb == 'VOD' || ejkGb == 'KDS' || ejkGb == 'DSE' || ejkGb == 'DUM' || ejkGb == 'DMA')
		return true;
	else
		return false;
}


// 20080321 권근호
// 1. 디지털 교보문고 상품 장바구니 담기 시 세션을 체크하여 로그인 창을 띄우고 메세지를 출력한다.
function goAddCartCheckDigital(ejkGb)
{
	//디지털 교보문고 상품
	if ( goAddCartIsDigital(ejkGb) )
	{
		if (GetCookie("EMCNO") == '' || GetCookie("EMCNO") == null )
		{
			alert("이 상품은 배송이 되지 않는 디지털상품(전자책 등)입니다.\n\n 상품구매를 위해서는 로그인이 필요합니다.");
			openLogin();
			return 'L';
		}
		return 'D';
	}
	else
	{
		return 'N';
	}
}

function goAddCartList(formname, targetName) {

	var clickstr = "";

	var ie = (document.all)? true:false;
	if(ie) {
		if(event != null) {
			var curTag = event.srcElement;
			var i=0;

			while(curTag.parentElement && i<40) {
				if(curTag.tagName == "SPAN" && curTag.name == "orderclick") {
					clickstr = "?clickOrder=" + curTag.value;
					break;
				}
				curTag = curTag.parentElement;
				i++;
			}
		}
	}

	if(typeof(formname.indexCnt[1]) == "undefined")
	{
		if ( formname.indexCnt.checked == true && goAddCartCheckDigital(formname.ejkGb.value) == 'L') return;
	}
	else
	{
		for(i=0;i< formname.indexCnt.length ; i++)
		{
			if ( formname.indexCnt[i].checked == true && goAddCartCheckDigital(formname.ejkGb[i].value) == 'L') return;
		}
	}

	chkIndex = formname.indexCnt;
	isCheck = false;
	if(typeof(chkIndex.length) == "undefined") {
		if(chkIndex.type == 'checkbox') {
			if(chkIndex.checked) {
				isCheck = true;
			}
		}
	} else {
		for( var i=0; i<chkIndex.length; i++) {
			if(chkIndex[i].type == 'checkbox') {
				if(chkIndex[i].checked) {
					isCheck = true;
					break;
				}
			}
		}
	}
	if(!isCheck) {
		alert("상품을 하나라도 선택하셔야 합니다.");
	} else {
		if(typeof(targetName) != "undefined") {
			formname.target = targetName;
		}
		if(formname.target=="_parent")
		{
			formname.target = "HiddenActionFrame";
		}
		//formname.do = domain+"/cart/cartAdd.laf" + clickstr;
		if(clickstr != ""){
			formname.do = orderDomain+"/cart/addCart" + clickstr + "&spbk_dvsn_code=002";
		}else{
			formname.do = orderDomain+"/cart/addCart?spbk_dvsn_code=002";
		}
		formname.submit();
	}
formname.do="";	
}

function goEvent(barcode, eventId, ejkGb, targetName) {
		if(typeof(targetName) != 'undefined') {
			document.proCartOneForm.target = targetName;
		}

        if(ejkGb == 'ENG' || ejkGb == 'JAP' || ejkGb == 'BNT' || ejkGb == 'JNT') {
		    document.proCartOneForm.do = domain+"/event/eventEngViewByPid.laf";
        } else if (ejkGb == 'MUC') {
            document.proCartOneForm.do = domain+"/event/eventMucViewByPid.laf";
        } else if (ejkGb == 'DVD') {
            document.proCartOneForm.do = domain+"/event/eventDvdViewByPid.laf";
        } else {
            document.proCartOneForm.do = domain+"/event/eventViewByPid.laf";
        }
		document.proCartOneForm.eventId.value = eventId;
		document.proCartOneForm.barcode.value = barcode;
		document.proCartOneForm.ejkGb.value = ejkGb;
		document.proCartOneForm.submit();

}

// 이벤트 호출시 신규 클릭값 수정
// 2011.12.14 임성인
function goEventKc(barcode, eventId, ejkGb, Kc,  targetName) {
		if(typeof(targetName) != 'undefined') {
			document.proCartOneForm.target = targetName;
		}

        if(ejkGb == 'ENG' || ejkGb == 'JAP' || ejkGb == 'BNT' || ejkGb == 'JNT') {
		    document.proCartOneForm.do = domain+"/event/eventEngViewByPid.laf";
        } else if (ejkGb == 'MUC') {
            document.proCartOneForm.do = domain+"/event/eventMucViewByPid.laf";
        } else if (ejkGb == 'DVD') {
            document.proCartOneForm.do = domain+"/event/eventDvdViewByPid.laf";
        } else {
            document.proCartOneForm.do = domain+"/event/eventViewByPid.laf";
        }
		document.proCartOneForm.eventId.value = eventId;
		document.proCartOneForm.barcode.value = barcode;
		document.proCartOneForm.ejkGb.value = ejkGb;
		document.proCartOneForm.Kc.value = Kc;
		
		document.proCartOneForm.submit();

}

function goEventPop(barcode, eventId, ejkGb, targetName) {
		if(typeof(targetName) != 'undefined') {
			document.proCartOneForm.target = targetName;

		}

        if(ejkGb == 'ENG' || ejkGb == 'JAP' || ejkGb == 'BNT' || ejkGb == 'JNT') {
		    document.proCartOneForm.do = domain+"/event/eventEngViewByPid.laf";
        } else if (ejkGb == 'MUC') {
            document.proCartOneForm.do = domain+"/event/eventMucViewByPid.laf";
        } else if (ejkGb == 'DVD') {
            document.proCartOneForm.do = domain+"/event/eventDvdViewByPid.laf";
        } else {
            document.proCartOneForm.do = domain+"/event/eventViewByPid.laf";
        }


    var w = window.open('about:blank' ,'eventpop') ;
    document.proCartOneForm.target = "eventpop";
		document.proCartOneForm.eventId.value = eventId;
		document.proCartOneForm.barcode.value = barcode;
		document.proCartOneForm.ejkGb.value = ejkGb;
		document.proCartOneForm.method = "post";
		document.proCartOneForm.submit();

}

function showAddWish(nowIndex) {
	eval("tabWish" + nowIndex + ".style.display = '';");
}

function hideAddWish(nowIndex) {
	eval("tabWish" + nowIndex + ".style.display = 'none';");
}

function showAddWishList(obj) {
	obj.style.display = "";
}

function hideAddWishList(obj) {
	obj.style.display = "none";
}


//바로구매하기 사용시 처음 호출하는 함수.
function goDirectOrder(formname, nowIndex) {
    if(typeof(formname.qty[nowIndex-1]) == "undefined") {
		if(formname.qty.value == "0") {
			alert("주문수량은 1개 이상이어야 합니다.");
		} else {
			document.proCartOneForm.barcode.value = formname.barcode.value;
			document.proCartOneForm.ejkGb.value = formname.ejkGb.value;
			document.proCartOneForm.qty.value = formname.qty.value;
			switch( goAddCartCheckDigital(document.proCartOneForm.ejkGb.value))
			{
				case 'L':
					return;
					break;
				case 'D':
					document.proCartOneForm.cartType.value = (typeof(formname.cartType[nowIndex-1]) == "undefined") ? formname.cartType.value : formname.cartType[nowIndex-1].value;
					break;
			}
			document.proCartOneForm.do= domain+"/cart/TotDirectAddCart.jsp";
	 		document.proCartOneForm.submit();
			
		}
	} else {
		if(formname.qty[nowIndex-1].value == "0") {
			alert("주문수량은 1개 이상이어야 합니다.");
		} else {
			document.proCartOneForm.barcode.value = formname.barcode[nowIndex-1].value;
			if(typeof(formname.ejkGb[nowIndex-1]) == "undefined") {
				document.proCartOneForm.ejkGb.value = formname.ejkGb.value;
			} else {
				document.proCartOneForm.ejkGb.value = formname.ejkGb[nowIndex-1].value;
			}
			document.proCartOneForm.qty.value = formname.qty[nowIndex-1].value;
			switch( goAddCartCheckDigital(document.proCartOneForm.ejkGb.value))
			{
				case 'L':
					return;
					break;
				case 'D':
					document.proCartOneForm.cartType.value = (typeof(formname.cartType[nowIndex-1]) == "undefined") ? formname.cartType.value : formname.cartType[nowIndex-1].value;
					break;
			}
			if (document.proCartOneForm.ejkGb.value == "UMI")
			{
				try {
			    document.proCartOneForm.kind.value = getvalueofradio(eval("formname.kind"+(nowIndex-1)));
			  } catch(e){}
			}
			document.proCartOneForm.do= domain+"/cart/TotDirectAddCart.jsp";
			document.proCartOneForm.submit();
		}
	}
}

//바로구매하기 로그인 페이지로 이동.
function goDirectOrderTot(formname, nowIndex) {

	if(typeof(formname.qty[nowIndex-1]) == "undefined") {
		if(formname.qty.value == "0") {
			alert("주문수량은 1개 이상이어야 합니다.");
		} else {
			document.proCartOneForm.barcode.value = formname.barcode.value;
			document.proCartOneForm.ejkGb.value = formname.ejkGb.value;
			document.proCartOneForm.qty.value = formname.qty.value;
			
			if(formname.ejkGb.value == 'EBK' || formname.ejkGb.value == 'AUD' || formname.ejkGb.value == 'VOD' ||
	 		   formname.ejkGb.value == 'KDS' || formname.ejkGb.value == 'DUM' || formname.ejkGb.value == 'DSE' || 
	 		   formname.ejkGb.value == 'DMA' || (formname.ejkGb.value == 'KOR' && formname.cartType.value == 'BTK'))
	 		{   
				document.proCartOneForm.cartType.value = (typeof(formname.cartType[nowIndex-1]) == "undefined") ? formname.cartType.value : formname.cartType[nowIndex-1].value;
            }
            
			//로그인 전.
     		if(formname.loginYN.value == 'N')
     		{
	 			document.proCartOneForm.method="post";
	 			document.proCartOneForm.do= domain+"/login/loginDirect.laf?kindtype=directorder";
	 			document.proCartOneForm.submit();
			//로그인 후.
	 		}else {
	 		   //중고장터 바로구매하기.
	 		   if(formname.ejkGb.value == 'USE')
	 		   {
	 		         document.location.href= "https://used.kyobobook.co.kr/order/orderDetail.ink?barcode="+formname.barcode.value+"&qty=1&totOrderYn=Y";
	 			//ebook상품 바로구매하기. 
	 		   }else{
	    			 document.proCartOneForm.method="get";
	    			 document.proCartOneForm.do= domain+"/cart/cartDirectAdd.laf";
	 			     document.proCartOneForm.submit();
	 		   }	     
	 		}		
		}
	} else {
		if(formname.qty[nowIndex-1].value == "0") {
			alert("주문수량은 1개 이상이어야 합니다.");
		} else {
			document.proCartOneForm.barcode.value = formname.barcode[nowIndex-1].value;
			if(typeof(formname.ejkGb[nowIndex-1]) == "undefined") {
				document.proCartOneForm.ejkGb.value = formname.ejkGb.value;
			} else {
				document.proCartOneForm.ejkGb.value = formname.ejkGb[nowIndex-1].value;
			}
			document.proCartOneForm.qty.value = formname.qty[nowIndex-1].value;
			
			if(formname.ejkGb[nowIndex-1].value == 'EBK' || formname.ejkGb[nowIndex-1].value == 'AUD' || formname.ejkGb[nowIndex-1].value == 'VOD' ||
	 		   formname.ejkGb[nowIndex-1].value == 'KDS' || formname.ejkGb[nowIndex-1].value == 'DUM' || formname.ejkGb[nowIndex-1].value == 'DSE' || 
	 		   formname.ejkGb[nowIndex-1].value == 'DMA' || (formname.ejkGb[nowIndex-1].value == 'KOR' && formname.cartType.value == 'BTK'))
	 		{   
				document.proCartOneForm.cartType.value = (typeof(formname.cartType[nowIndex-1]) == "undefined") ? formname.cartType.value : formname.cartType[nowIndex-1].value;
            }
            
			if (document.proCartOneForm.ejkGb.value == "UMI")
			{
				try {
			    document.proCartOneForm.kind.value = getvalueofradio(eval("formname.kind"+(nowIndex-1)));
			  } catch(e){}
			}
			//로그인 전.
     		if(formname.loginYN.value == 'N')
     		{
	 			document.proCartOneForm.method="post";
	 			document.proCartOneForm.do= domain+"/login/loginDirect.laf?kindtype=directorder";
	 			document.proCartOneForm.submit();
	 		//로그인 후.
	 		}else {
	 		   //중고장터 바로구매하기.
	 		   if(formname.ejkGb[nowIndex-1].value == 'USE')
	 		   {
	 		         document.location.href= "https://used.kyobobook.co.kr/order/orderDetail.ink?barcode="+formname.barcode[nowIndex-1].value+"&qty=1&totOrderYn=Y";
	 		   }else{
	    			 document.proCartOneForm.method="get";
	    			 document.proCartOneForm.do= domain+"/cart/cartDirectAdd.laf";
	 			     document.proCartOneForm.submit();
	 		   }	     
	 		}		
		}
	}
}

//바로구매하기 처리.
function goNomemOrder(barcode,ejkGb,qty,cartType) {
        
        if(barcode == "undefined" || ejkGb == "undefined" || qty == "undefined" || 
           barcode == "" || ejkGb == "" | qty == "" )
        {
           alert("입력정보가 부족합니다. 입력정보 확인바랍니다.");
           history.go(-2);
        }else{
           //중고장터 바로구매하기.
	 	   if(ejkGb == 'USE')
	 	   {
	 	        document.location.href= "https://used.kyobobook.co.kr/order/orderDetail.ink?barcode="+barcode+"&qty=1&totOrderYn=Y";
	 	   }else{
           		//document.location.href= domain+"/cart/cartDirectAdd.laf?barcode="+barcode+"&ejkGb="+ejkGb+"&qty="+qty+"&cartType="+cartType;
           		document.location.href= orderDomain + "/cart/addCart?spbk_dvsn_code=001&barcode="+barcode+"&ejkGb="+ejkGb+"&qty="+qty+"&cartType="+cartType;
           }
        }   
}

function goDirectOrderPoster(formname) {
	if(formname.qty.value == "0") {
		alert("주문수량은 1개 이상이어야 합니다.");
	} else {
		formname.posterAdd.value = "true";
		formname.do= domain+"/cart/cartDirectAdd.laf";
		formname.submit();
	}
}

function goAddCart(formname) {
	if(formname.qty.value == "0") {
		alert("주문수량은 1개 이상이어야 합니다.");
	} else {
		if(typeof(document.proCartOneForm) == "undefined") {
			document.proCartOneForm.barcode.value = formname.barcode.value;
			document.proCartOneForm.ejkGb.value = formname.ejkGb.value;
			document.proCartOneForm.qty.value = formname.qty.value;

			switch( goAddCartCheckDigital(document.proCartOneForm.ejkGb.value))
			{
				case 'L':
					return;
					break;
				case 'D':
					document.proCartOneForm.cartType.value = formname.cartType.value;
					break;
			}

		}
		formname.target = "iframecart";
		//formname.do = domain+"/cart/cartAdd.laf";
		formname.do = orderDomain+"/cart/addCart" + "?spbk_dvsn_code=002";
		formname.submit();
	}
}

/*바로드림 바로 주문 Function 2016. 09. 30 장충성*/
function goAddBaroDreamOrder(formname) {
	if(formname.qty.value == "0") {
		alert("주문수량은 1개 이상이어야 합니다.");
	} else {
		if(typeof(document.proCartOneForm) == "undefined") {
			document.proCartOneForm.barcode.value = formname.barcode.value;
			document.proCartOneForm.ejkGb.value = formname.ejkGb.value;
			document.proCartOneForm.qty.value = formname.qty.value;

			switch( goAddCartCheckDigital(document.proCartOneForm.ejkGb.value))
			{
				case 'L':
					return;
					break;
				case 'D':
					document.proCartOneForm.cartType.value = formname.cartType.value;
					break;
			}

		}
		formname.target = "iframecart";
		//formname.do = domain+"/cart/cartAdd.laf";
		formname.do = orderDomain+"/cart/addCart" + "?spbk_dvsn_code=001";
		formname.submit();
	}
}

function goAddCartPoster(formname) {
	if(formname.qty.value == "0") {
		alert("주문수량은 1개 이상이어야 합니다.");
	} else {
		if(typeof(document.proCartOneForm) == "undefined") {
			document.proCartOneForm.barcode.value = formname.barcode.value;
			document.proCartOneForm.ejkGb.value = formname.ejkGb.value;
			document.proCartOneForm.qty.value = formname.qty.value;

			switch( goAddCartCheckDigital(document.proCartOneForm.ejkGb.value))
			{
				case 'L':
					return;
					break;
				case 'D':
					document.proCartOneForm.cartType.value = formname.cartType.value;
					break;
			}
		}
		formname.posterAdd.value = "true";
		formname.target = "iframecart";
		//formname.do = domain+"/cart/cartAdd.laf";
		formname.do = orderDomain+"/cart/addCart" + "?spbk_dvsn_code=002";
		formname.submit();
	}
}

function goAddCartOne(formname, nowIndex, targetName) {

    /* 2012.04.16 혜은 - 단건만 장바구니에 담길 수 있도록 수정 */
	if(typeof(formname.indexCnt) != "undefined") {
		chkIndex = formname.indexCnt;
		for(i=0;i< formname.indexCnt.length ; i++){
			if(chkIndex[i].type == 'checkbox') {
				if(chkIndex[i].checked) {
					chkIndex[i].checked = false;
				}
			}
		}
	}

	if(typeof(formname.indexCnt) != "undefined") {
		chkIndex = formname.indexCnt;
		if(typeof(chkIndex[nowIndex-1]) == "undefined") {
			if(!chkIndex.checked) {
				chkIndex.checked = true;
			}
		} else {
			if(!chkIndex[nowIndex-1].checked) {
				chkIndex[nowIndex-1].checked = true;
			}
		}
		formname.target = document.proCartOneForm.target;
		if(typeof(targetName) != "undefined") {
			formname.target = targetName;
		}
		if(formname.target=="_parent")
		{
			formname.target = "HiddenActionFrame";
		}

		document.proCartOneForm.barcode.value = (typeof(formname.indexCnt[nowIndex-1]) == "undefined") ? formname.barcode.value : formname.barcode[nowIndex-1].value;
		document.proCartOneForm.ejkGb.value = (typeof(formname.indexCnt[nowIndex-1]) == "undefined") ? formname.ejkGb.value : formname.ejkGb[nowIndex-1].value;
		document.proCartOneForm.qty.value = (typeof(formname.indexCnt[nowIndex-1]) == "undefined") ? formname.qty.value : formname.qty[nowIndex-1].value;

		switch( goAddCartCheckDigital(document.proCartOneForm.ejkGb.value))
		{
			case 'L':
				return;
				break;
			case 'D':
				document.proCartOneForm.cartType.value = 'addMast';
				break;
		}

		//formname.do = domain+"/cart/cartAdd.laf";
		formname.do = orderDomain+"/cart/addCart?spbk_dvsn_code=002";
		formname.submit();

	} else {
		if(typeof(formname.qty[nowIndex-1]) == "undefined") {
			if(formname.qty.value == "0") {
				alert("주문수량은 1개 이상이어야 합니다.");
			} else {
				document.proCartOneForm.barcode.value = formname.barcode.value;
				document.proCartOneForm.ejkGb.value = formname.ejkGb.value;
				document.proCartOneForm.qty.value = formname.qty.value;

				switch( goAddCartCheckDigital(document.proCartOneForm.ejkGb.value))
				{
					case 'L':
						return;
						break;
					case 'D':
						document.proCartOneForm.cartType.value = (typeof(formname.cartType[nowIndex-1]) == "undefined") ? formname.cartType.value : formname.cartType[nowIndex-1].value;
						break;
				}
				//document.proCartOneForm.do="/cart/cartAdd.laf";
				document.proCartOneForm.do=orderDomain+"/cart/addCart?spbk_dvsn_code=002";
				document.proCartOneForm.submit();
			}
		} else {
			if(formname.qty[nowIndex-1].value == "0") {
				alert("주문수량은 1개 이상이어야 합니다.");
			} else {
				document.proCartOneForm.barcode.value = formname.barcode[nowIndex-1].value;
				if(typeof(formname.ejkGb[nowIndex-1]) == "undefined") {
					document.proCartOneForm.ejkGb.value = formname.ejkGb.value;
				} else {
					document.proCartOneForm.ejkGb.value = formname.ejkGb[nowIndex-1].value;
				}
				document.proCartOneForm.qty.value = formname.qty[nowIndex-1].value;

				goAddCartCheckDigital(document.proCartOneForm.ejkGb.value);
				switch( goAddCartCheckDigital(document.proCartOneForm.ejkGb.value))
				{
					case 'L':
						return;
						break;
					case 'D':
						document.proCartOneForm.cartType.value = (typeof(formname.cartType[nowIndex-1]) == "undefined") ? formname.cartType.value : formname.cartType[nowIndex-1].value;
						break;
				}

				//document.proCartOneForm.do= domain+"/cart/cartAdd.laf";
				document.proCartOneForm.do= orderDomain+"/cart/addCart?spbk_dvsn_code=002";
				document.proCartOneForm.submit();
			}
		}
	}
formname.do="";		
}

function goEditCartQty(formname, objname, count, barcode, key, ejkGb, mode) {
	eval("var obj = formname." + objname + ";");
	var indexCnt = parseInt(count)-1;
	var cartGb = formname.cartGb?formname.cartGb.value:"N";
	var siteCd = formname.siteCd?formname.siteCd.value:"";

	if(typeof(obj[indexCnt]) == "undefined") {
		if(obj.value == "0") {
			alert("변경수량은 1개 이상이어야 합니다.");
			try { obj.value = new Number( getvaluebyindex(formname.oqty,0) ); } catch(e){}
		} else {
			if(mode == 'memid') {
				document.location.href = domain+"/cart/cartUpdateQty.laf?qty=" + obj.value + "&barcode=" + barcode + "&memid=" + key + "&ejkGb=" + ejkGb + "&cartGb=" + cartGb + "&siteCd=" + siteCd;
			} else if(mode == 'gId') {
				document.location.href = domain+"/cart/cartUpdateQty.laf?qty=" + obj.value + "&barcode=" + barcode + "&gId=" + key + "&ejkGb=" + ejkGb + "&cartGb=" + cartGb + "&siteCd=" + siteCd;
			}
		}
	} else {
		if(obj[indexCnt].value == "0") {
			alert("변경수량은 1개 이상이어야 합니다.");
			try { obj[indexCnt].value = new Number( getvaluebyindex(formname.oqty,indexCnt) ); } catch(e){}
		} else {
			if(mode == 'memid') {
				document.location.href = domain+"/cart/cartUpdateQty.laf?qty=" + obj[indexCnt].value + "&barcode=" + barcode + "&memid=" + key + "&ejkGb=" + ejkGb + "&cartGb=" + cartGb + "&siteCd=" + siteCd;

			} else if(mode == 'gId') {
				document.location.href = domain+"/cart/cartUpdateQty.laf?qty=" + obj[indexCnt].value + "&barcode=" + barcode + "&gId=" + key + "&ejkGb=" + ejkGb + "&cartGb=" + cartGb + "&siteCd=" + siteCd;
			}
		}
	}
}

function goDeleteCartProduct(formname, objname, count, barcode, key, ejkGb, mode) {
	eval("var obj = formname." + objname + ";");
	var cartGb = formname.cartGb?formname.cartGb.value:"N";
	var siteCd = formname.siteCd?formname.siteCd.value:"";

	var indexCnt = parseInt(count)-1;
	if(typeof(obj[indexCnt]) == "undefined") {
		if(mode == 'memid') {
			document.location.href = domain+"/cart/cartProductDelete.laf?barcode=" + barcode + "&memid=" + key + "&ejkGb=" + ejkGb + "&cartGb=" + cartGb + "&siteCd=" + siteCd;
		} else if(mode == 'gId') {
			document.location.href = domain+"/cart/cartProductDelete.laf?barcode=" + barcode + "&gId=" + key + "&ejkGb=" + ejkGb + "&cartGb=" + cartGb + "&siteCd=" + siteCd;
		}
	} else {
		if(mode == 'memid') {
			document.location.href = domain+"/cart/cartProductDelete.laf?barcode=" + barcode + "&memid=" + key + "&ejkGb=" + ejkGb + "&cartGb=" + cartGb + "&siteCd=" + siteCd;
		} else if(mode == 'gId') {
			document.location.href = domain+"/cart/cartProductDelete.laf?barcode=" + barcode + "&gId=" + key + "&ejkGb=" + ejkGb + "&cartGb=" + cartGb + "&siteCd=" + siteCd;
		}
	}
}

function goDeleteCartProductAll(key, formname, mode) {
	if(confirm("정말로 삭제하시겠습니까?")) {
		var cartGb = formname.cartGb?formname.cartGb.value:"N";
		var siteCd = formname.siteCd?formname.siteCd.value:"";
		chkIndex = formname.indexCnt;
		isCheck = false;
		if( typeof(formname.indexCnt[0]) == 'undefined') {
			if(chkIndex.checked) {
				isCheck = true;
			}
		} else {
			for( var i=0; i<chkIndex.length; i++) {
				if(chkIndex[i].type == 'checkbox') {
					if(chkIndex[i].checked) {
						isCheck = true;
						break;
					}
				}
			}
		}
		if(!isCheck) {
			alert("삭제하실 상품을 하나 이상 선택하셔야 합니다.");
		} else {
			if(mode == 'memid') {
				formname.do = domain+"/cart/cartProductDeleteAll.laf?memid=" + key+ "&cartGb=" + cartGb + "&siteCd=" + siteCd;
			} else if(mode == 'gId') {
				formname.do = domain+"/cart/cartProductDeleteAll.laf?gId=" + key+ "&cartGb=" + cartGb + "&siteCd=" + siteCd;
			}
			formname.submit();
		}
	}
}

function goOrderList() {

}

function goMyRoom() {
	//document.location.href = domain+"/myroom/myroomMain.laf?Kc=GNHHNOmyrom&orderClick=c08";
	document.location.href = orderDomain + "/myroom/main?Kc=GNHHNOmyrom&orderClick=c08";
}

function goSendInquiry() {
	//document.location.href = domain+"/myroom/orderList.laf?Kc=GNHHNOorderlist&orderClick=c07";
	document.location.href = orderDomain + "/myroom/order/orderList?Kc=GNHHNOorderlist&orderClick=c07";
}

function goCSCenter() {
	document.location.href = domain+"/cscenter/csCenterMain.laf?Kc=GNHHNOcscenter&orderClick=c10";
}

function goDegitory() {

}


function goOffLine() {
	document.location.href = domain+"/store/mainTopStore.laf";
}
//===============================================================
// validate checkbox , at least one must be checked... ->mistyi
//===============================================================
function isChecked(el) {
	var cnt=0;
	if (el==null) {
		return false;
	}
	if (el.length==null) {
		if(el.type == 'checkbox') {
			if(el.checked) {
				cnt++;
			}
		}
	} else {
		for( var i=0; i<el.length; i++) {
			if(el[i].type == 'checkbox') {
				if(el[i].checked) {
					cnt++;
				}
			}
		}
	}
	if (cnt>0) return true;
	else return false;
}


// TP 연동관련 로직 수정  20091112 한승용
//===============================================================
// add multi item to booklog mylist ->mistyi
//===============================================================
function goAddMyList(formname,targetName) {
	var frmTarget = formname.target;
	var frmAction = formname.do;

	var ejkgbList = "";
	var barcodeList = "";
	try{
		chkIndex = formname.indexCnt;
		if (!isChecked(chkIndex)) {
			alert("상품을 하나라도 선택하셔야 합니다.");
			return;
		}
		chkIndex = formname.indexCnt;
		for( var i=0; i<chkIndex.length; i++) {
			if(chkIndex[i].type == 'checkbox') {
				if(chkIndex[i].checked) {
					if(ejkgbList == ''){
						ejkgbList = formname.ejkGb[i].value;
					}else{
						ejkgbList = ejkgbList + "," + formname.ejkGb[i].value;
					}
					if(barcodeList == ''){
						barcodeList = formname.barcode[i].value;
					}else{
						barcodeList = barcodeList + "," + formname.barcode[i].value;
					}
				}
			}
		}

		var w = window.open('about:blank','addmylist','width=420,height=350,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no');
		formname.target = "addmylist";
		formname.do = "http://booklog.kyobobook.co.kr/blog/itemToBasketView.do?haabClcd="+ejkgbList+"&brcdNmbr="+barcodeList+"&viewDvcd=1";
		formname.method = "post";
		formname.submit();
	}catch(e){
		alert(e.message);
	}finally{
		formname.target=frmTarget;
		formname.do=frmAction;
	}
}

//===============================================================
// add one item to booklog mylist ->mistyi
//===============================================================
function goAddMyOne(formname, nowIndex) {
	var barcode ="";
	var ejkGb ="";

	if(typeof(formname.indexCnt) != "undefined") {
		var frmTarget = formname.target;
		var frmAction = formname.do;
		try{
			chkIndex = formname.indexCnt;
			if(typeof(chkIndex[nowIndex-1]) == "undefined") {
				if(!chkIndex.checked) {
					chkIndex.checked = true;
				}
				barcode = formname.barcode.value;
				ejkGb = formname.ejkGb.value;
			} else {
				if(!chkIndex[nowIndex-1].checked) {
					chkIndex[nowIndex-1].checked = true;
				}
				barcode = formname.barcode[nowIndex-1].value;
				ejkGb = formname.ejkGb[nowIndex-1].value;
			}
			var w = window.open('about:blank','addmylist','width=420,height=350,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no');
			formname.target = "addmylist";
			formname.do = "http://booklog.kyobobook.co.kr/blog/itemToBasketView.do?haabClcd="+ejkGb+"&brcdNmbr="+barcode+"&viewDvcd=1";
			formname.method = "post";
			formname.submit();
		}catch(e){
			alert(e.message);
		}finally{
			formname.target=frmTarget;
			formname.do=frmAction;
		}
	} else {
		var frm = document.proCartOneForm;
		var frmTarget = frm.target;
		var frmAction = frm.do;
		try{
			if(typeof(formname.qty[nowIndex-1]) == "undefined") {
				frm.barcode.value = formname.barcode.value;
				frm.ejkGb.value = formname.ejkGb.value;
			} else {
				frm.barcode.value = formname.barcode[nowIndex-1].value;
				if(typeof(formname.ejkGb[nowIndex-1]) == "undefined") {
					frm.ejkGb.value = formname.ejkGb.value;
				} else {
					frm.ejkGb.value = formname.ejkGb[nowIndex-1].value;
				}
			}
			var w = window.open('about:blank','addmylist','width=420,height=350,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no');
			frm.target = "addmylist";
			frm.do = "http://booklog.kyobobook.co.kr/blog/itemToBasketView.do?haabClcd="+formname.ejkGb.value+"&brcdNmbr="+formname.barcode.value+"&viewDvcd=1";
			frm.submit();
		}catch(e){
			alert(e.message);
		}finally{
			frm.target=frmTarget;
			frm.do=frmAction;
		}
	}
}

//===============================================================
// add multi item to booklog own list ->mistyi
//===============================================================
function goAddOwnList(formname) {
	var frmTarget = formname.target;
	var frmAction = formname.do;
	var ejkgbList = "";
	var barcodeList = "";
	
	try{
		chkIndex = formname.indexCnt;
		if (!isChecked(chkIndex)) {
			alert("상품을 하나라도 선택하셔야 합니다.");
			return;
		}

		chkIndex = formname.indexCnt;
		for( var i=0; i<chkIndex.length; i++) {
			if(chkIndex[i].type == 'checkbox') {
				if(chkIndex[i].checked) {
					if(ejkgbList == ''){
						ejkgbList = formname.ejkGb[i].value;
					}else{
						ejkgbList = ejkgbList + "," + formname.ejkGb[i].value;
					}
					if(barcodeList == ''){
						barcodeList = formname.barcode[i].value;
					}else{
						barcodeList = barcodeList + "," + formname.barcode[i].value;
					}
				}
			}
		}

		var w = window.open('about:blank','addmylist','width=420,height=350,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no');
		formname.target = "addmylist";
		formname.do = "http://booklog.kyobobook.co.kr/blog/itemToBasketView.do?haabClcd="+ejkgbList+"&brcdNmbr="+barcodeList+"&viewDvcd=3";
		formname.method = "post";
		formname.submit();
	}catch(e){
		alert(e.message);
	}finally{
		formname.target=frmTarget;
		formname.do=frmAction;
	}
}
//===============================================================
// add one item to booklog own list ->mistyi
//===============================================================
function goAddOwnOne(formname, nowIndex) {
	var barcode ="";
	var ejkGb ="";

	if(typeof(formname.indexCnt) != "undefined") {
		var frmTarget = formname.target;
		var frmAction = formname.do;
		try{
			chkIndex = formname.indexCnt;
			if(typeof(chkIndex[nowIndex-1]) == "undefined") {
				if(!chkIndex.checked) {
					chkIndex.checked = true;
				}
				barcode = formname.barcode.value;
				ejkGb = formname.ejkGb.value;
			} else {
				if(!chkIndex[nowIndex-1].checked) {
					chkIndex[nowIndex-1].checked = true;
				}
				barcode = formname.barcode[nowIndex-1].value;
				ejkGb = formname.ejkGb[nowIndex-1].value;
			}
			var w = window.open('about:blank','addmylist','width=420,height=350,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no');
			formname.target = "addmylist";
			formname.do = "http://booklog.kyobobook.co.kr/blog/itemToBasketView.do?haabClcd="+ejkGb+"&brcdNmbr="+barcode+"&viewDvcd=3";
			formname.method = "post";
			formname.submit();
		}catch(e){
			alert(e.message);
		}finally{
			formname.target=frmTarget;
			formname.do=frmAction;
		}
	} else {
		var frm = document.proCartOneForm;
		var frmTarget = frm.target;
		var frmAction = frm.do;
		try{
			if(typeof(formname.qty[nowIndex-1]) == "undefined") {
				frm.barcode.value = formname.barcode.value;
				frm.ejkGb.value = formname.ejkGb.value;
			} else {
				frm.barcode.value = formname.barcode[nowIndex-1].value;
				if(typeof(formname.ejkGb[nowIndex-1]) == "undefined") {
					frm.ejkGb.value = formname.ejkGb.value;
				} else {
					frm.ejkGb.value = formname.ejkGb[nowIndex-1].value;
				}
			}
			var w = window.open('about:blank','addmylist','width=420,height=350,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no');
			frm.target = "addmylist";
			frm.do = "http://booklog.kyobobook.co.kr/blog/itemToBasketView.do?haabClcd="+formname.ejkGb.value+"&brcdNmbr="+formname.barcode.value+"&viewDvcd=3";

			frm.submit();
		}catch(e){
			alert(e.message);
		}finally{
			frm.target=frmTarget;
			frm.do=frmAction;
		}
	}
}
//===============================================================
// add multi item to booklog wish list ->mistyi
//===============================================================
function goAddWishList(formname) {
	var frmHref = document.location.href;
	var frmTarget = formname.target;
	var frmAction = formname.do;

	var ejkgbList = "";
	var barcodeList = "";
	//==========로그인관련 수정==========//
	if(formname.loginYN.value == 'N'){
		if(parent.document == null || parent.document == "undefined"){
			document.location = "/login/login.laf?retURL=" + escape(location.href);
		}else{
			parent.document.location = "/login/login.laf?retURL=" + escape(parent.location.href);
		}
		return;
	}
	//==========로그인관련 수정==========//
	try{
		chkIndex = formname.indexCnt;
		if (!isChecked(chkIndex)) {
			alert("상품을 하나라도 선택하셔야 합니다.");
			return;
		}

		chkIndex = formname.indexCnt;
		for( var i=0; i<chkIndex.length; i++) {
			if(chkIndex[i].type == 'checkbox') {
				if(chkIndex[i].checked) {
					if(ejkgbList == ''){
						ejkgbList = formname.ejkGb[i].value;
					}else{
						ejkgbList = ejkgbList + "," + formname.ejkGb[i].value;
					}
					if(barcodeList == ''){
						barcodeList = formname.barcode[i].value;
					}else{
						barcodeList = barcodeList + "," + formname.barcode[i].value;
					}
				}
			}
		}

		var w = window.open('about:blank','addwishlist','width=380,height=250');
		formname.target = "addwishlist";
		formname.do = "http://booklog.kyobobook.co.kr/blog/itemToBasketView.do?haabClcd="+ejkgbList+"&brcdNmbr="+barcodeList+"&viewDvcd=2";
		//alert(formname.do);
		formname.method = "post";
		formname.submit();
	}catch(e){
		alert(e.message);
	}finally{
		formname.target=frmTarget;
		formname.do=frmAction;
	}
}
//===============================================================
// add one item to booklog wish list ->mistyi
//===============================================================
function goAddWishOne(formname, nowIndex) {
	var barcode ="";
	var ejkGb ="";
	//==========로그인관련 수정==========//
	if(formname.loginYN.value == 'N'){
		if(parent.document == null || parent.document == "undefined"){
			document.location = "/login/login.laf?retURL=" + escape(location.href);
		}else{
			parent.document.location = "/login/login.laf?retURL=" + escape(parent.location.href);
		}
		return;
	}
	//==========로그인관련 수정==========//
	if(typeof(formname.indexCnt) != "undefined") {
		var frmTarget = formname.target;
		var frmAction = formname.do;
		try{
			chkIndex = formname.indexCnt;
			if(typeof(chkIndex[nowIndex-1]) == "undefined") {
				if(!chkIndex.checked) {
					chkIndex.checked = true;
				}
				barcode = formname.barcode.value;
				ejkGb = formname.ejkGb.value;
			} else {
				if(!chkIndex[nowIndex-1].checked) {
					chkIndex[nowIndex-1].checked = true;
				}
				barcode = formname.barcode[nowIndex-1].value;
				ejkGb = formname.ejkGb[nowIndex-1].value;
			}

			var w = window.open('about:blank','addwishlist','width=380,height=250');
			formname.target = "addwishlist";
			formname.do = "http://booklog.kyobobook.co.kr/blog/itemToBasketView.do?haabClcd="+ejkGb+"&brcdNmbr="+barcode+"&viewDvcd=2";
			formname.method = "post";
			formname.submit();
		}catch(e){
			alert(e.message);
		}finally{
			formname.target=frmTarget;
			formname.do=frmAction;
		}
	} else {
		var frm = document.proCartOneForm;
		var frmTarget = frm.target;
		var frmAction = frm.do;
		try{
			if(typeof(formname.qty[nowIndex-1]) == "undefined") {
				frm.barcode.value = formname.barcode.value;
				frm.ejkGb.value = formname.ejkGb.value;
			} else {
				frm.barcode.value = formname.barcode[nowIndex-1].value;
				if(typeof(formname.ejkGb[nowIndex-1]) == "undefined") {
					frm.ejkGb.value = formname.ejkGb.value;
				} else {
					frm.ejkGb.value = formname.ejkGb[nowIndex-1].value;
				}
			}
			var w = window.open('about:blank','addwishlist','width=380,height=250');
			frm.target = "addwishlist";
			frm.do = "http://booklog.kyobobook.co.kr/blog/itemToBasketView.do?haabClcd="+formname.ejkGb.value+"&brcdNmbr="+formname.barcode.value+"&viewDvcd=2";

			frm.submit();
		}catch(e){
			alert(e.message);
		}finally{
			frm.target=frmTarget;
			frm.do=frmAction;
		}
	}
}

// 최근본상품레이어가 아니면 입력하지 않는다. ex) goDetailProduct(ejkGb, linkClass, barcode)만 ~입력
// 최근본상품레이어이라면 true
// ejkGb : 내외서구분, linkClass : 분야코드, barcode : 바코드 , isRecent 최근본상품레이어인지
// 디지털컨텐츠 상세페이지 링크 추가
function goDetailProduct(ejkGb, linkClass, barcode, isRecent) {
        var sUrl = "";

        var clickstr = "";

	var ie = (document.all)? true:false;
if(ie) {
	if(event != null) {
		var curTag = event.srcElement;
		var i=0;

		while(curTag.parentElement && i<40) {
			if((curTag.tagName == "SPAN" || curTag.tagName == "span") && curTag.name == "orderclick") {
				clickstr = "&clickOrder=" + curTag.value;
				break;
			}
			curTag = curTag.parentElement;
			i++;
		}
	}
}else{
	if(typeof(isRecent) == "undefined"){
		isRecent=true;
	}
}

    var linkUrl = "";

	var subBarcode = barcode.substring(0, 2);

	if(subBarcode == '29'){
		linkUrl = domain+"/product/detailViewPackage.laf?mallGb=PKG";
	}else if (subBarcode == '14'){
		linkUrl = "http://pod.kyobobook.co.kr/soldOutPODBookList/soldOutPODBookDetailView.ink?barcode="+barcode+"&ejkGb=KOR";
	} else {
	    if (ejkGb == 'KOR') {
	        linkUrl = domain+"/product/detailViewKor.laf?mallGb=KOR";
	    } else if (ejkGb == 'ENG' || ejkGb == 'BNT') {
	        linkUrl = domain+"/product/detailViewEng.laf?mallGb=ENG";
	    } else if (ejkGb == 'JAP' || ejkGb == 'JNT') {
	        linkUrl = domain+"/product/detailViewEng.laf?mallGb=JAP";
	    } else if (ejkGb == 'MUC' || ejkGb == 'DVD') {
	        linkUrl = "http://music.kyobobook.co.kr/ht/record/detail/";
	    } else if (ejkGb == 'GFT') {
	        linkUrl = "http://gift.kyobobook.co.kr";
	    } else if (ejkGb == 'EBK') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/ebook/ebookDetail.ink?selectedLargeCategory=001";
	    } else if (ejkGb == 'AUD') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/audio/audioDetail.ink?selectedLargeCategory=002";
	    } else if (ejkGb == 'VOD') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/vod/vodDetail.ink?selectedLargeCategory=003";
	    } else if (ejkGb == 'KDS') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/kids/kidsDetail.ink?selectedLargeCategory=004";
	    } else if (ejkGb == 'DUM') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/article/articleDetail.ink?selectedLargeCategory=006";
		} else if (ejkGb == 'DSE') {
			linkUrl = "http://digital.kyobobook.co.kr/kyobobook/setDetail.laf?category=007";
		} else if (ejkGb == 'DMA') {
			linkUrl = "http://digital.kyobobook.co.kr/kyobobook/eMagazineDetail.laf?category=008";
		} 
	}


        if(ejkGb == 'GFT') {
			sUrl = linkUrl + '/p/' + barcode;
        } else if(ejkGb == 'USE') {
			sUrl = 'http://used.kyobobook.co.kr/product/viewBookDetail.ink?cmdtBrcd='+barcode;
	    } else if (ejkGb == 'MUC' || ejkGb == 'DVD') {
	        if(typeof(isRecent) == "undefined") {
				self.location.href = linkUrl+barcode;
	        }
	        else if( isRecent == true ) {
				parent.location.href = linkUrl+barcode;
	        }
		    return;
        } else  if (linkUrl != '') {
			sUrl = linkUrl + "&ejkGb=" + ejkGb + "&linkClass=" + linkClass + "&barcode=" +barcode + clickstr;
	    }

        if(typeof(isRecent) == "undefined") {
			self.location.href = sUrl;
        }
        else if( isRecent == true ) {
			parent.location.href = sUrl;
        }

        return;
}

// 상세페이지 링크(linkClass가 없는경우는 '' 입력)
// ejkGb : 내외서구분, linkClass : 분야코드, barcode : 바코드
// 디지털컨텐츠 상세페이지 링크 추가
function openDetailProduct(ejkGb, linkClass, barcode) {
    var linkUrl = "";

		var subBarcode = barcode.substring(0, 2);

		if(subBarcode == '29'){
			linkUrl = domain+"/product/detailViewPackage.laf?mallGb=PKG";
		}else{
	    if (ejkGb == 'KOR') {
	        linkUrl = domain+"/product/detailViewKor.laf?mallGb=KOR";
	    } else if (ejkGb == 'ENG' || ejkGb == 'BNT') {
	        linkUrl = domain+"/product/detailViewEng.laf?mallGb=ENG";
	    } else if (ejkGb == 'JAP' || ejkGb == 'JNT') {
	        linkUrl = domain+"/product/detailViewEng.laf?mallGb=JAP";
	    } else if (ejkGb == 'MUC' || ejkGb == 'DVD') {
	        linkUrl = "http://music.kyobobook.co.kr/ht/record/detail/";
	    } else if (ejkGb == 'GFT') {
	        linkUrl = "http://gift.kyobobook.co.kr";
	    } else if (ejkGb == 'EBK') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/ebook/ebookDetail.ink?selectedLargeCategory=001";
	    } else if (ejkGb == 'AUD') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/audio/audioDetail.ink?selectedLargeCategory=002";
	    } else if (ejkGb == 'VOD') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/vod/vodDetail.ink?selectedLargeCategory=003";
	    } else if (ejkGb == 'KDS') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/kids/kidsDetail.ink?selectedLargeCategory=004";
	    } else if (ejkGb == 'DUM') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/article/articleDetail.ink?selectedLargeCategory=006";
		} else if (ejkGb == 'DSE') {
			linkUrl = "http://digital.kyobobook.co.kr/kyobobook/setDetail.laf?category=007";
		} else if (ejkGb == 'DMA') {
			linkUrl = "http://digital.kyobobook.co.kr/kyobobook/eMagazineDetail.laf?category=008";
		} 
	  }

	if(ejkGb == 'GFT'){
		var sUrl = linkUrl + '/p/' + barcode;
		window.open(sUrl,'_blank','') ;
    } else if (ejkGb == 'MUC' || ejkGb == 'DVD') {
   	    self.location.href = linkUrl+barcode;
	    return;
  	} else if (linkUrl != '') {
        //var sUrl = linkUrl + "&ejkGb=" + ejkGb + "&linkClass=" + linkClass + "&barcode=" +barcode
        var sUrl = linkUrl + "&ejkGb=" + ejkGb + "&linkClass=" + linkClass + "&barcode=" +barcode;
        window.open(sUrl,'_blank','') ;
    }
    return;
}

// 장바구니 상세보기 새창 링크(linkClass가 없는경우는 '' 입력)
// ejkGb : 내외서구분, linkClass : 분야코드, barcode : 바코드
function openDetailProductCart(ejkGb, linkClass, barcode) {
    var linkUrl = "";
	var sUrl = "";
	var subBarcode = barcode.substring(0, 2);

	if(subBarcode == '29'){
		linkUrl = domain+"/product/detailViewPackage.laf?mallGb=PKG";
	}else{
	    if (ejkGb == 'KOR') {
	        linkUrl = domain+"/product/detailViewKor.laf?mallGb=KOR";
	    } else if (ejkGb == 'ENG' || ejkGb == 'BNT') {
	        linkUrl = domain+"/product/detailViewEng.laf?mallGb=ENG";
	    } else if (ejkGb == 'JAP' || ejkGb == 'JNT') {
	        linkUrl = domain+"/product/detailViewEng.laf?mallGb=JAP";
	    } else if (ejkGb == 'MUC' || ejkGb == 'DVD') {
	        linkUrl = "http://music.kyobobook.co.kr/ht/record/detail/";
	    } else if (ejkGb == 'GFT') {
	        linkUrl = "http://gift.kyobobook.co.kr";
   	 	} else if (ejkGb == 'USE') {
	        linkUrl = "http://used.kyobobook.co.kr/product/viewBookDetail.ink";
	    } else if (ejkGb == 'EBK') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/ebook/ebookDetail.ink?selectedLargeCategory=001";
	    } else if (ejkGb == 'AUD') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/audio/audioDetail.ink?selectedLargeCategory=002";
	    } else if (ejkGb == 'VOD') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/vod/vodDetail.ink?selectedLargeCategory=003";
	    } else if (ejkGb == 'KDS') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/kids/kidsDetail.ink?selectedLargeCategory=004";
	    } else if (ejkGb == 'DUM') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/article/articleDetail.ink?selectedLargeCategory=006";
		} else if (ejkGb == 'DSE') {
			linkUrl = "http://digital.kyobobook.co.kr/kyobobook/setDetail.laf?category=007";
		} else if (ejkGb == 'DMA') {
			linkUrl = "http://digital.kyobobook.co.kr/kyobobook/eMagazineDetail.laf?category=008";
		} 
	}

	if(ejkGb == 'GFT'){
		sUrl = linkUrl + "/p/" + barcode;
    } else if (ejkGb == 'USE') {
		sUrl = linkUrl + "?cmdtBrcd=" + barcode;
    } else if (ejkGb == 'MUC' || ejkGb == 'DVD') {
   	    sUrl = linkUrl + barcode;
  	} else if (linkUrl != '') {
        sUrl = linkUrl + "&ejkGb=" + ejkGb + "&linkClass=" + linkClass + "&barcode=" +barcode;
    }
	window.open(sUrl,'_blank','') ;
    return;
}

// 회원리뷰페이지 링크(linkClass가 없는경우는 '' 입력)
// ejkGb : 내외서구분, linkClass : 분야코드, barcode : 바코드
function goDetailReview(ejkGb, linkClass, barcode) {
	/*UX개편으로 회원리뷰페이지 링크는 도서 상세 '리뷰'탭으로 옮김
    var linkUrl = "";

    if (ejkGb == 'KOR') {
        linkUrl = '/product/detailReviewKor.laf?mallGb=KOR';
    } else if (ejkGb == 'ENG' || ejkGb == 'BNT') {
        linkUrl = '/product/detailReviewEng.laf?mallGb=ENG';
    } else if (ejkGb == 'JAP' || ejkGb == 'JNT') {
        linkUrl = '/product/detailReviewEng.laf?mallGb=JAP';
    } else if (ejkGb == 'MUC') {
        linkUrl = '/product/detailReviewMuc.laf?mallGb=MUC';
    } else if (ejkGb == 'DVD') {
        linkUrl = '/product/detailReviewDvd.laf?mallGb=DVD';
    }

    if (linkUrl != '') {
        findTop().location.href = linkUrl + "&ejkGb=" + ejkGb + "&linkClass=" + linkClass + "&barcode=" +barcode;
    }
    return;
    */
	
	var sUrl = "";
	var linkUrl = "";

	var subBarcode = barcode.substring(0, 2);

	if(subBarcode == '29'){
		linkUrl = domain+"/product/detailViewPackage.laf?mallGb=PKG";
	}else{
	    if (ejkGb == 'KOR') {
	        linkUrl = domain+"/product/detailViewKor.laf?mallGb=KOR";
	    } else if (ejkGb == 'ENG' || ejkGb == 'BNT') {
	        linkUrl = domain+"/product/detailViewEng.laf?mallGb=ENG";
	    } else if (ejkGb == 'JAP' || ejkGb == 'JNT') {
	        linkUrl = domain+"/product/detailViewEng.laf?mallGb=JAP";
	    } else if (ejkGb == 'MUC' || ejkGb == 'DVD') {
	        linkUrl = "http://music.kyobobook.co.kr/ht/record/detail/";
	    } else if (ejkGb == 'GFT') {
	        linkUrl = "http://gift.kyobobook.co.kr/p/";
	    } else if (ejkGb == 'EBK') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/ebook/ebookDetail.ink?selectedLargeCategory=001";
	    } else if (ejkGb == 'AUD') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/audio/audioDetail.ink?selectedLargeCategory=002";
	    } else if (ejkGb == 'VOD') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/vod/vodDetail.ink?selectedLargeCategory=003";
	    } else if (ejkGb == 'KDS') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/kids/kidsDetail.ink?selectedLargeCategory=004";
	    } else if (ejkGb == 'DUM') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/article/articleDetail.ink?selectedLargeCategory=006";
		} else if (ejkGb == 'DSE') {
			linkUrl = "http://digital.kyobobook.co.kr/kyobobook/setDetail.laf?category=007";
		} else if (ejkGb == 'DMA') {
			linkUrl = "http://digital.kyobobook.co.kr/kyobobook/eMagazineDetail.laf?category=008";
		} 
	}
	
	if (ejkGb == 'GFT' || ejkGb == 'MUC' || ejkGb == 'DVD') {
        sUrl = linkUrl + barcode;	    	
        self.location.href = sUrl;
        return;
    }else if (linkUrl != '') {
    	sUrl = linkUrl + "&ejkGb=" + ejkGb + "&linkClass=" + linkClass + "&barcode=" +barcode+"#review";
	}
   	findTop().location.href = sUrl;
}


// 장바구니 간략보기 링크(linkClass가 없는경우는 '' 입력)
// ejkGb : 내외서구분, linkClass : 분야코드, barcode : 바코드
function openPreviewDetail(ejkGb, linkClass, barcode) {
    var linkUrl = "";

    if (ejkGb == 'KOR') {
        linkUrl = '/product/detailPreviewKor.laf?mallGb=KOR';
    } else if (ejkGb == 'ENG' || ejkGb == 'BNT') {
        linkUrl = '/product/detailPreviewEng.laf?mallGb=ENG';
    } else if (ejkGb == 'JAP' || ejkGb == 'JNT') {
        linkUrl = '/product/detailPreviewEng.laf?mallGb=JAP';
    } else if (ejkGb == 'MUC') {
        linkUrl = '/product/detailPreviewMuc.laf?mallGb=MUC';
    } else if (ejkGb == 'DVD') {
        linkUrl = '/product/detailPreviewDvd.laf?mallGb=DVD';
    }

    if (linkUrl != '') {
        var url = linkUrl + "&ejkGb=" + ejkGb + "&linkClass=" + linkClass + "&barcode=" +barcode;
        var option = 'scrollbars=no,toolbar=0,location=0,directories=0,status=1,menubar=0,resizable=0,top=300,left=300,width=450,height=450';
        window.open(url, 'CompactInfo',option);
    }
    return;
}

// 상세페이지 링크(linkClass가 없는경우는 '' 입력)
// ejkGb : 내외서구분, linkClass : 분야코드, barcode : 바코드
function goDetailProductforKiosk(site, ejkGb, barcode) {
    var linkUrl = "";

    if (ejkGb == 'KOR') {
        linkUrl = '/kiosk/detailViewKor.laf';
    //} else if (ejkGb == 'ENG' || ejkGb == 'JAP' || ejkGb == 'BNT' || ejkGb == 'JNT') {
	} else if (ejkGb == 'ENG' || ejkGb == 'JAP') {
        linkUrl = '/kiosk/detailViewEng.laf';
    }

    if (linkUrl != '') {
        self.location.href = linkUrl + "?SITE=" + site + "&ejkGb=" + ejkGb + "&barcode=" +barcode;
    }
    return;
}

// 이미지 크게 보기 링크(linkClass가 없는경우는 '' 입력)
// ejkGb : 내외서구분, linkClass : 분야코드, barcode : 바코드
function openLargeImgView(ejkGb, linkClass, barcode) {
    var linkUrl = "";

    if (ejkGb == 'KOR') {
        linkUrl = '/product/viewLargeImgKor.laf?mallGb=KOR';
    } else if (ejkGb == 'ENG' || ejkGb == 'BNT') {
        linkUrl = '/product/viewLargeImgEng.laf?mallGb=ENG';
    } else if (ejkGb == 'JAP' || ejkGb == 'JNT') {
        linkUrl = '/product/viewLargeImgEng.laf?mallGb=JAP';
    } else if (ejkGb == 'MUC') {
        linkUrl = '/product/viewLargeImgMuc.laf?mallGb=MUC';
    } else if (ejkGb == 'DVD') {
        linkUrl = '/product/viewLargeImgDvd.laf?mallGb=DVD';
    }

    if (linkUrl != '') {
        var url = linkUrl + "&ejkGb=" + ejkGb + "&linkClass=" + linkClass + "&barcode=" +barcode;
        var option = "";
        if(ejkGb == 'DVD') {
            option = 'scrollbars=auto,toolbar=0,location=0,directories=0,status=1,menubar=0,resizable=0,top=100,left=300,width=754,height=782';
        } else {
            option = 'scrollbars=auto,toolbar=0,location=0,directories=0,status=1,menubar=0,resizable=0,top=100,left=300,width=754,height=760';
        }
        window.open(url, 'CompactInfo',option);
    }
    return;
}

// 무인매장검색-분야별검색목록
// site: 지점코드 ejkGb:내외서구분 vPlinkClassID:분야코드
function goCategorySearchBook(site, ejkGb, linkClass){
	linkUrl = "/kiosk/search/SearchCommonMain.jsp";
	self.location.href = linkUrl + "?ejkGb="+ejkGb+"&vPlinkClassID="+linkClass+"&SITE="+site;
}

// 미리보기
// ejkGb : 내외서 구분, barcode : 바코드
function ipqOpen(ejkGb, barcode) {
    if (ejkGb != null && ejkGb != '' && barcode != null && barcode != '') {
        var urls = "/product/ipqView.laf?ejkGb="+ejkGb+"&barcode="+barcode;
        wind6 = window.open(urls,'ibrowser','top=0 , left=0 ,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=950,height=682');
    }
}

function goOrderStep1(formname) {
	chkIndex = formname.indexCnt;
	isCheck = false;
	isZero = false;
	if( typeof(formname.indexCnt[0]) == 'undefined') {
		if(chkIndex.checked) {
			if( getvaluebyindex(formname.qty,0) == '0' ){
				chkIndex.checked = false;
				isZero = true;
			} else {
				isCheck = true;
			}
		}
	} else {
		for( var i=0; i<chkIndex.length; i++) {
			if(chkIndex[i].type == 'checkbox') {
				if(chkIndex[i].checked) {
					if( getvaluebyindex(formname.qty,i) == '0' ){
						chkIndex[i].checked = false;
						isZero = true;
					} else {
						isCheck = true;
					}
				}
			}
		}
	}
	if(isZero) {
		alert("주문권수는 1권 이상이어야 합니다.");
	} else if(!isCheck) {
		alert("주문하실 상품을 하나 이상 선택하셔야 합니다.");
	} else {
		formname.do = sslDomain+"/order/orderStep1.laf";
		formname.submit();
	}
}


//디지털 교보문고 장바구니 4개이하로 제한 (20100406 mjpark)
function goOrderStep2(formname) {
	chkIndex = formname.indexCnt;
	isCheck = false;
	isZero = false;
	isCount = false;
	total_count  = 0;
	var maxChecked = 4;   //선택가능한 체크박스 갯수

	if( typeof(formname.indexCnt[0]) == 'undefined') {
		if(chkIndex.checked) {
			if( getvaluebyindex(formname.qty,0) == '0' ){
				chkIndex.checked = false;
				isZero = true;
			} else {
				isCheck = true;
			}
		}
	} else {
		for( var i=0; i<chkIndex.length; i++) {
			if(chkIndex[i].type == 'checkbox') {
				if(chkIndex[i].checked) {
					if( getvaluebyindex(formname.qty,i) == '0' ){
						chkIndex[i].checked = false;
						isZero = true;
					} else {
						if(chkIndex[i].checked == true){
							total_count +=1;
						} else {
							total_count -=1;
						}
						if(	total_count > maxChecked){
							//alert(total_count);
							isCount = true;
						} else {
							isCheck = true;
						}
					}
				}
			}
		}
	}
	if(isZero) {
		alert("주문권수는 1권 이상이어야 합니다.");
	} else if(!isCheck) {
		alert("주문하실 상품을 하나 이상 선택하셔야 합니다.");
	} else if(isCount) {
		alert("디지털 상품은 4개 이하로 주문가능합니다.");
	} else {
		formname.do = sslDomain+"/order/orderStep1.laf";
		formname.submit();
	}
}

function goOrderStep111(formname) {
	chkIndex = formname.indexCnt;
	isCheck = true;
	if(typeof(formname.indexCnt[0]) == 'undefined') {
		if(chkIndex.checked) {
			if( getvaluebyindex(formname.qty,0) == '0' ){
				alert("주문권수는 1권 이상이어야 합니다.");
				chkIndex.checked = false;
			} else {
				isCheck = true;
			}
		}
	} else {
		for( var i=0; i<chkIndex.length; i++) {
			if(chkIndex[i].type == 'checkbox') {
				if(chkIndex[i].checked) {
					if( getvaluebyindex(formname.qty,i) == '0' ){
						alert("주문권수는 1권 이상이어야 합니다.");
						chkIndex[i].checked = false;
						isCheck = false;
					} else {
						isCheck = isCheck && true;
					}
				}
			}
		}
	}
	if(!isCheck) {
		alert("주문하실 상품을 하나 이상 선택하셔야 합니다.");
	} else {
		formname.do = "/order/orderStep1.laf";
		formname.submit();

	}
}


// 20090206 오더클릭 추가 한승용
function openBookMap(site, ejkGb, barcode, orderClick){
	if(site == '' && barcode == '') {
		alert("매장 정보 및 바코드 정보가 존재하지 않습니다.");
	} else {
		//var urls = "/kiosk/stackView.laf";
		//var urls = "/kiosk/bookInfoPrint.laf";
		//var urls = "/kioskn/BookInfoPrintOnline.laf";
		var urls = "http://mkiosk.kyobobook.co.kr/kiosk/product/bookInfoInk.ink";
		
		var param = '?site=' + site + '&ejkGb=' + ejkGb + '&barcode=' + barcode + '&map=Y';

		if( typeof(orderClick) != 'undefined'){
        param = param + "&orderClick=" + orderClick;
    }

		window.open(urls + param, 'prints', 'width=310, height=770, scrollbars=yes');
	}
}

// 영업점 위치 호출시 신규 클릭값 수정
// 2011.12.14 임성인
function openBookMapKc(site, ejkGb, barcode, orderClick, Kc){
	if(site == '' && barcode == '') {
		alert("매장 정보 및 바코드 정보가 존재하지 않습니다.");
	} else {
		//var urls = "/kiosk/stackView.laf";
		//var urls = "/kiosk/bookInfoPrint.laf";
		//var urls = "/kioskn/BookInfoPrintOnline.laf";
		var urls = "http://mkiosk.kyobobook.co.kr/kiosk/product/bookInfoInk.ink";
		
		var param = '?site=' + site + '&ejkGb=' + ejkGb + '&barcode=' + barcode + '&map=Y';

		if( typeof(orderClick) != 'undefined'){
        param = param + "&orderClick=" + orderClick;
    }

		window.open(urls + param, 'prints', 'width=310, height=770, scrollbars=yes');
	}
}


//================================================================
//북로그관련
//================================================================

//===============================================================
// del multi item from ownlist ->mistyi
//===============================================================
function deleteMulti(formname) {
	chkIndex = formname.indexCnt;
	if (!isChecked(chkIndex)) {
		alert("삭제할 상품을 하나라도 선택하셔야 합니다.");
		return;
	}
	if (!confirm("삭제하시겠습니까?")) {
		return;
	}
	formname.target = "HiddenActionFrame";
	formname.do = "/booklog/deleteWish.laf";
	formname.submit();
}

// 북로그 탑으로 이동
function goBooklogTop(target) {
	if (target==null) {
		findTop().location.href=domain+"/booklog/";
	}else{
		target.location.href=domain+"/booklog/";
	}
}

// 개인북로그로 이동하기
function goBookLog(memid) {
	if (memid=='') {
		findTop().openLogin('/booklog/myBooklog.laf?memid=$memid$');
		return;
	}
	findTop().location.href=domain+"/booklog/myBooklog.laf?memid=" + memid;
}

// 마이리스트메인으로 이동하기
function goBooklogMyListMain(memid) {
	if (memid=='') {
		findTop().openLogin("/booklog/myBooklog.laf?memid=$memid$&branch=mylist");
		return;
	}
	findTop().location.href=domain+"/booklog/myBooklog.laf?memid="+memid+"&branch=mylist";
}

// 책속의 한문장 이동하기
function goonelineMyList(memid) {
	if (memid=='') {
		findTop().openLogin("/booklog/myBooklog.laf?memid=$memid$&branch=oneline");
		return;
	}
	findTop().location.href=domain+"/booklog/myBooklog.laf?memid="+memid+"&branch=oneline";
}


// 20091116 한승용
// 마이리스트로 이동하기
function goBooklogMyList(memid,mid) {
	/*
	if (memid=='') {
		findTop().openLogin("/booklog/myBooklog.laf?memid=$memid$&mid="+mid+"&branch=mylistsub");
		return;
	}
	findTop().location.href=domain+"/booklog/myBooklog.laf?memid="+memid+"&mid="+mid+"&branch=mylistsub";
	*/

	if (memid=='') {
		findTop().openLogin("http://booklog.kyobobook.co.kr/blog/blogController.do?memid=$memid$&menuDvcd=B01");
		return;
	}
	findTop().location.href="http://booklog.kyobobook.co.kr/blog/blogController.do?memid=" + memid + "&menuDvcd=B01";
}


// 마이리스트만들기로 이동하기
function goBooklogMakeMyList(memid) {
	if (memid=='') {
		findTop().openLogin("/booklog/myBooklog.laf?memid=$memid$&branch=mylistmake");
		return;
	}
	findTop().location.href=domain+"/booklog/myBooklog.laf?memid="+memid+"&branch=mylistmake";
}

// 갖고있는상품으로이동하기
function goBooklogOwnList(memid) {
	if (memid=='') {
		findTop().openLogin("http://booklog.kyobobook.co.kr/blog/blogController.do?memid=$memid$&menuDvcd=B03");
		return;
	}
	findTop().location.href="http://booklog.kyobobook.co.kr/blog/blogController.do?memid=" + memid + "&menuDvcd=B03";
}
// 갖고싶은상품으로 이동하기
function goBooklogWishList(memid, wishCatId) {
	if (memid=='') {
		findTop().openLogin("http://booklog.kyobobook.co.kr/blog/blogController.do?memid=$memid$&menuDvcd=B02&orderClick=zbc");
		return;
	}
	var id = "1";
	if (wishCatId !=null) {
		id = wishCatId;
	}
	findTop().location.href="http://booklog.kyobobook.co.kr/blog/blogController.do?memid=" + memid + "&menuDvcd=B02&orderClick=zbc";
}
// 북로그 리뷰쓰기로 이동하기
function goBooklogReviewWriteForm(memid,barcode,ejkGb) {
	if (memid=='') {
		findTop().openLogin("http://booklog.kyobobook.co.kr/blog/blogController.do?memid="+memid+"&ejkGb="+ejkGb+"&barcode="+barcode+"&wrinViewDvcd=1&miniListYN=N&menuDvcd=WRT&mode=F1");
		return;
	}
	findTop().location.href="http://booklog.kyobobook.co.kr/blog/blogController.do?memid="+memid+"&ejkGb="+ejkGb+"&barcode="+barcode+"&wrinViewDvcd=1&miniListYN=N&menuDvcd=WRT&mode=F1";
}
// 북로그 리뷰수정으로 이동하기
function goBooklogReviewUpdateForm(memid,id) {
	if (memid=='') {
		findTop().openLogin("/booklog/myBooklog.laf?memid=$memid$&booklogId="+id+"&branch=update");
		return;
	}
	findTop().location.href=domain+"/booklog/myBooklog.laf?memid=$memid$&booklogId="+id+"&branch=update";
}
// 리뷰상세보기로 이동
function goBooklogReviewDetail(memid,booklogId) {
	findTop().location.href=domain+"/booklog/myBooklog.laf?memid="+memid+"&booklogId="+booklogId;
}
// 마이스토리상세보기로 이동
function goBooklogMystoryDetail(memid,cat,id) {
	findTop().location.href=domain+"/booklog/myBooklog.laf?memid="+memid+"&board_cd="+cat+"&content_cd="+id;
}

//북로그 추천하기
function goRecommendReview(loginid,memid,booklogid) {

	if (loginid == '') {
		//==========로그인관련 수정==========//
		if(parent.document == null || parent.document == "undefined"){
			document.location = "/login/login.laf?retURL=" + escape(location.href);
		}else{
			parent.document.location = "/login/login.laf?retURL=" + escape(parent.location.href);
		}
		return;
		//==========로그인관련 수정==========//
		//openLoginScript("opener.goRecommendReview('$memid$','"+memid+"',"+booklogid+")");
		return;
	}
	if (loginid == memid) {
		alert("자신의 리뷰를 추천할 수 없습니다");
		return;
	}
	if (!confirm("해당리뷰를 추천하시겠습니까?")) {
		return;
	}
	HiddenActionFrame.location.href="/booklog/updateReviewRefer.laf?memid="+memid+"&booklogId="+booklogid;
}
//북로그리뷰 스크랩하기
function goBooklogScrap(loginid,memid,cat,booklogid) {

	alert("서비스 점검으로 북로그 이용이 잠시 제한됩니다.");
	return;

	if (loginid == '') {
		openLoginScript("opener.goBooklogScrap('$memid$','"+memid+"','"+cat+"',"+booklogid+")");
		return;
	}
	if (loginid == memid) {
		alert("자신의 리뷰를 스크랩 할 수 없습니다");
		return;
	}
	if (!confirm("해당리뷰를 스크랩하시겠습니까?")) {
		return;
	}
	//HiddenActionFrame.location.href="/booklog/scrapReviewDone.laf?memid="+memid+"&booklogCatId="+cat+"&booklogId="+booklogid;
	window.open("http://booklog.kyobobook.co.kr/blog/popup/scrapMyBlogger.do?bltnWrinSrnb="+booklogid+"","getBlogPopUp","width=380, height=360, top=200,left=400" );
}
//북로그 스크랩하기
function goBooklogMystoryScrap(loginid,memid,cat,booklogid) {

	alert("서비스 점검으로 북로그 이용이 잠시 제한됩니다.");
	return;

	if (loginid == '') {
		openLoginScript("opener.goBooklogMystoryScrap('$memid$','"+memid+"','"+cat+"',"+booklogid+")");
		return;
	}
	if (loginid == memid) {
		alert("자신의 마이스토리를 스크랩 할 수 없습니다");
		return;
	}
	if (!confirm("해당 마이스토리를 스크랩하시겠습니까?")) {
		return;
	}
	HiddenActionFrame.location.href="/booklog/scrapMyBooklog.laf?memid="+memid+"&content_cd="+cat+"&board_cd="+booklogid;
}

function noImage(imgObj, imgType) {
	var iurl = "";
	try {
        switch(imgType) {
            case "L" :
                iurl = "http://image.kyobobook.co.kr/newimages/apps/b2c/product/Noimage_l.gif";
                break;
            case "M" :
                iurl = "http://image.kyobobook.co.kr/newimages/apps/b2c/product/Noimage_s.gif";
                break;
            case "S" :
                iurl = "http://image.kyobobook.co.kr/newimages/apps/b2c/product/Noimage_s.gif";
                break;
        }
		imgObj.src = iurl;
	} catch (e) {

	} finally {
		imgObj.onerror="";
	}
}

function noImage(imgObj, imgType, ejkGb) {
	var iurl = "";
	try {
        if (ejkGb == 'MUC' || ejkGb == 'DVD') {
            switch(imgType) {
                case "L" :
                    iurl = "http://image.kyobobook.co.kr/newimages/apps/b2c/product/NoimageMUC_l.gif";
                    break;
                case "M" :
                    iurl = "http://image.kyobobook.co.kr/newimages/apps/b2c/product/NoimageMUC_s.gif";
                    break;
                case "S" :
                    iurl = "http://image.kyobobook.co.kr/newimages/apps/b2c/product/NoimageMUC_s.gif";
                    break;
            }
        } else if (ejkGb == 'bcst') {
        	iurl = "http://image.kyobobook.co.kr/new_ink/bookcast/img-error.png";
        } else {
            switch(imgType) {
                case "L" :
                    iurl = "http://image.kyobobook.co.kr/newimages/apps/b2c/product/Noimage_l.gif";
                    break;
                case "M" :
                    iurl = "http://image.kyobobook.co.kr/newimages/apps/b2c/product/Noimage_s.gif";
                    break;
                case "S" :
                    iurl = "http://image.kyobobook.co.kr/newimages/apps/b2c/product/Noimage_s.gif";
                    break;
            }
        }
		imgObj.src = iurl;
	} catch (e) {

	} finally {
		imgObj.onerror="";
	}
}

// 20090206 오더 클릭 추가 한승용
function addCouponProduct(barcode, pubCd, ejkGb) {
	var urlStr;
	if(ejkGb == 'KOR'){
		urlStr = "/coupon/couponAddList.laf?barcode=" + barcode + "&pubCd=" + pubCd + "&ejkGb=" + ejkGb + "&orderClick=JAS";
	}else if(ejkGb == 'ENG' || ejkGb == 'BNT'){
		urlStr = "/coupon/couponAddList.laf?barcode=" + barcode + "&pubCd=" + pubCd + "&ejkGb=" + ejkGb + "&orderClick=JBL";
	}else if(ejkGb == 'JAP' || ejkGb == 'JNT'){
		urlStr = "/coupon/couponAddList.laf?barcode=" + barcode + "&pubCd=" + pubCd + "&ejkGb=" + ejkGb + "&orderClick=JIL";
	}else if(ejkGb == 'MUC'){
		urlStr = "/coupon/couponAddList.laf?barcode=" + barcode + "&pubCd=" + pubCd + "&ejkGb=" + ejkGb + "&orderClick=JJL";
	}else if(ejkGb == 'DVD'){
		urlStr = "/coupon/couponAddList.laf?barcode=" + barcode + "&pubCd=" + pubCd + "&ejkGb=" + ejkGb + "&orderClick=JDX";
	}else{
		urlStr = "/coupon/couponAddList.laf?barcode=" + barcode + "&pubCd=" + pubCd + "&ejkGb=" + ejkGb;
	}

	window.open(urlStr, "CouponPop", "width=400,height=300,left=100,top=100");
}

function addCouponList(formname) {
    if(formname.indexCnt != null) {
        if(typeof(formname.indexCnt[0]) == "undefined") {
            if(!formname.indexCnt.checked) {
                alert("할인받으실 쿠폰을 먼저 선택하셔야 합니다.");
            } else {
                formname.submit();
            }
        } else {
            isCheck = false;
            for( var i=0; i<formname.indexCnt.length; i++) {
                if(formname.indexCnt[i].type == 'checkbox') {
                    if(formname.indexCnt[i].checked) {
                        isCheck = true;
                        break;
                    }
                }
            }
            if(!isCheck) {
                alert("할인받으실 쿠폰을 하나라도 선택하셔야 합니다.");
            } else {
                formname.submit();
            }
        }
    }
}

function addCouponById(couponId, targetName) {
	var urlStr = "/coupon/couponAdd.laf?couponId=" + couponId;
	window.open(urlStr, "CouponPop", "width=400,height=300,left=100,top=100");
}

function addCouponListBarcode(formname) {
	if(typeof(formname.indexCnt[0]) == "undefined") {
		if(!formname.indexCnt.checked) {
			alert("할인받으실 쿠폰을 하나라도 선택하셔야 합니다.");
		} else {
			formname.submit();
		}
	} else {
		isCheck = false;
		for( var i=0; i<formname.indexCnt.length; i++) {
			if(formname.indexCnt[i].type == 'checkbox') {
				if(formname.indexCnt[i].checked) {
					isCheck = true;
					break;
				}
			}
		}
		if(!isCheck) {
			alert("할인받으실 쿠폰을 하나라도 선택하셔야 합니다.");
		} else {
			formname.submit();
		}
	}
}

// common login required message
function loginReqMsg() {
	alert("로그인하세요");
	return;
}

function goAlramMail(barcode, ejkGb) {
	window.open("/mail/noticeMailForm.laf?barcode=" + barcode + "&ejkGb=" + ejkGb , "LoginPop", "width=420,height=283,left=100,top=100");
}
//음반 레이블입고 간략 리스트
function goMusicLabelList(labelGb) {
	location.href=domain+"/lable/musicLableGoodsList.laf?mallGb=MUC&lableGb="+labelGb;
}

//음반 레이블 전체 리스트
function goMucLabelList(linkClass, labelNm) {
	location.href=domain+"/lable/musicLableList.laf?mallGb=MUC&linkClass="+linkClass+"&labelNm="+labelNm;
}

//DVD 레이블 전체 리스트
function goDvdLabelList(mediaCd, labelNm) {
	location.href="/lable/dvdLableList.laf?mallGb=DVD&mediaCd="+mediaCd+"&labelNm="+labelNm;
}
//레이블cd로  검색 페이지
function goSearchLable(vPmusicLabel,vPstrKeyword,vPstrCategory) {
    if (vPstrCategory == "MUC") {
	    location.href="/search/SearchMusicMain.jsp?vPstrCategory=MUC&vPsrThema=1&vPmusicMedia=2&vPlabelCD="+vPmusicLabel+"&vPoutSearch=1"+"&vPsKeywordInfo="+vPstrKeyword;
    } else {
	    location.href="/search/SearchDvdMain.jsp?vPstrCategory=DVD&vPsrThema=1&vPmusicMedia=2&vPlabelCD="+vPmusicLabel+"&vPoutSearch=1"+"&vPsKeywordInfo="+vPstrKeyword;
    }
}

//추천메일 등록폼 팝업
function popRecommendMail (sBarcode, sEjkGb) {
	window.open("/mail/recommandMailForm.laf?windowGb=POP&barcode=" + sBarcode + "&ejkGb=" + sEjkGb, "RecommMailPop", "width=420,height=283,left=100,top=100");
}
// 추천메일 등록폼 팝업 신규 클릭값 수정
// 2011.12.14 임성인
function popRecommendMailKc (sBarcode, sEjkGb, Kc) {
	window.open("/mail/recommandMailForm.laf?windowGb=POP&barcode=" + sBarcode + "&ejkGb=" + sEjkGb + "&Kc=" + Kc, "RecommMailPop", "width=420,height=283,left=100,top=100");
}

//쿠폰 받기
function openCoupon(couponId, targetName) {
	if(typeof(targetName) != "undefined") {
		window.open("/coupon/couponAddById.laf?couponId=" + couponId, "CouponPop", "width=100,height=100,left=100,top=100");
	} else {
		window.open("/coupon/couponAddById.laf?couponId=" + couponId + "&target=" + targetName, "CouponPop", "width=100,height=100,left=100,top=100");
	}
}

// 검색 음반, DVD
function goSearchKind(ejkGb, paramName, paramValue) {

    var link_url = "";
    if(ejkGb == 'ENG' || ejkGb == 'BNT' || ejkGb == 'JAP' || ejkGb == 'JNT') {
        link_url = "location.href='/search/SearchEngbookMain.jsp?vPstrCategory="+ejkGb+"&vPoutSearch=1&"+paramName+"="+paramValue+"&vPsKeywordInfo="+paramValue+"'";
    } else if (ejkGb == 'MUC') {
        link_url = "location.href='/search/SearchMusicMain.jsp?vPstrCategory="+ejkGb+"&vPoutSearch=1&"+paramName+"="+paramValue+"&vPsKeywordInfo="+paramValue+"'";
    } else if (ejkGb == 'DVD') {
        link_url = "location.href='/search/SearchDvdMain.jsp?vPstrCategory="+ejkGb+"&vPoutSearch=1&"+paramName+"="+paramValue+"&vPsKeywordInfo="+paramValue+"'";
    } else {
        link_url = "location.href='/search/SearchCommonMain.jsp?vPstrCategory="+ejkGb+"&vPoutSearch=1&"+paramName+"="+paramValue+"&vPsKeywordInfo="+paramValue+"'";
    }
    eval(link_url);
}

//	논문 미리보기,다운로드
function goArticleViewDown(pdfcd, code, type, vendorGb){
    var url = "";
    if(vendorGb == "02"){
    	url = "http://lnk.kstudy.com/others/downKyobo.asp?a_code="+pdfcd+"&code="+code+"&isDownLoad="+type+"&oID=";  //한국 학술 협회
    }else{
        var tp = "1";     //다운로드
        if(type == "3"){
        	tp = "0";        //미리보기
        	url = "http://www.dbpia.co.kr/b2c/b2c_download.asp?a_code="+pdfcd+"&code="+code+"&isDownLoad="+tp+"&pv=1"; //누리미디어
        }else{
    		url = "http://www.dbpia.co.kr/b2c/b2c_download.asp?a_code="+pdfcd+"&code="+code+"&isDownLoad="+tp; //누리미디어
    	}
    }
	do_open_popup("_popup",url, 0, 0, 400, 300, false, false, false, false);//name, url, left, top, width, height, toolbar, menubar, statusbar, scrollbar, resizable
}

function goQnaPopup(code){
    window.open("http://www.kyobobook.co.kr/cscenter/qnaForm.laf?code="+code, "qnapopup", "status=no, resizeable=no, scrollbars=no, width=545, height=590");
}

function goCommit1(){

	var form1Main = document.form1;
	var commitnumber	= form1Main.commit1.value;

	if( commitnumber != "0612010014"){
		alert("쿠폰번호를 확인해주세요.");
	} else {
		location.href = "http://www.kyobobook.co.kr/index.laf?emailCheck=true&couponId=nJdrTZcW0I4qmbd0p7g!@QA~!" ;

	}

}

function goCommit2(){

	var form1Main = document.form1;
	var commitnumber	= form1Main.commit2.value;

	if( commitnumber != "0612010015"){
		alert("쿠폰번호를 확인해주세요.");
	} else {
		location.href = "http://www.kyobobook.co.kr/index.laf?emailCheck=true&couponId=ldhSINzogamuN!@FSeS15MA~!" ;

	}

}

function contentClick(id,memid)
{
           if(memid == null || memid == '')  // 로그인을 안 했다면 로그인 팝업창
           {
             openLogin();
             return;
           }else {
             contentsclick.location.href = "/practice/ContentDown.laf?id="+id;

           }
}

// digital Navigation 관련 부분 (2008.01.04  이현미)
function openEbookLogin() {
	var retURL = document.location.href;
	openLoginSubmit('&mallGb=DIG&retURL='+escape(retURL));
}

// digital Navigation 관련 부분 (2008.01.04  이현미)
function openGenomad() {
	//document.genomadForm.submit();
	document.location.href = "http://digital.kyobobook.co.kr/kyobobook/main.jsp?mallGb=DIG";
}

// lns : 경품 시작
function goPresent(eventGb, barcode, eventPid, ejkGb, eventUrl, targetName) {
		if(typeof(targetName) != 'undefined') {
			document.proCartOneForm.target = targetName;
		}
		if(eventGb == '1') {
	    if(ejkGb == 'ENG' || ejkGb == 'JAP' || ejkGb == 'BNT' || ejkGb == 'JNT') {
	    	document.proCartOneForm.do = domain+"/event/eventEngViewByPid.laf";
	    } else if (ejkGb == 'MUC') {
	        document.proCartOneForm.do = domain+"/event/eventMucViewByPid.laf";
	    } else if (ejkGb == 'DVD') {
	        document.proCartOneForm.do = domain+"/event/eventDvdViewByPid.laf";
	    } else {
	        document.proCartOneForm.do = domain+"/event/eventViewByPid.laf";
	    }
			document.proCartOneForm.eventId.value = "";
			document.proCartOneForm.eventPid.value = eventPid;
			document.proCartOneForm.barcode.value = barcode;
			document.proCartOneForm.ejkGb.value = ejkGb;
			document.proCartOneForm.submit();
		} else if (eventGb == '2') {
			document.proCartOneForm.do = eventUrl;
			document.proCartOneForm.submit();
		} else {
			goDetailProduct(ejkGb, '', barcode,true);
		}
}
// lns : 경품 끝
// lns : 이철동 _ 경품선택화면으로 이동 시작
function goOrderStep0(formname) {
	chkIndex = formname.indexCnt;
	isCheck = false;
	isZero = false;
	if( typeof(formname.indexCnt[0]) == 'undefined') {
		if(chkIndex.checked) {
			if( getvaluebyindex(formname.qty,0) == '0' ){
				chkIndex.checked = false;
				isZero = true;
			} else {
				isCheck = true;
			}
		}
	} else {
		for( var i=0; i<chkIndex.length; i++) {
			if(chkIndex[i].type == 'checkbox') {
				if(chkIndex[i].checked) {
					if( getvaluebyindex(formname.qty,i) == '0' ){
						chkIndex[i].checked = false;
						isZero = true;
					} else {
						isCheck = true;
					}
				}
			}
		}
	}
	if(isZero) {
		alert("주문권수는 1권 이상이어야 합니다.");
	} else if(!isCheck) {
		alert("주문하실 상품을 하나 이상 선택하셔야 합니다.");
	} else {
		formname.do = sslDomain+"/order/orderStep0.laf";
		formname.submit();
	}
}
// lns : 이철동 _ 경품선택화면으로 이동 끝
// lns : 이철동 _ 경품주문화면으로 이동 시작
function goOrderStep1_present(formname) {
	chkIndex = formname.indexCnt;
	isCheck = false;
	isZero = false;
	formname.do = sslDomain+"/order/orderStep1.laf";
	formname.submit();
}
// lns : 이철동 _ 경품주문화면으로 이동 끝

// lns 김은영 2008-08-08 그룹웨어를 통한 로그인
//2011.05.17 혜은 - 수정
function openLoginJoinGroupware(retURL, memid, empgb, sabun) {
	window.open("/login/loginSSLPop.laf?target=bookmileage&closeYn=Y&retScript=opener.document.location.href='"+retURL+"'&cmemid=" + memid + "&empgb=" + empgb + "&sabun=" + sabun + "&retURL=" + retURL, "LoginPop", "width=737,height=420,left=100,top=100,status=yes");
}


/*
// 리뷰상세보기로 이동시 오더클릭 추가
// 20090209 한승용
function goBooklogReviewPage(memid,booklogId,orderClick) {

	if(typeof(orderClick) != "undefined") {
  	  findTop().location.href="http://booklog.kyobobook.co.kr/blog/blogCompatibility.do?memid=" + memid + "&booklogId=" + booklogId + "&orderClick="+orderClick;
  }else{
  	  findTop().location.href="http://booklog.kyobobook.co.kr/blog/blogCompatibility.do?memid=" + memid + "&booklogId=" + booklogId ;
  }

}
*/
// 마이리스트로 이동시 오더클릭 추가
// 20090206 한승용
function goBooklogMyListPage(memid, mid,orderClick) {
	if (memid=='') {
		findTop().openLogin("/booklog/myBooklog.laf?memid=$memid$&mid="+mid+"&branch=mylistsub");
		return;
	}

	if(typeof(orderClick) != "undefined") {
  	findTop().location.href=domain+"/booklog/myBooklog.laf?memid="+memid+"&mid="+mid+"&branch=mylistsub&orderClick="+orderClick;
  }else{
  	findTop().location.href=domain+"/booklog/myBooklog.laf?memid="+memid+"&mid="+mid+"&branch=mylistsub";
  }
}

// 마이리스트로 이동시 오더클릭 추가 신규 클릭값 수정 및 새창으로 열리도록 수정
// 2011.12.14 임성인
function goBooklogMyListPageKc(memid, mid, orderClick, Kc) {
	if (memid=='') {
		findTop().openLogin("/booklog/myBooklog.laf?memid=$memid$&mid="+mid+"&branch=mylistsub"+"&Kc="+Kc);
		return;
	}

	if(typeof(orderClick) != "undefined") {
  	//findTop().location.href=domain+"/booklog/myBooklog.laf?memid="+memid+"&mid="+mid+"&branch=mylistsub&orderClick="+orderClick+"&Kc="+Kc;
  	window.open(domain+"/booklog/myBooklog.laf?memid="+memid+"&mid="+mid+"&branch=mylistsub&orderClick="+orderClick+"&Kc="+Kc, "myList", "");
  }else{
  	//findTop().location.href=domain+"/booklog/myBooklog.laf?memid="+memid+"&mid="+mid+"&branch=mylistsub&Kc="+Kc;
  	window.open(domain+"/booklog/myBooklog.laf?memid="+memid+"&mid="+mid+"&branch=mylistsub&Kc="+Kc, "myList", "");
  }
}

// 상세 페이지 호출시 오더클릭 추가
// 20090206 한승용
function goDetailProductPage(ejkGb, linkClass, barcode, orderClick) {
    var sUrl = "";
		var linkUrl = "";

		var subBarcode = barcode.substring(0, 2);
if (subBarcode == '14'){
  linkUrl = "http://pod.kyobobook.co.kr/soldOutPODBookList/soldOutPODBookDetailView.ink?orderClick=";
}  else if(subBarcode == '29'){
  linkUrl = domain+"/product/detailViewPackage.laf?mallGb=PKG";
}  else
{
  if (ejkGb == 'KOR') {
    linkUrl = domain+"/product/detailViewKor.laf?mallGb=KOR";
  } else if (ejkGb == 'ENG' || ejkGb == 'BNT') {
    linkUrl = domain+"/product/detailViewEng.laf?mallGb=ENG";
  } else if (ejkGb == 'JAP' || ejkGb == 'JNT') {
    linkUrl = domain+"/product/detailViewEng.laf?mallGb=JAP";
  } else if (ejkGb == 'MUC' || ejkGb == 'DVD') {
    linkUrl = "http://music.kyobobook.co.kr/ht/record/detail/";
  } else if (ejkGb == 'GFT') {
    linkUrl = "http://gift.kyobobook.co.kr";
  } else if (ejkGb == 'EBK') {
    linkUrl = "http://digital.kyobobook.co.kr/digital/ebook/ebookDetail.ink?selectedLargeCategory=001";
  } else if (ejkGb == 'AUD') {
    linkUrl = "http://digital.kyobobook.co.kr/digital/audio/audioDetail.ink?selectedLargeCategory=002";
  } else if (ejkGb == 'VOD') {
    linkUrl = "http://digital.kyobobook.co.kr/digital/vod/vodDetail.ink?selectedLargeCategory=003";
  } else if (ejkGb == 'KDS') {
    linkUrl = "http://digital.kyobobook.co.kr/digital/kids/kidsDetail.ink?selectedLargeCategory=004";
  } else if (ejkGb == 'DUM') {
    linkUrl = "http://digital.kyobobook.co.kr/digital/article/articleDetail.ink?selectedLargeCategory=006";
  } else if (ejkGb == 'GNE') {
    linkUrl = "http://digital.kyobobook.co.kr/digital/rent/genre/genreDetail.ink?selectedLargeCategory=010";
  } else if (ejkGb == 'DSE') {
    linkUrl = "http://digital.kyobobook.co.kr/kyobobook/setDetail.laf?category=007";
  } else if (ejkGb == 'DMA') {
    linkUrl = "http://digital.kyobobook.co.kr/kyobobook/eMagazineDetail.laf?category=008";
  } else if (ejkGb == 'USE') {
    linkUrl = "http://used.kyobobook.co.kr/product/viewBookDetail.ink?cmdtBrcd=";
  } 		
}


    if(ejkGb == 'GFT') {
        sUrl = linkUrl + '/p/' + barcode;
    } else if (ejkGb == 'MUC' || ejkGb == 'DVD') {
   	    self.location.href = linkUrl+barcode;
	    return;        
    } else if (ejkGb == 'USE' ) {
    	var clickstr = "";
        sUrl = linkUrl + barcode + "&ejkGb=" + ejkGb + "&linkClass=" + linkClass + "&barcode=" +barcode + clickstr;	    
    }else if (linkUrl != '') {
    	var clickstr = "";

       sUrl = linkUrl + "&ejkGb=" + ejkGb + "&linkClass=" + linkClass + "&barcode=" +barcode + clickstr;
    }

   	if(typeof(orderClick) != "undefined") {
       sUrl = (sUrl.indexOf("?") == -1)?(sUrl+"?orderClick="+orderClick) : (sUrl+"&orderClick="+orderClick);
    }

    findTop().location.href = sUrl;
    return;
}

// 상세 페이지 호출시 신규 클릭값 수정
// 2011.12.01 이정열
function goDetailProductKc(ejkGb, linkClass, barcode, orderClick, Kc) {
    var sUrl = "";
		var linkUrl = "";

		var subBarcode = barcode.substring(0, 2);

		if(subBarcode == '29'){
			linkUrl = domain+"/product/detailViewPackage.laf?mallGb=PKG";
		}else{
		    if (ejkGb == 'KOR') {
		        linkUrl = domain+"/product/detailViewKor.laf?mallGb=KOR";
		    } else if (ejkGb == 'ENG' || ejkGb == 'BNT') {
		        linkUrl = domain+"/product/detailViewEng.laf?mallGb=ENG";
		    } else if (ejkGb == 'JAP' || ejkGb == 'JNT') {
		        linkUrl = domain+"/product/detailViewEng.laf?mallGb=JAP";
		    } else if (ejkGb == 'MUC' || ejkGb == 'DVD') {
		        linkUrl = "http://music.kyobobook.co.kr/ht/record/detail/";
		    } else if (ejkGb == 'GFT') {
		        linkUrl = "http://gift.kyobobook.co.kr/p/";
		    } else if (ejkGb == 'EBK') {
		        linkUrl = "http://digital.kyobobook.co.kr/digital/ebook/ebookDetail.ink?selectedLargeCategory=001";
		    } else if (ejkGb == 'AUD') {
		        linkUrl = "http://digital.kyobobook.co.kr/digital/audio/audioDetail.ink?selectedLargeCategory=002";
		    } else if (ejkGb == 'VOD') {
		        linkUrl = "http://digital.kyobobook.co.kr/digital/vod/vodDetail.ink?selectedLargeCategory=003";
		    } else if (ejkGb == 'KDS') {
		        linkUrl = "http://digital.kyobobook.co.kr/digital/kids/kidsDetail.ink?selectedLargeCategory=004";
		    } else if (ejkGb == 'DUM') {
		        linkUrl = "http://digital.kyobobook.co.kr/digital/article/articleDetail.ink?selectedLargeCategory=006";
			} else if (ejkGb == 'DSE') {
				linkUrl = "http://digital.kyobobook.co.kr/kyobobook/setDetail.laf?category=007";
			} else if (ejkGb == 'DMA') {
				linkUrl = "http://digital.kyobobook.co.kr/kyobobook/eMagazineDetail.laf?category=008";
			} 
		}
		
      if (ejkGb == 'GFT' || ejkGb == 'MUC' || ejkGb == 'DVD') {
	        sUrl = linkUrl + barcode;	    	

			   	if(typeof(orderClick) != "undefined") {
			       sUrl = sUrl + "?orderClick=" + orderClick;
			    }
			
			   	if(typeof(Kc) != "undefined") {
			       sUrl = sUrl + "&Kc=" + Kc;
			    }
		
	        
	        self.location.href = sUrl;
	    return;
	    }else if (linkUrl != '') {
	    	var clickstr = "";
	       sUrl = linkUrl + "&ejkGb=" + ejkGb + "&linkClass=" + linkClass + "&barcode=" +barcode + clickstr;
		}
		
	   	if(typeof(orderClick) != "undefined") {
	       sUrl = sUrl + "&orderClick=" + orderClick;
	    }
	
	   	if(typeof(Kc) != "undefined") {
	       sUrl = sUrl + "&Kc=" + Kc;
	    }
	
	    self.location.href = sUrl;
	    return;
}


//19세상품 상세페이지 이동
function goDetailProductNotAge(ejkGb, linkClass, barcode, notAge, loginYN, isRecent) {

	var sUrl = "";
	var linkUrl = "";


	var clickstr = "";
	if(window.event != null) {
		var curTag = event.srcElement;
		var i=0;

		while(curTag.parentElement && i<40) {
			if((curTag.tagName == "SPAN" || curTag.tagName == "span") && curTag.name == "orderclick") {
				clickstr = "&clickOrder=" + curTag.value;
				break;
			}
			curTag = curTag.parentElement;
			i++;
		}
	}

	if(ie) {
	
	}else{
			isRecent=true;
	}

	if (ejkGb == 'KOR') {
		linkUrl = domain+"/product/detailViewKor.laf?mallGb=KOR";
	} else if (ejkGb == 'ENG' || ejkGb == 'BNT') {
		linkUrl = domain+"/product/detailViewEng.laf?mallGb=ENG";
	} else if (ejkGb == 'JAP' || ejkGb == 'JNT') {
		linkUrl = domain+"/product/detailViewEng.laf?mallGb=JAP";
    } else if (ejkGb == 'MUC' || ejkGb == 'DVD') {
        linkUrl = "http://music.kyobobook.co.kr/ht/record/detail/";
    } else if (ejkGb == 'GFT') {
        linkUrl = "http://gift.kyobobook.co.kr";
    } else if (ejkGb == 'EBK') {
        linkUrl = "http://digital.kyobobook.co.kr/digital/ebook/ebookDetail.ink?selectedLargeCategory=001";
    } else if (ejkGb == 'AUD') {
        linkUrl = "http://digital.kyobobook.co.kr/digital/audio/audioDetail.ink?selectedLargeCategory=002";
    } else if (ejkGb == 'VOD') {
        linkUrl = "http://digital.kyobobook.co.kr/digital/vod/vodDetail.ink?selectedLargeCategory=003";
    } else if (ejkGb == 'KDS') {
        linkUrl = "http://digital.kyobobook.co.kr/digital/kids/kidsDetail.ink?selectedLargeCategory=004";
    } else if (ejkGb == 'DUM') {
        linkUrl = "http://digital.kyobobook.co.kr/digital/article/articleDetail.ink?selectedLargeCategory=006";
	} else if (ejkGb == 'DSE') {
		linkUrl = "http://digital.kyobobook.co.kr/kyobobook/setDetail.laf?category=007";
	} else if (ejkGb == 'DMA') {
		linkUrl = "http://digital.kyobobook.co.kr/kyobobook/eMagazineDetail.laf?category=008";
	} 


	if(ejkGb == 'GFT') {
		sUrl = linkUrl + '/p/' + barcode;
    } else if (ejkGb == 'MUC' || ejkGb == 'DVD') {
   	    self.location.href = linkUrl+barcode;
	    return;		
	} else  if (linkUrl != '') {
		sUrl = linkUrl + "&ejkGb=" + ejkGb + "&linkClass=" + linkClass + "&barcode=" + barcode + clickstr;

	}

	if(notAge == 19) {
		if(loginYN == "Y") {
			if(typeof(isRecent) == "undefined") {
				self.location.href = sUrl;
			} else if( isRecent == true ) {
				parent.location.href = sUrl;
			}

			return;
		} else {
			alert("본 상품은 만 19세 미만의 청소년이 이용할 수 없습니다.\n\n로그인 후 이용하세요.");
			openLoginNotAgeKor(sUrl,'T');

			return;
		}

	} else {
		if(typeof(isRecent) == "undefined") {
			self.location.href = sUrl;
		} else if( isRecent == true ) {
			parent.location.href = sUrl;
		}

		return;

	}


}


//19세상품 로그인 페이지(2009.04.17 by 이준용)
function openLoginNotAge(retURL) {
	if(typeof(retURL) == "undefined") {
		if(parent.parent.document == null || parent.parent.document == "undefined"){
			if(parent.document == null || parent.document == "undefined"){
				document.location = domain+"/login/loginNotAge.laf?retURL="+escape(location.href);
			}else{
				parent.document.location = domain+"/login/loginNotAge.laf?retURL="+escape(location.href);
			}
		}else{
			parent.parent.document.location = domain+"/login/loginNotAge.laf?retURL="+escape(location.href);
		}
	} else {
		if(parent.parent.document == null || parent.parent.document == "undefined"){
			if(parent.document == null || parent.document == "undefined"){
				document.location = domain+"/login/loginNotAge.laf?retURL=" + escape(retURL);
			}else{
				parent.document.location = domain+"/login/loginNotAge.laf?retURL=" + escape(retURL);
			}
		}else{
			parent.parent.document.location = domain+"/login/loginNotAge.laf?retURL=" + escape(retURL);
		}
	}
}


// 청소년유해물 상품 접근시 로그인 팝업 페이지 - 2013.08.08 이정연
function openLoginNotAgePop() {
	var isWinopen = window.open(domain+"/login/loginSSLPop.laf?popup=Y", "LoginPop", "width=750,height=450,left=100,top=100");
	if(isWinopen == null) {
		alert("차단된 팝업창을 허용해 주십시오.");
	}
}


function openLoginNotAgeKor(retURL,retURL1) {

	if(typeof(retURL) == "undefined")	{
		if(parent.document == null || parent.document == "undefined"){
					document.location = domain+"/login/loginNotAge.laf?retURL="+escape(location.href);
		}else{
					parent.document.location = domain+"/login/loginNotAge.laf?retURL="+escape(location.href);
		}
	} else {
		if(parent.document == null || parent.document == "undefined"){
			document.location = domain+"/login/loginNotAge.laf?retURL=" + escape(retURL);
		}else{
                	retURL=retURL+"&retURL1="+retURL1;
			parent.document.location = domain+"/login/loginNotAge.laf?retURL=" + escape(retURL);
		}
	}
}

//미인증회원 실명인증 (2013.01.28 by 박승준)
function openHomePage(retURL) {
	if(typeof(retURL) == "undefined") {
		if(parent.parent.document == null || parent.parent.document == "undefined"){
			if(parent.document == null || parent.document == "undefined"){
				document.location = domain+"/index.laf";
			}else{
				parent.document.location = domain+"/index.laf";
			}
		}else{
			parent.parent.document.location = domain+"/index.laf";
		}
	} else {
		if(parent.parent.document == null || parent.parent.document == "undefined"){
			if(parent.document == null || parent.document == "undefined"){
				document.location = domain+"/index.laf";
			}else{
				parent.document.location = domain+"/index.laf";
			}
		}else{
			parent.parent.document.location = domain+"/index.laf";
		}
	}
}


function openDetailProductKc(ejkGb, linkClass, barcode, orderClick, Kc) {
    var linkUrl = "";

		var subBarcode = barcode.substring(0, 2);

		if(subBarcode == '29'){
			linkUrl = domain+"/product/detailViewPackage.laf?mallGb=PKG";
		}else{
	    if (ejkGb == 'KOR') {
	        linkUrl = domain+"/product/detailViewKor.laf?mallGb=KOR";
	    } else if (ejkGb == 'ENG' || ejkGb == 'BNT') {
	        linkUrl = domain+"/product/detailViewEng.laf?mallGb=ENG";
	    } else if (ejkGb == 'JAP' || ejkGb == 'JNT') {
	        linkUrl = domain+"/product/detailViewEng.laf?mallGb=JAP";
	    } else if (ejkGb == 'MUC' || ejkGb == 'DVD') {
	        linkUrl = "http://music.kyobobook.co.kr/ht/record/detail/";
	    } else if (ejkGb == 'GFT') {
	        linkUrl = "http://gift.kyobobook.co.kr";
	    } else if (ejkGb == 'EBK') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/ebook/ebookDetail.ink?selectedLargeCategory=001";
	    } else if (ejkGb == 'AUD') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/audio/audioDetail.ink?selectedLargeCategory=002";
	    } else if (ejkGb == 'VOD') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/vod/vodDetail.ink?selectedLargeCategory=003";
	    } else if (ejkGb == 'KDS') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/kids/kidsDetail.ink?selectedLargeCategory=004";
	    } else if (ejkGb == 'DUM') {
	        linkUrl = "http://digital.kyobobook.co.kr/digital/article/articleDetail.ink?selectedLargeCategory=006";
		} else if (ejkGb == 'DSE') {
			linkUrl = "http://digital.kyobobook.co.kr/kyobobook/setDetail.laf?category=007";
		} else if (ejkGb == 'DMA') {
			linkUrl = "http://digital.kyobobook.co.kr/kyobobook/eMagazineDetail.laf?category=008";
		} 
	  }

	if(ejkGb == 'GFT'){
		var sUrl = linkUrl + '/p/' + barcode + "&orderClick=" + orderClick + "&Kc=" + Kc;
		window.open(sUrl,'_blank','') ;
    } else if (ejkGb == 'MUC' || ejkGb == 'DVD') {
   	    self.location.href = linkUrl+barcode + "&orderClick=" + orderClick + "&Kc=" + Kc;;
	    return;
  	} else if (linkUrl != '') {
        //var sUrl = linkUrl + "&ejkGb=" + ejkGb + "&linkClass=" + linkClass + "&barcode=" +barcode + "&orderClick=" + orderClick + "&Kc=" + Kc;
        var sUrl = linkUrl + "&ejkGb=" + ejkGb + "&linkClass=" + linkClass + "&barcode=" +barcode + "&orderClick=" + orderClick + "&Kc=" + Kc;
        window.open(sUrl,'_blank','') ;
    }
    return;
}

//장바구니 꾸러미 대표바코드 선택시 상세 항목 check_2013.04.22 혜은
function goCartPkgCheck(checkobj, objname, forms, nPbarcode) {
	var chk = checkobj.checked;
	for( var i=0; i<forms.indexCnt.length; i++) {	
		if(forms.pBarcode[i].value == nPbarcode){
			forms.indexCnt[i].checked = chk;
		}
	}
}


function clickForce(cd) { 
	var formname = document.FormFav;
	formname.target = "iframefav";
	formname.do = "http://www.kyobobook.co.kr/indexfav1.jsp?orderClick" + cd;
	formname.method = "post";
	formname.submit();
} 

function goSmallCategory(url, selectedLargeCategory, selectedMiddleCategory, selectedSmallCategory){
	top.location.href="/digital/ebook/ebookList.ink?selectedLargeCategory=" + selectedLargeCategory + "&selectedMiddleCategory=" +  selectedMiddleCategory + "&selectedSmallCategory=" + selectedSmallCategory;
}

(function($){
	
	function fixNavLayer(){
		var $layer = $('.navigation .gnbGroup.on .navigation_layer');
		if($layer.is(':visible') && $layer.width() == 704){
			var w = 0;
			$layer.find('.column_1, .column_2, .column_3').each(function(){w+=$(this).outerWidth();});
			$layer.width(w);
		}
	}

	
	$('#gnb_category, .navigation_bar .navigation').hover(function(){
		$('.navigation_bar .navigation').show();
		$('#gnb_category').addClass('gnb_on');
		fixNavLayer();
	},function(){
		$('.navigation_bar .navigation').hide();
		$('#gnb_category').removeClass('gnb_on');
	});
	$('#gnb_category>a').click(function(e){
		e.preventDefault();
		$('.navigation_bar .navigation').toggle();
		$('#gnb_category').toggleClass('gnb_on');
		// if( $('.navigation_bar').is(':visible') ) clickForce('c0c');
		fixNavLayer();
	});
	
	var hover_value1, hover_value2;
	var focus_value1, focus_value2;
	$('.top_content_gnb .list .store, #storeList').hover( function(){hover_value1=1;},function(){hover_value1=0;} );
	$('#gnb_category, .navigation_bar .navigation').hover( function(){hover_value2=1;},function(){hover_value2=0;} );
	$('.top_content_gnb .list .store a').focus( function(){focus_value1=1;} ).blur( function(){focus_value1=0;} );
	$('#gnb_category a').focus( function(){focus_value2=1;} ).blur( function(){focus_value2=0;} );
	$('body').click(function(){
		if( !hover_value1 && !focus_value1 ){ $('#storeList').hide();$('.top_content_gnb .list .store a').removeClass('on'); }
		if( !hover_value2 && !focus_value2 ){ $('.navigation_bar .navigation').hide(); }
	});

	$('.navigation_bar .navigation_layer').append('<div class="layer_shadow"></div>');
	$('.navigation_bar .navigation_title a[href="#"]').click(function(e){e.preventDefault();});
	$('.navigation_bar .gnbGroup').each(function(){
		var timer;
		$(this).hover(function(){
			$(this).addClass('on').find('.navigation_layer').show();
			fixNavLayer();
		},function(){
			$(this).removeClass('on').find('.navigation_layer').hide();
		}).find('a').focus(function(){
			$(this).addClass('focus').closest('.gnbGroup').addClass('on').find('.navigation_layer').show();
			fixNavLayer();
		}).blur(function(){
			$(this).removeClass('focus');
			var $parent = $(this).closest('.gnbGroup');
			if(timer) clearTimeout(timer);
			timer = setTimeout(function(){
				if(!$parent.find('.focus').size()){
					$parent.removeClass('on').find('.navigation_layer').hide();
				}
			},10);
		})
	});

	/* 웹접근성 포커스 이동 */
	$('#storeList .btn_close a').click(function(){ $('.top_content_gnb .list .store a').focus(); });
	
	// 상단 고정 메뉴
	$(document).ready(function(){
		if($('.sticky_header').size() && !$('#detailFixedTab').size() && !$('#eventNav').size()){
			var $header = $('#wrap > #header').size()?$('#header'):$('#header_gnb');
			var timer, sl0;
			$(window).scroll(function(){
				var t1 = $header.offset().top + 140 + 50;
				//var t2 = t1 + ($('body').is('.welcome')?710 - 50 - 15:0);
				var st = $(this).scrollTop();
				var sl = $(this).scrollLeft();
				var isNarrow = $(this).width()<1010 && $header.is('.fixed');
				$header.toggleClass('fixed',st>t1); //.toggleClass('fixed2',st>t2);
				if(sl0==null || sl0!=sl){
					$('.sticky_header, .navigation_bar, .top_header').css('margin-left',isNarrow?-sl:0);
					sl0 = sl;
				}
			});
		}
	});

})(jQuery);
