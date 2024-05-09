package model;
import java.util.*;

public interface ProDAO {  
	//인터페이스는 기본설계도
	//새 교수번호
	public String getCode();
	
	//교수목록
	public ArrayList<ProVO> list(QueryVO vo);
	
	//검색수
	public int total(QueryVO vo);
	
	//교수등록
	public void insert(ProVO vo);
	
	//교수정보
	public ProVO read(String pcode);
	
	//교수정보 수정
	public void update(ProVO vo);
	
	//교수정보 삭제
	public int delete(String pcode);
	
}
