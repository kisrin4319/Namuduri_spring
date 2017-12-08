package com.spring.common;

import lombok.Data;

@Data
public class Paging {

	private int currentPage;   // 현재페이지
	private int totalCount;	 // 전체 게시물 수
	private int totalPage;	 // 전체 페이지 수
	private int blockCount;	 // 한 페이지의  게시물의 수
	private int blockPage;	 // 한 화면에 보여줄 페이지 수
	private int startCount;	 // 한 페이지에서 보여줄 게시글의 시작 번호
	private int endCount;	 // 한 페이지에서 보여줄 게시글의 끝 번호
	private int startPage;	 // 시작 페이지
	private int endPage;	 // 마지막 페이지
	private String viewName;
	private int book_num;
	
	private StringBuffer pagingHtml;

	// 페이징 생성자
	public Paging(int currentPage, int totalCount, int blockCount, int blockPage, String viewName) {

		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.viewName = viewName;

		// 전체 페이지 수
		totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if (totalPage == 0) {
			totalPage = 1;
		}

		// 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}

		// 현재 페이지의 처음과 마지막 글의 번호 가져오기.
		startCount = (currentPage - 1) * blockCount;
		endCount = startCount + blockCount - 1;

		// 시작 페이지와 마지막 페이지 값 구하기.
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;

		// 마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (endPage > totalPage) {
			endPage = totalPage;
		}

		// 이전 block 페이지
		pagingHtml = new StringBuffer();
		if (currentPage > blockPage) {
			pagingHtml.append("<a class='page prv' href=" + viewName + ".do?currentPage=" + (startPage - 1) + ">");
			pagingHtml.append("&lt;");
			pagingHtml.append("</a>");
		}

		//페이지 번호.현재 페이지는 빨간색으로 강조하고 링크를 제거.
		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPage) {
				pagingHtml.append("<strong>");
				pagingHtml.append(i);
				pagingHtml.append("</strong>");
				
				/*pagingHtml.append("<li class='active'><a href='#'>");
				pagingHtml.append(i);
				pagingHtml.append("<span class='sr-only'>");
				pagingHtml.append(i);
				pagingHtml.append("</span></a></li>");*/

			} else {
				pagingHtml.append("<a class='page' href=" + viewName + ".do?currentPage=");
				pagingHtml.append(i);
				pagingHtml.append(">");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
				/*pagingHtml.append("<li class=''><a href="+viewName+".do?currentPage=");
				pagingHtml.append(i);
				pagingHtml.append(">");
				pagingHtml.append(i);
				pagingHtml.append("<span class='sr-only'>");
				pagingHtml.append(i);
				pagingHtml.append("</span></a></li>");*/

			}
		}

		// 다음 block 페이지
		if (totalPage - startPage >= blockPage) {
			pagingHtml.append("<a class='page next' href=" + viewName + ".do?currentPage=" + (endPage + 1) + ">");
			pagingHtml.append("&gt;");
			pagingHtml.append("</a>");
			
			/*pagingHtml.append("<li class=''><a href=" + viewName + ".do?currentPage=" + (endPage + 1)+"' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
		    sb.append("' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");*/

		}
	}

	
	public Paging(int currentPage, int totalCount, int blockCount, int blockPage, String viewName, int book_num) {
		
		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.viewName = viewName;
		this.book_num = book_num;
		

		// 전체 페이지 수
		totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if (totalPage == 0) {
			totalPage = 1;
		}

		// 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}

		// 현재 페이지의 처음과 마지막 글의 번호 가져오기.
		startCount = (currentPage - 1) * blockCount;
		endCount = startCount + blockCount - 1;

		// 시작 페이지와 마지막 페이지 값 구하기.
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;

		// 마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (endPage > totalPage) {
			endPage = totalPage;
		}

		// 이전 block 페이지
		pagingHtml = new StringBuffer();
		if (currentPage > blockPage) {
			pagingHtml.append("<a class='page prv' href=" + viewName + ".do?book_num="+book_num+ "&currentPage=" + (startPage - 1) + "#review>");
			pagingHtml.append("&lt;");
			pagingHtml.append("</a>");
		}

		//페이지 번호.현재 페이지는 빨간색으로 강조하고 링크를 제거.
		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPage) {
				pagingHtml.append("<strong>");
				pagingHtml.append(i);
				pagingHtml.append("</strong>");
			} else {
				pagingHtml.append("<a class='page' href=" + viewName + ".do?book_num="+book_num+"&currentPage=");
				pagingHtml.append(i);
				pagingHtml.append("#review>");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
			}
		}

		// 다음 block 페이지
		if (totalPage - startPage >= blockPage) {
			pagingHtml.append("<a class='page next' href=" + viewName + ".do?book_num="+book_num+"&currentPage=" + (endPage + 1) + "#review>");
			pagingHtml.append("&gt;");
			pagingHtml.append("</a>");
		}
	}
		
	
	
	
	// Search있는 생성자
	public Paging(int currentPage, int totalCount, int blockCount, int blockPage,String viewName, int searchNum, String isSearch){
		
		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		
		totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if(totalPage == 0){
			totalPage = 1;
		}
		
		if(currentPage > totalPage){
			currentPage = totalPage;
		}
		
		startCount = (currentPage -1) * blockCount;
		endCount = startCount + blockCount -1;
		
		startPage = (int)((currentPage -1) / blockPage) * blockPage +1;
		endPage = startPage + blockPage -1;
		
		if(endPage > totalPage){
			endPage = totalPage;
		}
		
		// 이전 block 페이지
		pagingHtml = new StringBuffer();
		if(currentPage > blockPage){
			if(isSearch != "")
				pagingHtml.append("<a class='page prv' href=" + viewName + ".do?currentPage=" + (startPage - 1) + "&searchNum="+searchNum+ "&isSearch="+isSearch+">");
			else                    
				pagingHtml.append("<a class='page prv' href=" + viewName + ".do?currentPage=" + (startPage - 1) + ">");
			pagingHtml.append("&lt;");
			pagingHtml.append("</a>");
			}
		
		//페이지 번호, 현재 페이지는 다르게 표시
		for(int i = startPage; i <= endPage; i++){
			if(i > totalPage){
				break;
			}
			if(i == currentPage){
				pagingHtml.append("<strong>");
				pagingHtml.append(i);
				pagingHtml.append("</strong>");
			}
			else{
				pagingHtml.append("<a class='page' href=" + viewName + ".do?currentPage=" + i);
				if(isSearch != "")
					pagingHtml.append("&isSearch=" + isSearch+"&searchNum="+searchNum);
				pagingHtml.append(">");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
			}
		}
		// 다음 block 페이지
		if(totalPage - startPage >= blockPage){
			pagingHtml.append("<a class='page next' href=" + viewName + ".do?currentPage=" + (endPage + 1));
			if(isSearch != "")
				pagingHtml.append("&isSearch=" + isSearch+"&searchNum="+searchNum);
			pagingHtml.append(">");
			pagingHtml.append("&gt;");
			pagingHtml.append("</a>");
		}
			
	}


}