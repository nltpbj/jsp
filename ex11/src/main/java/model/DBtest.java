package model;

public class DBtest {

	public static void main(String[] args) {
		//UserDAO dao=new UserDAO();
		//UserVO vo=dao.read("blue");
		//System.out.println(vo.toString());
			
		//CartDAO dao=new CartDAO();
		//dao.list("blue");
		GoodsDAO dao=new GoodsDAO();
		QueryVO vo=new QueryVO();
		vo.setKey("gid");
		vo.setWord("");
		vo.setPage(1);
		vo.setSize(3);
		dao.list(vo, "red");
	}

}
