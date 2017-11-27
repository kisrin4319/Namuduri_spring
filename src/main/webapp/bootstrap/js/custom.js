
$(document).ready(function(){
    
    //전체 선택 체크박스 클릭
    $("#checkbox2").click(function () {
      //전체 선택 체크박스가 체크된 상태일 경우
      if($("#checkbox2").prop("checked")){
        //해당 화면에 전체 checkbox들을 체크해준다.
        $("input[type=checkbox]").prop("checked",true);
      } else{
        $("input[type=checkbox]").prop("checked",false);
      }
    });
    
    $(".left-shoping-cart").click(function(e) {
        e.preventDefault();
        location.href =getContextPath()+'/books/booksList.do';
    });
    
    $("#deleteAll").on("click",function(e){ //전체 삭제 하기 버튼
      e.preventDefault();
      location.href = getContextPath()+'/basket/basketDeleteAll.do';
    });
  });

  function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
  }
  
  function fn_bookDetail(basket_book_num) {
      location.href = getContextPath()+'/books/bookDetail.do?book_num='+basket_book_num;
  }
  
  function fn_basketModify(basket_num) { 
    // basket_num과 basket_book_price를 넘겨준다.
    var num = basket_num;
    var count = document.getElementById(basket_num).value;

    
    if (confirm("변경 하시겠습니까?")) {
       location.href=getContextPath()+'/basket/basketModify.do?basket_num='+num+'&basket_book_count='+count;
       
       //document.frm.submit();
    } else {
       alert("취소되었습니다");
    }   
  }
  
  function fn_selectDelete() {
    
    var RowCheck = document.getElementsByName('RowCheck');
    var Count = 0;
   
    for(var i=0; i<RowCheck.length;i++){
      if(RowCheck[i].checked){ Count++; }
      }
    
    if(!Count){
      alert("1개 이상 체크 박스를 선택 해주세요");
      return false;
    }
    else {
      basketform.action = getContextPath()+'/basket/basketCheckDelete.do';
      basketform.submit();
    }
  }
  
  function fn_basketDelete(basket_num) {
    if (confirm("삭제하시겠습니까?")) {
      location.href=getContextPath()+'/basket/basketDelete.do?basket_num='+basket_num;
    } else {
       alert("취소되었습니다");
    }
    
  }
  function singleOrder(basket_book_num, basket_book_count, basket_num) {
    var num = basket_book_num;
    var amount = basket_book_count;
    var basket_num = basket_num;
    
    if (confirm("주문 하시겠습니까?")) {
     location.href = getContextPath()+'/order/singleOrder.do?book_num='+num+'&order_book_count='+amount+'&basket_num='+basket_num;
    } else {
       alert("취소되었습니다");
       return false;
    }
  }
  
  function fn_selectOrder() {
    var RowCheck = document.getElementsByName('RowCheck');
    var Count = 0;
    
    for(var i=0; i<RowCheck.length;i++){
      if(RowCheck[i].checked){ Count++; }
      }
    
    if(!Count){
      alert("1개 이상 체크 박스를 선택 해주세요");
      return false;
      }
    else {
     basketform.action = getContextPath()+'/order/selectOrderForm.do';
         basketform.submit();
      }
  }
  
  function fn_totalOrder() {
    location.href=getContextPath()+'/order/totalOrder.do'
    }
  
  function fn_checkCount() {
    var count = 0;
        var RowCheck = document.getElementsByName('RowCheck');
        for(var i=0; i<RowCheck.length;i++){
          if(RowCheck[i].checked){
            count++;
          }
        }
        CheckCount.value = count;
    }
    function fn_checkSum() {
        var sumValue =0;
        var feeValue =0;
        var RowCheck = document.getElementsByName('RowCheck');
        for(var i =0 ; i<RowCheck.length;i++){
          if(RowCheck[i].checked){
            sumValue += parseInt(RowCheck[i].value);
          }
        }
        if(sumValue <100000 && sumValue!=0){
          feeValue = 5000;
        } 
      fee.value = feeValue;
      SubTotal.value = sumValue;
      sum.value=sumValue+feeValue;
      fn_format(SubTotal);
      fn_format(sum);
    }
    
  function fn_format(obj) {
      var x = obj.value.replace(/[^0-9]/g, '');
      obj.value = x.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
  }
    
  function onlyNumber(event){
     event = event || window.event;
     var keyID = (event.which) ? event.which : event.keyCode;
     if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
     else
        return false;
  }
  function removeChar(event) {
     event = event || window.event;
     var keyID = (event.which) ? event.which : event.keyCode;
     if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
     else
        event.target.value = event.target.value.replace(/[^0-9]/g, ""); 
  }