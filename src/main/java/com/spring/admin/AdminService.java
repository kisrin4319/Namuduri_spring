package com.spring.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.spring.book.BooksModel;
import com.spring.member.MemberModel;
import com.spring.order.OrderDetailModel;
import com.spring.order.OrderModel;

@Service
public class AdminService implements AdminDao {
	
	Map<String, Object> map = new HashMap<String, Object>();
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int countTrade() {
		return sqlSessionTemplate.selectOne("admin.countTrade");
	}
	public int countTrans() {
		return sqlSessionTemplate.selectOne("admin.countTrans");
	}
	public int countTrans2() {
		return sqlSessionTemplate.selectOne("admin.countTrans2");
	}
	public int todayMember() {
		return sqlSessionTemplate.selectOne("admin.todayMember");
	}
	public int todayOrder() {
		return sqlSessionTemplate.selectOne("admin.todayOrder");
	}
	public int todaySalesM() {
		return sqlSessionTemplate.selectOne("admin.todaySalesM");
	}
	
	public List<BooksModel> todaySalesBook() {
		return sqlSessionTemplate.selectList("admin.todaySalesBook");
	}
	
	public List<ChartModel> todayMemberGender() {
		return sqlSessionTemplate.selectList("admin.todayMemberGender");
	}
	public List<ChartModel> todayMemberAge() {
		return sqlSessionTemplate.selectList("admin.todayMemberAge");
	}
	public List<ChartModel> todayMemberRegion() {
		return sqlSessionTemplate.selectList("admin.todayMemberRegion");
	}
	public List<ChartModel> todayOrderGender() {
		return sqlSessionTemplate.selectList("admin.todayOrderGender");
	}
	public List<ChartModel> todayOrderAge() {
		return sqlSessionTemplate.selectList("admin.todayOrderAge");
	}
	public List<ChartModel> todayOrderRegion() {
		return sqlSessionTemplate.selectList("admin.todayOrderRegion");
	}
	
	/* ----------------------------------------------------------------------------------- */
	
	@Override //전체 회원 조회
	public List<MemberModel> memberListAll(){
		return sqlSessionTemplate.selectList("admin.memberListAll");
	}
	
	@Override //활성화 회원 조회
	public List<MemberModel> memberListAct(){
		return sqlSessionTemplate.selectList("admin.memberListAct");
	}
	
	@Override //차단 회원 조회
	public List<MemberModel> memberListBck(){
		return sqlSessionTemplate.selectList("admin.memberListBck");
	}
	
	@Override //회원 등급 조회
	public List<MemberModel> memberListRank(){
		return sqlSessionTemplate.selectList("admin.memberListRank");
	}
	
	@Override //회원 검색
	public List<MemberModel> searchMember(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.searchMember", map);
	}
	
	@Override //회원 등급 검색
	public List<MemberModel> searchMemberRank(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.searchMemberRank", map);
	}
	
	@Override //개별 회원 조회
	public MemberModel memberView(String member_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("admin.memberView", member_id);
	}
	
	@Override //주문 내역이 존재하는 회원 조회
	public MemberModel memberViewOrder(String member_id) {
		return sqlSessionTemplate.selectOne("admin.memberViewOrder", member_id);
	}
	
	@Override //회원 주문 내역 조회
	public List<OrderModel> memberOrderList(String member_id) {
		return sqlSessionTemplate.selectList("admin.memberOrderList", member_id);
	}
	
	@Override //회원 취소 주문 내역 조회
	public List<OrderModel> memberOrderListBck(String member_id) {
		return sqlSessionTemplate.selectList("admin.memberOrderListBck", member_id);
	}
	
