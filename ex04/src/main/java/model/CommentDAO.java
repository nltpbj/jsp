package model;
import java.util.*;

public interface CommentDAO {
	//댓글 목록 출력
	public ArrayList<CommentVO> list(int bid, int page, int size);
	//댓글 등록
	public void insert(CommentVO vo);
	//댓글 수정
	public void update(CommentVO vo);
	//댓글 삭제
	public void delete(int cid);
	//댓글수
	public int total(int bid);
}
