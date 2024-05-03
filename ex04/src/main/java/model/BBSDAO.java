package model;

import java.util.*;

public interface BBSDAO{
	//여러개 목록 출력
	public ArrayList<BBSVO> list();
	//한개 입력
	public void insert(BBSVO vo);
	//한개 읽기
	public BBSVO read(int bid);
	//한개 수정
	public void update(BBSVO vo);
	//한개 삭제
	public void delete(int bid);
	//페이징 목록
	public ArrayList<BBSVO> list(int page, int size);
	//데이터 갯수 구하기
	public int total();
	//검색 데이터 갯수 구하기
	public int total(String query);
	//페이징, 검색
	public ArrayList<BBSVO> list(int page, int size, String query);
	
}

