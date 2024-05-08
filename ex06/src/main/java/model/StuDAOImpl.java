package model;

import java.sql.*;
import java.util.*;

public class StuDAOImpl implements StuDAO {
	Connection con=Database.CON;
	@Override
	public ArrayList<StuVO> list(QueryVO vo) {
		 ArrayList<StuVO> array=new  ArrayList<StuVO>();
		 try {
			String sql="select * from view_stu ";
			sql += " where " + vo.getKey() + " like ?";
			sql += " order by scode desc";
			sql += " limit ?, ?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "%" + vo.getWord() + "%");
			ps.setInt(2, (vo.getPage()-1) * vo.getSize());
			ps.setInt(3, vo.getSize());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) { 
				StuVO stu=new StuVO();
				stu.setScode(rs.getString("scode"));
				stu.setSname(rs.getString("sname"));
				stu.setSdept(rs.getString("dept"));
				stu.setAdvisor(rs.getString("advisor"));
				stu.setPname(rs.getString("pname"));
				stu.setBirthday(rs.getString("birthday"));
				stu.setYear(rs.getInt("year"));
				System.out.println(stu.toString());
				array.add(stu);
			}
		}catch(Exception e) {
			System.out.println("학생목록:" + e.toString());
		}
		return array;
	}

	@Override
	public int total(QueryVO vo) {
		int total=0;
		try {
			String sql="select count(*) from view_stu ";
			sql += " where " + vo.getKey() + " like ?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "%" + vo.getWord() + "%");
			ResultSet rs=ps.executeQuery();
			if(rs.next()) { 
				total=rs.getInt("count(*)");
			}
		}catch(Exception e) {
			System.out.println("검색수:" + e.toString());
		}
		
		return total;
	}

	@Override
	public String getCode() {
		String code="";
		try {
			String sql="select max(scode)+1 code from students";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				code=rs.getString("code");
			}
		}catch(Exception e) {
			System.out.println("새로운코드:" + e.toString());
		}
		return code;
	}

	@Override
	public void insert(StuVO vo) {
		try {
			String sql="insert into students(scode,sname,dept,year,birthday,advisor)";
			sql+=" values(?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, vo.getScode());
			ps.setString(2, vo.getSname());
			ps.setString(3, vo.getSdept());
			ps.setInt(4, vo.getYear());
			ps.setString(5, vo.getBirthday());
			ps.setString(6, vo.getAdvisor());
			ps.execute();
		}catch(Exception e) {
			System.out.println("학생등록: " + e.toString());
		}
		
	}

	@Override
	public StuVO read(String scode) {
		StuVO vo=new StuVO();
		 try {
				String sql="select * from view_stu ";
				sql += " where scode=?";
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1, scode);
				ResultSet rs=ps.executeQuery();
				if(rs.next()) { 
					StuVO stu=new StuVO();
					vo.setScode(rs.getString("scode"));
					vo.setSname(rs.getString("sname"));
					vo.setSdept(rs.getString("dept"));
					vo.setAdvisor(rs.getString("advisor"));
					vo.setPname(rs.getString("pname"));
					vo.setBirthday(rs.getString("birthday"));
					vo.setYear(rs.getInt("year"));
					System.out.println(vo.toString());
				
				}
			}catch(Exception e) {
				System.out.println("학생목록:" + e.toString());
			}
		return vo;
	}
}
