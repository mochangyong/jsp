package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import sun.text.normalizer.Trie.DataManipulate;
import model.GuestBean;

public class GuestDAO {

	String driver="oracle.jdbc.OracleDriver";

	String url="jsbc:oracle:thin:@127.0.0.1:1522:xe";

	String uid="oraclejava";
	String pwd="oraclejava";

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	//방명록 저장
	public int insertG(GuestBean g){
		int re = -1;
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url,uid,pwd);
			sql ="insert into guestbook (guest_no,guest_name,"
					+ " guest_title,guest_cont,guest_pwd,guest_regdate) "
					+ " values(guest_no_seq.nextval,?,?,?,?,sysdate)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, g.getGuest_name());
			pstmt.setString(2, g.getGuest_title());
			pstmt.setString(3, g.getGuest_cont());
			pstmt.setString(4, g.getGuest_pwd());

			re=pstmt.executeUpdate();

			pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}

		return re;

	}
	//방명록 리스트

	/*public List<GuestBean> getGuestList(){
		List<GuestBean> glist = new ArrayList<GuestBean>();
		try{
		Class.forName(driver);
		con=DriverManager.getConnection(url,uid,pwd);
		sql= "select * from guestbook order by guest_no desc"; 
		pstmt=con.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while(rs.next()){
			GuestBean g = new GuestBean();

			g.setGuest_no(rs.getInt("guest_no"));
			g.setGuest_name(rs.getString("guest_name"));
			g.setGuest_title(rs.getString("guest_title"));
			g.setGuest_cont(rs.getString("guest_cont"));
			g.setGuest_pwd(rs.getString("guest_pwd"));
			g.setGuest_hit(rs.getInt("guest_his"));
			g.setGuest_regdate(rs.getString("guest_regdate"));
			glist.add(g);

		}
		rs.close(); pstmt.close(); con.close();

		}catch(Exception e){
			e.printStackTrace();
		}

		return glist;





	}
	 */
	//조회수 증가
	public void updatehit(int no){

		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url,uid,pwd);
			sql="update guestbook set guest_hit=guest_hit+1 "
					+ "where guest_no=?";
			pstmt=con.prepareStatement(sql);

			pstmt.setInt(1, no);

			pstmt.executeUpdate();


			pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//내용보기
	public GuestBean getGuestCont(int no){
		GuestBean gcont = null;
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url,uid,pwd);
			sql="select * from guestbook where guest_no=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				gcont =new GuestBean();
				
				gcont.setGuest_no(rs.getInt("guest_no"));
				gcont.setGuest_name(rs.getString("guest_name"));
				gcont.setGuest_title(rs.getString("guest_title"));
				gcont.setGuest_cont(rs.getString("guest_cont"));
				gcont.setGuest_pwd(rs.getString("guest_pwd"));
				gcont.setGuest_hit(rs.getInt("guest_hit"));
				
			}
		rs.close(); pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return gcont;
	}
//방명록 수정
	public int EditGuest(GuestBean g){
		int re = -1;
		
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url,uid,pwd);
			sql ="update guestbook set guest_name=?,guest_title=?,"
					+ "guest_cont=? where guest_no=?";
		
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, g.getGuest_name());
			pstmt.setString(2, g.getGuest_title());
			pstmt.setString(3, g.getGuest_cont());
			pstmt.setInt(4, g.getGuest_no());
			
			re=pstmt.executeUpdate();
			
			pstmt.close(); con.close();
			
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		
		return re;
		
	}
	
	//방명록 삭제 
	
	public int deleteg(int no){
		int re =-1;
		try{
		Class.forName(driver);
		con=DriverManager.getConnection(url,uid,pwd);
		sql= "delete from guestbook where guest_no=?" ; 
		
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, no);
		
		re=pstmt.executeUpdate();
		
		pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return re;
		
	}
}
