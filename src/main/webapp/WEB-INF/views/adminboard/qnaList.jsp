<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QNA 게시판</title>

<link rel="stylesheet" href="css/board.css?ver=1" type="text/css">
	
<body onload="init();">
	<iframe name="HiddenActionFrame" frameborder="0" width="0" height="0"
		style="display: none;" title="빈 프레임"></iframe>
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-27007826-1' ]);
		_gaq.push([ '_setDomainName', 'kyobobook.co.kr' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
	<br></br>
	<h2 class="cscenter_h2">
		<img
			src="http://image.kyobobook.co.kr/ink/images/cscenter/h2_cscenter.gif"
			alt="고객센터">
	</h2>
	<br></br>
	<h3 class="bul_green">FAQ BEST10</h3>

	<div id="myroom_contents" style="width:740px;margin: 0 auto;/* text-align: left; */float: left;padding-left: 50px;">

		<dl class="cssearch_dl">
			<dt>
				<a href="javascript:gosubmit(1,'02-01-02')">검색이 되지 않거나 품절/절판인
					도서는 구입할 수 없나요?</a>
			</dt>

			<dd id="submenu1" style="width: 700px; display: none;">
				검색이 되지 않는 도서는 품절/절판일 경우가 대부분이므로 <br> <strong>검색 옵션 중
					[품절/절판상품 포함] 란에 체크하신 후 한번 더 검색해보시기 바랍니다.</strong> <br> <br> 품절이나
				절판으로 표시된 도서는 출판사에서도 더 이상 발행되지 않고 재고가 없는 경우가 대부분이라, <br> 구하기 어려운
				도서입니다. 이 경우 회원님께서 요청하셔도 구입시기를 확실하게 약속드릴 수 없습니다. <br> 이러한 도서의
				구입가능 여부를 확인하시려면 고객센터의 Q&amp;A &lt;도서/상품정보&gt; 상담을 이용하여 주십시오. <br>
				최대한 확인하여 답변드리겠습니다.
				<div class="note">
					<strong>원하는 답변을 얻지 못하셨나요 ? <a
						href="boardList.do">[1:1상담]</a>을
						이용해주세요.
					</strong>
				</div>
			</dd>
		</dl>


		<dl class="cssearch_dl">
			<dt>
				<a href="javascript:gosubmit(2,'02-02-06')">해외주문도서를 주문하면 얼마 후에
					받아볼 수 있나요?</a>
			</dt>

			<dd id="submenu2" style="width: 700px; display: none;">
				<strong>1. 인터넷 주문가능상태</strong> <br> 주문접수된 도서는 대금결제가 완료되는 즉시
				해외거래처(B&amp;T)로 자동발주 처리되어, <br> 도서입고까지 업무일 기준 <u>약 1-2주 정도</u>
				소요됩니다. <br> <br> <strong>2. Special order 상태</strong> <br>
				Special order 는 <u>4~6주 안에 공급가능</u>하며, 현지 출판사 사정에 의해 구입이 어려울 경우 <u>2~3주안에
					공지</u>해 드립니다. <br> <br> ※ 주말 또는 휴일에 주문하신 주문건들은 1-2일 정도 해외발주가
				지연되오니 양지해 주시기 바랍니다. <br> &nbsp;&nbsp;&nbsp;&nbsp;또한 미국 내 현지 사정에
				의해 도서 입고일이 지연될 수 있습니다. <br> &nbsp;&nbsp;&nbsp;&nbsp;ex)크리스마스,
				추수감사절 연휴 등
				<div class="note">
					<strong>원하는 답변을 얻지 못하셨나요 ? <a
						href="boardList.do">[1:1상담]</a>을
						이용해주세요.
					</strong>
				</div>
			</dd>
		</dl>


		<dl class="cssearch_dl">
			<dt>
				<a href="javascript:gosubmit(3,'04-01-09')">주문을 취소할 수 있나요?</a>
			</dt>
			<dd id="submenu3" style="display: none; width: 700px">
				<strong>회원님께서 주문하신 상품은 아래의 단계별로 처리</strong>됩니다. <br> <br>
				주문취소는 주문/배송조회에서 회원 로그인 후 하실 수 있습니다. <br> 비회원 주문의 경우는 주문하실 때
				입력했던 이메일주소와 비밀번호로 로그인하실 수 있습니다. <br> <br> <img
					src="http://image.kyobobook.co.kr/ink/images/myroom/img_orderguide_01.gif"
					width="700px"> <br> <br> <strong>※ 음반/DVD는
					주문처리 상태가 [주문접수중]일 경우에만 주문수정이 가능합니다.</strong> <br> <br> -
				처리1,2,3단계는 주문을 접수하여 대금결제를 진행하는 단계로 주문취소가 가능합니다. <br>
				&nbsp;&nbsp;온라인입금이 완료된 건은 고객님의 환불계좌를 확인하기까지 일시적으로 취소하신 금액을 예치금으로 전환해
				드립니다. <br> (3단계 상품준비중에서는 도서 준비 상태에 따라 주문취소가 불가할 수도 있습니다. 취소를
				원하실 경우 고객센터로 연락하셔서 요청 바랍니다.) <br> <br> <br> -
				신용카드(법인카드포함)결제 완료된 건은 결제 월 경과 시에도 승인취소로 진행됩니다. <br> Ex)
				2013.06.30 도서1권 신용카드결제 → 2013.07.11 주문취소(품절/ 절판/ 반품) → 신용카드(법인카드포함)
				승인취소 <br> (단, 금액에 따라 일부 예치금전환 또는 신용카드(법인카드포함) 재결제 요청 드릴 수
				있습니다.)<br> <br> <br> - 처리4단계는 회원님께서 주문하신 도서가 물류센터에서
				물품 발송 대기중으로 주문취소가 불가합니다.<br> <br> - 처리5단계는 주문도서를 포장하여 택배사로
				물품을 인계되어, <br> 이 단계에서는 주문취소가 불가능하고 차후 도서를 배달 받으신 후 청약철회서를 작성하시어
				아래 주소로 반송해 주십시오. <br> <br> <br> <strong><u>[반송
						주소]</u></strong> <br> 나무두리(주) 서울특별시 강남구 테헤란로14길 6 남도빌딩 3F
				<br> <br> <font color="red">영업점에서 구매하신 고객님께서는 해당
					영업점으로 <br> 영수증(회원일 경우 안내데스크에서 재발급 가능)을 지참하여 방문
				</font>해주시면 됩니다.

				<div class="note">
					<strong>원하는 답변을 얻지 못하셨나요 ? <a
						href="boardList.do">[1:1상담]</a>을
						이용해주세요.
					</strong>
				</div>

			</dd>
		</dl>


		<dl class="cssearch_dl">
			<dt>
				<a href="javascript:gosubmit(4,'07-02-01')">주문하면 얼마 만에 받아볼 수
					있나요?</a>
			</dt>
			<dd id="submenu4" style="display: none; width: 700px">
				고객님께서 주문하신 상품을 실제 받으시는 날은 <u>"예상발송일+배송일"</u>입니다. <br> <br>
				'예상발송일'이란 근무일 기준으로 도서가 준비되는 시간만을 안내하는 것이며, 배송시간은 예상발송일 외 택배를 통해 고객님께
				실제 배달되는 기간을 말합니다. <br> 발송예정일은 상품에 따라 준비기간이 다르며 <u>배송 시간은
					지역에 따라 약간씩 다르나 보통 1~3일정도 소요됩니다.</u>(도서산간지역은 최대 7일 소요) <br> <br>
				* 예상발송일은 영업일 기준으로 산정되며, 일요일과 공휴일 및 기타 휴무일에는 배송되지 않습니다.(우체국 배송은 토요일
				휴무로 배송 불가함) <br> * 주문한 상품의 당사에 재고가 없을 때는 거래처로 다시 주문요청한후 발송이 되므로
				3∼7일내외 정도 더 소요됩니다. <br> * 천재지변 등의 불가항력적 사유로 인한 배송 지연은 그 해당기간
				동안의 배송소요 기간에서 제외됩니다.
				<div class="note">
					<strong>원하는 답변을 얻지 못하셨나요 ? <a
						href="boardList.do">[1:1상담]</a>을
						이용해주세요.
					</strong>
				</div>
			</dd>
		</dl>


		<dl class="cssearch_dl">
			<dt>
				<a href="javascript:gosubmit(5,'07-02-05')">배송예고제(예상발송일)로 주문상품이
					언제쯤 도착할지 알 수 있나요?</a>
			</dt>
			<dd id="submenu5" style="display: none; width: 700px">
				<table width="100%" border="0" cellspacing="2" cellpadding="0"
					bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF" height="100">
					<tbody>
						<tr>
							<td>각 상품별 재고량을 기준으로 상세 상품정보에 예상발송일이 표시됩니다. <br> <br>
								예상발송일이란, 주문상품의 결제(무통장입금의 경우 입금확인)가 확인된 날 기준으로 상품을 준비하여 상품 포장 후
								교보문고 물류센터에서 택배사로 전달하게 되는 예상 일자 입니다 <br> 도착예정일은 예상발송일에 택배사의
								배송일(약 2일)이 더해진 날이며 연휴 및 토.일,공휴일을 제외한 근무일 기준입니다. <br> 다양한
								상품을 함께 주문하실 경우 가장 늦은 도착예정일에 맞춰 함께 배송됩니다.
							</td>
							<td></td>
						</tr>
						<tr valign="top">
							<td valign="top"><br>
								<table width="90%" border="1" cellspacing="2" cellpadding="0"
									bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF">
									<tbody>
										<tr>
											<td width="150" bgcolor="#F6F6F6" height="25" valign="top"><div
													align="center">발송예정</div></td>
											<td bgcolor="#F6F6F6"><div align="center"
													class="bb_bold">도착예정일</div></td>
											<td bgcolor="#F6F6F6"><div align="center"
													class="bb_bold">비고</div></td>
										</tr>
										<tr align="center">
											<td width="140" height="22">1일 이내</td>
											<td>2~3일 이내</td>
											<td rowspan="8" width="80">연휴 및 토.일.공휴일은 제외(근무일기준)</td>
										</tr>
										<tr align="center">
											<td width="140" height="22">2일 이내</td>
											<td>3~4일 이내</td>
										</tr>
										<tr align="center">
											<td width="140" height="22">3일 이내</td>
											<td>4~5일 이내</td>
										</tr>
										<tr align="center">
											<td width="130" height="22">4일 이내</td>
											<td>5~6일 이내</td>
										</tr>
									</tbody>
								</table></td>
						</tr>
						<tr>
							<td></td>
						</tr>
					</tbody>
				</table>
				<br> *서울,수도권의 10시~11시 대 2권 이상 주문은 당일배송 안될 수 있습니다. <br>
				*수도권 외 지역 바로배송 서비스의 경우 경품수령 선택 여부에 따라 도착예정일이 변경됩니다. <br>
				*발송예정일이 5일 이상인 상품의 경우, 출판사/유통사 사정으로 품/절판 되어 구입이 어려울 수 있습니다. 이 경우
				SMS,메일로 알려드립니다. <br> <br> &nbsp;&nbsp;&nbsp;고객님께서 급하게 필요하신
				상품은 별도로 주문하면 받으시는 시간이 절약 됩니다. <br> * 온라인 입금의 경우 입금 확인이 완료된 시점부터
				적용되므로 주문일과 관계없이 예상발송일은 결제완료시점을 <br> &nbsp;&nbsp;&nbsp;기준으로 다시
				계산됩니다. <br> * <strong>5~7일 이상이 소요되는 상품(해외개인주문도서 포함)의
					경우 거래처 사정에 따라 품절 또는 절판</strong> <br> &nbsp;&nbsp;&nbsp;될 수 있습니다. 준비가 되지
				않는 경우에는 메일(또는 전화)로 별도 연락 드리겠습니다. <br> * 외국도서(서양서, 일서)의 경우 한정된
				수량이 수입되고, 실재고 DB가 Off-Line과 연결되어 있으므로 상품의 <br>
				&nbsp;&nbsp;&nbsp;유통상 주문 수량이 재고 수량보다 많은 경우 품절 될 수 있음을 알려드립니다. <br>
				* 외국도서중 국내 출판사를 통해 위탁 판매되고 있는 일부 [수입교재]의 경우 출판사 사정에 의해 발송예정일보다 <br>
				&nbsp;&nbsp;&nbsp; 다소 지연될 수 있음을 사전에 양해 부탁드립니다.
				<div class="note">
					<strong>원하는 답변을 얻지 못하셨나요 ? <a
						href="boardList.do">[1:1상담]</a>을
						이용해주세요.
					</strong>
				</div>
			</dd>
		</dl>


		<dl class="cssearch_dl">
			<dt>
				<a href="javascript:gosubmit(6,'07-02-04')">주문한 상품이 아직 안 왔어요.</a>
			</dt>
			<dd id="submenu6" style="display: none; width: 700px">
				주문하신 도서를 아직 못받아 보셨다면 다음 사항을 확인해 주십시오. <br> <br> <strong>1.
					주문 및 발송확인에서 상품의 처리상태가 포장완료로 되어 있는 경우</strong> <br> 이 상품은 당사에서는 발송처리를 한
				것입니다. <br> 당사에서 발송처리가 되었으나 2~3일 이내에 받아보시지 못한 경우는 다음을 확인하시기
				바랍니다. <br> <br> * 배송조회를 확인하셔서 주문하신 상품이 받아보실 주소의 근처 취급소에
				있다고 조회되면, 택배사 직원이 방문했음에도 불구하고 부재중이셔서 배송받지 못하신 경우가 많습니다. <br>
				&nbsp;&nbsp;이 경우 고객센터의 Q&amp;A &lt;배송/수령일 안내&gt; 상담이나
				전화(국번없이)1544-1900을 이용하시면 신속히 처리해 드립니다. <br> * 당일 배송지역의 경우,
				배송조회가 되지 않습니다. <br> &nbsp;&nbsp;주문하신 당일 신속한 배송처리가 되기 때문에 배송조회가
				무의미하기 때문입니다. <br> <br> <strong>2. 주문 및 발송 확인에서
					상품의 처리상태가 품절/절판이라고 되어 있는 경우</strong> <br> 상품이 품절/절판인 경우에는 당사에 재고가 없으며,
				거래처에서 상품을 더 이상 취급하지 않기 때문에 보내드릴 수 없습니다. <br> 이 경우 메일로 별도 안내해
				드리고 있습니다. <br> 만약 메일을 받아 보지 못하셨다면, 네트워크의 오류나 메일주소의 오기 또는 메일주소가
				없기 때문입니다. <br> [마이룸]의 [회원정보 수정]에서 메일주소의 등록 또는 수정을 하십시오.
				<div class="note">
					<strong>원하는 답변을 얻지 못하셨나요 ? <a
						href="boardList.do">[1:1상담]</a>을
						이용해주세요.
					</strong>
				</div>
			</dd>
		</dl>


		<dl class="cssearch_dl">
			<dt>
				<a href="javascript:gosubmit(7,'08-02-01')">파본/훼손/오발송된 상품을 교환하고
					싶습니다. 어떻게 해야하나요?</a>
			</dt>
			<dd id="submenu7" style="display: none; width: 700px">
				일반 택배로 배송 받으신 상품에 하자가 있는 경우, 인터넷 홈페이지에서 배송 완료일로 부터 30일 이내 <br>
				<b><u>마이룸 &gt; 주문/ 배송내역 &gt; 주문상세페이지 &gt; 교환신청 가능</u></b>합니다. <br>

				<br> ※ 도서 자체 인쇄 파본인 경우 문제점 발견 후 30일이내 <br> ※ 단, 우편/ 편의점택배
				수령의 경우 회수주소지 정보에 일반 주소지 입력해 주시면 일반택배로 맞교환 진행됩니다. <br> <br>
				<img
					src="http://image.kyobobook.co.kr/ink/cscenter/FAQ02_160504.jpg">
				<br> <br> 또는, 고객센터 1:1상담에서 &lt;파본/ 상품불량 신고&gt; 또는
				&lt;반품/교환/환불&gt; 상담에 주문번호와 내용을 기재하여 주십시오. <br> 담당자 확인 후 주문시의
				주소로 상품을 재발송 해 드립니다. <br> 파본도서는 재발송 된 상품을 받으시면서 맞교환해주시면 됩니다. <br>

				<br> 택배직원 편에 반송을 못하셨을 경우, 고객센터의 Q&amp;A &lt;반품/교환/환불&gt;로 문의
				접수해주시면, <br> 택배기사가 반품회수 재방문을 하도록 조치해드립니다. <br> 또는 주문번호와
				반송사유를 간략하게 메모하여 착불 반품을 보내주셔도 됩니다. <br> <br> <u><strong>[반송주소]</strong></u>
				<br> <font color="blue">일반 택배 반품시 :(우편번호:10881) 경기도 파주시
					문발로 249, 교보문고 A동 2층 인터넷반품담당자 앞</font> <br> 위 주소는 인터넷교보문고 구매고객님께서
				이용하시는 반품주소입니다. <br> ※만약의 배송 확인을 위해, 택배 반송 시에는 반송영수증을 최소 2개월간
				보관하여 주시기 바랍니다. <br>

				<div class="note">
					<strong>원하는 답변을 얻지 못하셨나요 ? <a
						href="boardList.do">[1:1상담]</a>을
						이용해주세요.
					</strong>
				</div>
			</dd>
		</dl>


		<dl class="cssearch_dl">
			<dt>
				<a href="javascript:gosubmit(8,'08-02-03')">예치금을 환불받고 싶습니다.</a>
			</dt>
			<dd id="submenu8" style="display: none; width: 700px">
				예치금은 교보문고에서의 상품 구매에 사용하실 수 있으며, 고객계좌로 환불 받으실 수 있습니다. <br> 결제
				수단별 환불 반영 기간은 아래와 같습니다. <br> <br> <img
					src="http://image.kyobobook.co.kr/newimages/apps/b2c/cscenter/faq_table_refund.gif">
				<p>
					<br> <a
						href="https://www.kyobobook.co.kr/myroom/depositToRefundForm.laf"
						target="_target"><img
						src="http://image.kyobobook.co.kr/newimages/apps/b2c/cscenter/faq_btn_refund.gif"></a>
				</p>
				<br> - 주문당일 취소 시 환불 반영 기간은 1~2일(영업일 기준)입니다. <br> - 통합포인트 및
				제휴 포인트 환불 반영 기간은 1~2일 (영업일 기준) 입니다. <br> - 기타 결제수단 (제휴사 포인트 등)인
				경우 해당 결제수단에 대한 승인취소로 처리되며, 부득이한 경우 <br> (부분 배송)으로 차액이 발생한 경우
				환불해 드리며, 경우에 따라서는 재결제를 해주셔야 하는 경우가 발생할 수 있습니다. <br> - 마이룸 &gt;
				나의통장 &gt; 예치금에서 환불신청 및 환불내역을 확인하실 수 있습니다. <br> ※ 체크카드는 입금까지 은행
				정책에 따라 주말 제외 7~10일 소요됩니다. <br> ※ 신용카드 환불은 카드사 정책에 따라 취소 반영 기간의
				차이가 있으니 자세한 사항은 해당 카드사로 <br> 문의해 주시기 바랍니다. <br> <br>
				<b>▣ 2011년 6월 1일 부터 환불관리 규정이 강화되었습니다.</b> <br> ①신용카드 <br>
				※ 불분명한 사유로 인한 잦은 주문취소/반품 등으로 환불신청을 자주 반복하시는 경우 <br> - 내역확인을 위해
				시일이 소요되어 처리가 늦어질 수 있으니 고객님의 너그러운 양해를 부탁드립니다. <br> <br>
				②휴대폰 (소액결제) /집전화결제 <br> ※ 월말에 주문결제 하신 후 익월에 환불신청을 자주 반복하시는 경우 <br>
				※ 불분명한 사유로 인한 잦은 주문취소/반품 등으로 환불신청(월 3회 이상 또는 5만원 이상)을 자주 반복하시는
				경우&gt; <br> -계좌환불 제한, 결제수단 이용 제한, 월별 사용한도 축소 될 수 있으니 신중히 결정해
				주시기 바랍니다. <br> <br> ③ 복합결제 <br> ※ 제휴사 포인트 등 복합결제 금권은
				본 결제수단에 대해 승인취소 처리되며, <br> 당사사유로 인한 주문취소/반품 등이 발생한 경우 내역 확인 후
				환불해 드립니다.
				<div class="note">
					<strong>원하는 답변을 얻지 못하셨나요 ? <a
						href="boardList.do">[1:1상담]</a>을
						이용해주세요.
					</strong>
				</div>
			</dd>
		</dl>


		<dl class="cssearch_dl">
			<dt>
				<a href="javascript:gosubmit(9,'08-02-04')">인터넷 주문도서의 반품이 가능한가요?</a>
			</dt>
			<dd id="submenu9" style="display: none; width: 700px">
				<strong>1.고객님의 변심 또는 주문오류로 인한 반품신청일때,</strong> <br> 타도서로의 교환이
				불가하며,인터넷교보문고에서 주문하신 상품의 경우, <br> 반품 교환이 가능한 종류에 한해 상품을 수령하신
				날로부터 7일이내로 반품신청이가능하며, <br> 반송료는 고객님께서 부담하시게 됩니다. <br> <br>
				단, 반품하실 도서는 사용하지않고, 상품 자체의 비닐래핑이 되어있는 책은 비닐래핑은 벗기지 않고, <br> 음반의
				경우 비닐개봉을 하지 않은 상태로 재생하지 않는 상태일 때가능합니다. <br> <br> <strong>2.
					주문하신 상품의 결함 및 계약내용과 다를 경우, 문제점 발견 후 30일 이내 반품신청이 가능합니다.</strong> <br> <br>
				<strong>3. 반품보내기 전 다음과 같이 반품도서의 준비를 완료해주십시오.</strong> <br> 도서와
				함께 받으신 "거래명세서" 뒷편의 반품신청서 양식을 모두 작성하여 <br> 도서와 함께 택배밀봉포장을 준비하여
				주십시오. 혹시 반품신청서가 없으시면 메모지에 아래의 내용을 기입하여 주십시오. <br> <br>
				(반품신청서 양식) <br> 주문번호 : <br> 고객명 : <br> 환불요청방법 : <br>
				(※ 카드 및 핸드폰결제(당월결제), 실시간계좌이체는 반품 시 승인취소로 환불되며, <br> 온라인무통장송금은
				예치금으로 1차 환원 또는 환불계좌를 적어주시면 환불계좌로 환불됩니다.) <br> 반품보내실 상품과 청약철회서가
				준비되셨으면 인터넷교보문고에서 반품신청을 해주시면 됩니다. <br> <br> <strong>4.
					인터넷교보문고 <u>마이룸 &gt; 주문배송내역 &gt; 주문조회 &gt; 반품/교환신청</u> 홈페이지에서 직접
					접수하실 수 있으며, <br> 당사와 제휴된 한진택배로 회수접수가 됩니다.
				</strong> <br> 회수기사 방문전에 미리 도서와 청약철회서를 함께 동봉하여 택배밀봉포장을 준비하여 주시기 바랍니다. <br>
				주문 시 배송방법 중 편의점택배 및 우체국을 이용하셨던 경우, 해당 배송사는 회수가 불가함으로 <br> 일반
				주소지로 변경하여 접수하셔야 한진택배로의 반품신청이 정상적으로 접수됩니다. <br> ※ 우송료및 쿠폰,마일리지
				금액을 제외한 나머지 도서의 실결제금액이 환불될때 택배반송료 2천원이 <br> 고객부담으로 자동차감되며, 나머지
				금액만 환불됩니다. <br> <u>택배기사님께는 회수반송료를 현금으로 드리거나 혹은 상품 포장 시 동봉하여
					보내주시면 안됩니다.</u> <br> <br> <strong>5. 개인택배 반품 방법
					(선불택배)</strong> <br> 저희 고객센터 또는 홈페이지를 통한 반품을 이용하시기가 어려워 <br> 개별
				택배로 반품하고자 하실때는, 고객님께서 원하시는 택배사를 자유롭게 선택하셔서 <br> 개별택배우송료를 부담하시고
				보내주셔야합니다. 보내실 반품처 주소는 아래와 같습니다. <br> <br> <strong>반품처:
					나무두리(주) 서울특별시 강남구 테헤란로14길 6 남도빌딩 3F </strong> <br> <br>
				위의 방법 중 편하신 방법을 이용하시되, <br> 당사 물류센터로 반품이 되면 반품신청서에 적어주신 환불계좌 또는
				그외 환불방법으로 환불되며, <br> 구체적인 환불요청 내역이 기재되어 있지 않은 경우, <br>
				주문하신 회원님의 예치금으로 1차 자동 환원됩니다. <br> 해당 예치금은 다음 주문시 사용하시거나 <br>
				추후 <u>마이룸 &gt; 나의 통장 &gt; 예치금 &gt; 환불신청</u>탭 클릭하시고 직접 환불접수도 가능합니다. <br>

				<br> <strong>6. 전 지점 영업점 안내데스크</strong> <br> 전 지점에 있는 영업점
				안내데스크에서 교환/환불이 가능합니다. <br> <br> <font color="red">※
					반품주의사항</font>을 함께 기재해 드리오니 미리 숙지하여 주시기 바랍니다. <br> 1) 해외주문도서(서양서, 일서)는
				파본/훼손/오발송 도서를 제외하고는 반품/교환이 되지 않습니다. <br> 해외로 반품이 불가하기 때문입니다. 이
				점 양지하여 주십시오. <br> 2) 음반, 비디오, DVD, CD-ROM 및 S/W의 포장을 개봉했을 때는
				반품/교환이 되지 않습니다. <br> 구입 전에 시스템 사양 등을 꼭 확인하시고 구입해 주십시오. <br>
				3) 기타 반품불가품목 <br> 잡지, 테이프, 대학입시자료, 사진집, 방통대 교재, 교과서, 만화,
				미디어전품목, 악보집, 정부간행물, 지도, <br> 각종 수험서(해당 시험일정 D-1일까지 교환가능),
				적성검사자료, 성경, 사전, 법령집, 지류, 필기구류, 시즌상품, <br> 개봉한 상품 등 <br> 4)
				중고장터나 기프트상품 주문은 판매자(업체)에게 개별반품처리가 되므로 <br> 반품문의시 당사 고객센터로 연락주시어
				문의하시기 바랍니다.
				<div class="note">
					<strong>원하는 답변을 얻지 못하셨나요 ? <a
						href="boardList.do">[1:1상담]</a>을
						이용해주세요.
					</strong>
				</div>
			</dd>
		</dl>


		<dl class="cssearch_dl">
			<dt>
				<a href="javascript:gosubmit(10,'01-01-01')">회원가입/회원탈퇴는 어떻게 하나요?</a>
			</dt>
			<dd id="submenu10" style="display: none; width: 700px">
				<strong>회원가입</strong> <br> 인터넷교보문고 화면 상단의 [회원가입]을 클릭하시면 <br>
				<u>인증 및 약관동의 → 고객정보입력 → 가입완료</u>의 단계를 거치시면 회원가입이 가능합니다. <br>
				교보문고는 고객님의 개인정보보호와 안전쇼핑을 위해 실명확인제를 실시하고 있습니다. <br> <a
					href="memberInfo.do"
					target="_blank"><font color="blue"><u>회원가입 바로가기</u></font></a> <br>

				<br> <strong>회원탈퇴</strong> <br> 교보문고의 회원가입 및 탈퇴는 방문자의 의사를
				존중합니다. <br> 자유롭게 탈퇴하실 수 있으며 <u>마이룸 &gt; 나의정보 &gt; 회원탈퇴 &gt;
					비밀번호를 입력 후 확인</u>을 누르시면 탈퇴처리됩니다. <br> 회원탈퇴시 오프라인회원도 함께 탈퇴처리되며,
				회원탈퇴와 동시에 <br> <strong>회원정보 및 구매실적, 보관함, 마일리지, 통합포인트,
					할인쿠폰 등의 모든 기록이 삭제</strong>되므로 다시 한번 확인바랍니다. <br> <font color="red">통합회원이신
					경우, 핫트랙스도 함께 탈퇴 처리됩니다.</font> <br> <br> 직접 탈퇴가 어려우신 경우 고객센터
				1544-1900번 전화로 문의를 주시거나 1:1상담을 통해 문의를 남겨주신 뒤에 <br> [개인정보(정정
				삭제)요구서 양식]을 작성하신 후 성명, 연락처를 기재해서 FAX(0502-987-5711)로 보내주시면 <br>
				요청하신 내역에 대해 확인 후 처리하고 답변 드리겠습니다. <br> <br> 
				<div class="note">
					<strong>원하는 답변을 얻지 못하셨나요 ? <a
						href="boardList.do" target="_parent">[1:1상담]</a>을
						이용해주세요.
					</strong>
				</div>
			</dd>
		</dl>


	</div>
	<!-- // contents -->
	</div>
	</form>
	<!-- // Container -->


	<script language="JavaScript">
		var old_menu = '';
		function gosubmit(idx, val) {
			if (old_menu != idx) {
				if (old_menu != '')
					document.getElementById("submenu" + old_menu).style.display = 'none';
				document.getElementById("submenu" + idx).style.display = '';
				old_menu = idx;
				init();
			} else

			{
				document.getElementById("submenu" + idx).style.display = 'none';
				old_menu = '';
				init();
			}
		}
	</script>
	<br><br><br><br>
</body>

</head>
</body>
</html>