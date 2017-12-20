package com.spring.admin;

import java.util.List;
import java.util.Map;

import com.spring.book.BooksModel;
import com.spring.member.MemberModel;
import com.spring.order.OrderDetailModel;
import com.spring.order.OrderModel;

public interface AdminDao {
	
	//admin에서만 사용할 기능
	//카테고리 관리
	//베스트, 추천, 신간 제품 관리
	//주문과 배송 탭 나누기. 취소된 주문은 배송 탭에서 보이지 않도록 하기. 
	//회원 등급. 마일리지..

	/* ----------------------------------------------------------------------------------- */
	
	//차단 회원과 활동 회원으로 각각 두개의 리스트 리턴, 후에 두개를 합친 것까지 세개의 리스트 반환.
	//회원 가입시 활동 회원으로 기본값 설정하기. //일단은 리스트를 세개 리턴하도록 구현? //페이징의 범위 조절도 추가.
	public List<MemberModel> memberListAll();
	public List<MemberModel> memberListAct();
	public List<MemberModel> memberListBck();
	
	//검색 기능 구현.. 일단 검색 폼의 데이터는 모델로 넘어올텐데.. 기간 검색과 사용 여부에 대한 조건도 추가하기. 
	//이메일 수신 여부를 통해서 일괄 이메일 작성하는 기능이... 필요할까? //이건 진짜 나중에
	//일단 기본 검색폼은 넣어둘까? 대표적 자료가 아닌 다른 자료로 검색을 할 경우..?
	//탭 내부 검색과 외부 검색의 분리 필요성에 대해
	public List<MemberModel> searchMember(Map<String, Object> map);
	
	//회원 아이디로 회원 정보 조회
	public MemberModel memberView(String member_id);
	
	//회원 수정하기 //여기서 차단 여부도 변경 가능
	public void memberModify(MemberModel memberModel);
	
	//회원 정보 삭제하기
	//mypage memberDelete 사용 public void memberDelete(String member_id);
	
	/*-------------------------------------------------------------------------------------*/
	
	//사용 도서와 비사용도서 각각 두개의 리스트를 리턴한 후 두 개를 합한 것까지 세개의 리스트 반환.
	//도서 등록시 기본값 사용으로 설정. //일단은 리스트를 세개 리턴하도록 구현?
	public List<BooksModel> bookListAll();
	public List<BooksModel> bookListAct();
	public List<BooksModel> bookListBck();
	
	//검색 폼으로 데이터 조회. 등록된 기간별 조회. 출판 기간별 조회. 사용 여부별 조회. 
	public List<BooksModel> searchBook (Map<String, Object> map);
	
	//도서 등록 후 바로 등록된 정보를 조회 가능 하도록 가장 최근에 등록된 게시글을 불러옴.
	public BooksModel selectNewest();
	
	//도서 번호로 도서 정보 조회
	public BooksModel bookDetail(int book_num);
	
	//도서 정보 등록
	public void insertBook(BooksModel booksModel);
	
	//도서 정보 수정. //사용 여부 변경 가능
	public void modifyBook(BooksModel booksModel);
	
	//도서 정보 삭제
	public void deleteBook(int book_num);
	
	//도서 후기 삭제 //수정이나 등록 기능은 필요없겠지..
	public void deleteReview(int review_num);
	
	/*-------------------------------------------------------------------------------------*/
	
	//주문 취소된 주문을 별개로 리스트 출력. //결제 중인 것과 배송 중인 것 구분. //결제 여부는 카드와 무통장 여부에 달라짐.
	//주문 시 기본값 활성화로 설정 //일단 여기는 리스트 네개 필요한가? 
	public List<OrderModel> selectOrderAll();
	public List<OrderModel> selectOrderAct();
	public List<OrderModel> selectOrderBck();
	
	//검색 폼으로 데이터 조회. 주문 기간별 조회. 상태별 조회. //처리가 끝났다면 배송 기간 별로도 조회.. 
	//배송 완료 데이터를 추가할까? 주문은 사용 여부 기본값을 넣지 말고 취소됨과 처리됨으로 구분할까?
	//일단은 배송 날짜는 칼럼에 없지만..
	public List<OrderModel> searchOrder (Map<String, Object> map);
	
	//주문 번호로 주문 정보 조회 가능. //배송 번호에도 링크를 걸어둘까? //행 전체에 링크를 걸 수는 없을까?
	public OrderModel selectOrder(String order_trade_num);
	
	//주문 번호로 주문 상세 정보 조회... 어차피 넘어오는 값은 같은데 같이 한 번에 조회 할 수는 없을까?
	public List<OrderDetailModel> selectOrderDetail(String order_trade_num);
	
	//주문 정보 수정. 결제 상태와 배송 상태. 배송 준비 중에는 배송 정보 변경 가능하도록?
	public void modifyOrder(OrderModel orderModel);
	
	//주문 정보 삭제
	public void deleteOrder(String order_trade_num);
	
	/*-------------------------------------------------------------------------------------*/
	
	public List<ChartModel> chartAllM();
	public List<ChartModel> chartNewM();
	public List<ChartModel> memberGender();
	public List<ChartModel> newMemberGender();
	public List<ChartModel> memberAge();
	public List<ChartModel> newMemberAge();
	public List<ChartModel> memberRegion();
	public List<ChartModel> newMemberRegion();
	
	public List<BooksModel> bookSelling();
	public List<BooksModel> monthBookSelling();
	public List<BooksModel> weekBookSelling();
	
	public List<ChartModel> monthOrderNum();
	public List<ChartModel> monthSales();
	public List<ChartModel> weekOrderNum();
	public List<ChartModel> weekSales();
	public List<ChartModel> monthOrderGender();
	public List<ChartModel> weekOrderGender();
	public List<ChartModel> monthOrderAge();
	public List<ChartModel> weekOrderAge();
	public List<ChartModel> monthOrderRegion();
	public List<ChartModel> weekOrderRegion();
	
}