	@Override //회원 정보 수정
	public void memberModify(MemberModel memberModel) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("admin.memberModify", memberModel);
	}
	
	@Override //회원 정보 삭제
	public void memberDelete(String member_id) {
		sqlSessionTemplate.delete("admin.memberDelete", member_id);
	}
	
	/* ----------------------------------------------------------------------------------- */
	
	@Override //전체 도서 조회
	public List<BooksModel> bookListAll(){
		return sqlSessionTemplate.selectList("admin.bookListAll");
	}
	
	@Override //사용 도서 조회
	public List<BooksModel> bookListAct(){
		return sqlSessionTemplate.selectList("admin.bookListAct");
	}
	
	@Override //비사용 도서 조회
	public List<BooksModel> bookListBck(){
		return sqlSessionTemplate.selectList("admin.bookListBck");
	}
	
	@Override //재고 조회
	public List<BooksModel> stockList() {
		return sqlSessionTemplate.selectList("admin.stockList");
	}
	
	@Override //품절 상품 조회
	public List<BooksModel> soldOutList() {
		return sqlSessionTemplate.selectList("admin.soldOutList");
	}
	
	@Override //도서 검색
	public List<BooksModel> searchBook(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.searchBook", map);
	}
	
	@Override //신규 도서 조회
	public BooksModel selectNewest() {
		return sqlSessionTemplate.selectOne("admin.selectNewest");
	}
	
	@Override //개별 도서 조회
	public BooksModel bookDetail(int book_num) {
		return sqlSessionTemplate.selectOne("admin.selectOne", book_num);
	}

	@Override //도서 정보 등록
	public void insertBook(BooksModel book) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("book.writeBook", book);
	}

	@Override //도서 정보 수정
	public void modifyBook(BooksModel book) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("book.modifyBook", book);
	}

	@Override //도서 정보 삭제
	public void deleteBook(int book_num) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("book.deleteBook", book_num);
		sqlSessionTemplate.delete("book.deleteReviewAll", book_num);
	}
	
	@Override //도서 리뷰 삭제
	public void deleteReview(int review_num) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("book.deleteReview", review_num);
	}

	/* ----------------------------------------------------------------------------------- */

	@Override //전체 주문 조회
	public List<OrderModel> orderListAll(){
		return sqlSessionTemplate.selectList("admin.orderListAll");
	}
	
	@Override //결제 미완료 주문
	public List<OrderModel> orderListTrade(){
		return sqlSessionTemplate.selectList("admin.orderListTrade");
	}
	
	@Override //배송 미완료 주문
	public List<OrderModel> orderListTrans(){
		return sqlSessionTemplate.selectList("admin.orderListTrans");
	}
	
	@Override //취소된 주문
	public List<OrderModel> orderListBck(){
		return sqlSessionTemplate.selectList("admin.orderListBck");
	}
	
	@Override //주문 검색
	public List<OrderModel> searchOrder (Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.searchOrder", map);
	}

	@Override //개별 주문 조회
	public OrderModel selectOrder(String order_trade_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("order.selectOrder", order_trade_num);
	}
	
	@Override //개별 주문 조회 시 구매 상품 목록 검색
	public List<OrderDetailModel> selectOrderDetail(String order_trade_num){
		return sqlSessionTemplate.selectList("order.selectOrderDetail", order_trade_num);
		
	}
	
	@Override //주문 정보 수정
	public void modifyOrder(OrderModel book) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("order.modifyOrder", book);
	}

	@Override //주문 정보 삭제
	public void deleteOrder(String order_trade_num) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("admin.deleteOrder", order_trade_num);
	}

	/* ----------------------------------------------------------------------------------- */
	
	@Override
	public List<ChartModel> chartAllM() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.chartAllM");
	}

	@Override
	public List<ChartModel> chartNewM() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.chartNewM");
	}

	@Override
	public List<ChartModel> memberGender() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.memberGender");
	}

	@Override
	public List<ChartModel> newMemberGender() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.newMemberGender");
	}

	@Override
	public List<ChartModel> memberAge() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.memberAge");
	}

	@Override
	public List<ChartModel> newMemberAge() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.newMemberAge");
	}

	@Override
	public List<ChartModel> memberRegion() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.memberRegion");
	}

	@Override
	public List<ChartModel> newMemberRegion() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.newMemberRegion");
	}
	
	/* ----------------------------------------------------------------------------------- */

	@Override
	public List<BooksModel> bookSelling() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.bookSelling");
	}

	@Override
	public List<BooksModel> monthBookSelling() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.monthBookSelling");
	}

	@Override
	public List<BooksModel> weekBookSelling() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.weekBookSelling");
	}

	/* ----------------------------------------------------------------------------------- */
	
	@Override
	public List<ChartModel> monthOrderNum() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.monthOrderNum");
	}

	@Override
	public List<ChartModel> monthSales() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.monthSales");
	}

	@Override
	public List<ChartModel> weekOrderNum() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.weekOrderNum");
	}

	@Override
	public List<ChartModel> weekSales() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.weekSales");
	}

	@Override
	public List<ChartModel> monthOrderGender() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.monthOrderGender");
	}

	@Override
	public List<ChartModel> weekOrderGender() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.weekOrderGender");
	}

	@Override
	public List<ChartModel> monthOrderAge() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.monthOrderAge");
	}

	@Override
	public List<ChartModel> weekOrderAge() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.weekOrderAge");
	}

	@Override
	public List<ChartModel> monthOrderRegion() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.monthOrderRegion");
	}

	@Override
	public List<ChartModel> weekOrderRegion() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.weekOrderRegion");
	}
	
	
	
}
