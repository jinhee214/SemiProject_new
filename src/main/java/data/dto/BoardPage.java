package data.dto;


public class BoardPage {

	public int totalCount;		//총 개수
	public int totalPage;		//총 페이지 수
	public int startPage;		//각 블럭의 시작페이지
	public int endPage;		//각 블럭의 끝페이지
	public int start; 			//각 페이지의 시작번호
	public int perPage=10;		//한 페이지에 보여질 글의 개수
	public int perBlock=5;		//한 페이지에 보여지는 페이지 개수
	public int currentPage;	//현재 페이지
	public int no;				//게시글 번호

	public BoardPage(int totalNum, String currentPage) {
		//총 개수
		totalCount = totalNum;

		//현재 페이지 번호 읽기
		if(currentPage == null){
			this.currentPage = 1;
		}
		else{

			this.currentPage = Integer.parseInt(currentPage);
		}
		
		//총 페이지 개수 구하기
		totalPage = totalCount/perPage + (totalCount%perPage==0?0:1);

		//각 블럭의 시작 페이지
		//예 : 현재 페이지:3 startPage:1, endpage:3
		//예 : 현재 페이지:5 startPage:4, endpage:6

		startPage = (this.currentPage-1)/perBlock*perBlock+1;
		endPage = startPage+perBlock-1;

		if(endPage > totalPage){
			endPage = totalPage;
		}

		//각 페이지에서 불러올 시작 번호
		start = (this.currentPage-1)*perPage;

		//각 글 앞에 붙일 시작번호 구하기
		no = totalCount-(this.currentPage-1)*perPage;
	}

}
