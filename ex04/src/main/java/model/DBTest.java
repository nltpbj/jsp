package model;

public class DBTest {

	public static void main(String[] args) {
		//BBSDAOImpl dao=new BBSDAOImpl();
		//dao.list();
		//dao.read(2);
		//System.out.println("갯수......." + dao.total());
		//dao.list(1, 3, "리액트");
		CommentDAOImpl dao=new CommentDAOImpl();
		//dao.list(186, 1, 5);
		//System.out.println("186번의 댓글수.........." +dao.total(186));
		CommentVO vo=new CommentVO();
		vo.setBid(186);
		vo.setWriter("kiin");
		vo.setContents("새로운 댓글입니다.");
		dao.insert(vo);
	}

}
