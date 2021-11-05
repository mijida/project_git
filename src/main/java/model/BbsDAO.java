package model;

import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

/*
 * DAO(Data Access Object):데이타에 접근해서 CRUD작업을
 *                         수행하는 업무처리 로직을 갖고 있는 객체
 * 
 */
public class BbsDAO {
	//[멤버변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	public BbsDAO(ServletContext context) {
		/*
		try {
			//방법1]
			//.properties파일은 반드시 클래스패스인 src/main/java에 위치시키자
			//파일명만(.properties빼고)
			ResourceBundle resource = ResourceBundle.getBundle("/resources/database");
			String username=resource.getString("username");	
			String password=resource.getString("password");		
			
			//방법2]
			InputStream is=context.getResourceAsStream("/WEB-INF/resources/database.properties");			
			Properties props = new Properties();
			props.load(is);
			System.out.println(props.getProperty("username"));
			System.out.println(props.getProperty("password"));
			
			//드라이버 로딩]
			Class.forName(context.getInitParameter("ORACLE_DRIVER"));
			//데이타베이스 연결]
			conn = DriverManager.getConnection(context.getInitParameter("ORACLE_URL"),username,password);
			System.out.println("데이터 베이스 연결 성공");
		}
		catch(ClassNotFoundException | SQLException | IOException e) {e.printStackTrace();}
		*/
		//커넥션풀 사용하기]
		try {
			Context ctx = new InitialContext();
			DataSource source=(DataSource)ctx.lookup(context.getInitParameter("JNDI_ROOT")+"/jsp");
			conn= source.getConnection();
		}
		catch(NamingException | SQLException e) {e.printStackTrace();}
		
		
	}//////////////////////
	//자원반납용]
	public void close() {
		try {
			if(rs !=null) rs.close();
			if(psmt !=null) psmt.close();
			if(conn !=null) conn.close();
		}
		catch(SQLException e) {e.printStackTrace();}
	}///////////////
	//회원 여부 판단용]
	public boolean isMember(String user,String password) {
		String sql="SELECT COUNT(*) FROM member WHERE id=? AND pwd=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user);
			psmt.setString(2, password);
			rs = psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) return false;
		}
		catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}///////////////////////////
	//입력용]
	public int insert(BbsDTO dto) {
		int affected=0;
		String sql="INSERT INTO bbs(no,id,title,content) VALUES(SEQ_BBS.NEXTVAL,?,?,?)";
		try {
			//psmt = conn.prepareStatement(sql);
			//입력된 행의 키값 가져오기			
			psmt=conn.prepareStatement(sql,new String[] {"no"});//두번째 인자는 키값인 컬럼의 배열명.혹은 인덱스로 new int[]{1}
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			affected= psmt.executeUpdate();
			
			//입력된 행의 키값 가져오기			
			rs=psmt.getGeneratedKeys();
			if(rs.next()){
				System.out.println("키값(no컬럼):"+rs.getLong(1));
			}			
			
		}
		catch(SQLException e) {e.printStackTrace();}
		
		return affected;
	}///////////////insert
	//전체 목록 가져오기]
	/*
	 * 페이징 로직 추가하기
	 * DAO에서 할일
	 * 1. 전체목록 쿼리를 구간 쿼리로 변경
	 * 2. 총 레코드수 구하는 메소드 추가	
	 */
	public List<BbsDTO> selectList(Map map){
		List<BbsDTO> list = new Vector<>();
		//페이징 적용 前 쿼리- 전체 목록 쿼리
		//String sql="SELECT b.*,name FROM bbs b JOIN member m ON m.id = b.id ORDER BY no DESC";
		//페이징 적용-구간쿼리로 변경
		String sql="SELECT * FROM (SELECT T.*,ROWNUM R FROM (SELECT b.*,name FROM bbs b JOIN member m ON m.id = b.id ";
		//검색시	
		if(map.get("searchColumn") !=null) {
			sql+=" WHERE "+map.get("searchColumn")+" LIKE '%"+map.get("searchWord")+"%' ";
		}
		sql+=" ORDER BY no DESC) T) WHERE R BETWEEN ? AND ?";
		System.out.println("sql:"+sql);
		try {
			psmt = conn.prepareStatement(sql);
			
			//페이징을 위한 시작 및 종료 rownum설정]
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			
			rs=psmt.executeQuery();
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setContent(rs.getString(4));
				dto.setId(rs.getString(2));
				dto.setName(rs.getString(7));
				dto.setNo(rs.getString(1));
				dto.setPostDate(rs.getDate(6));
				dto.setTitle(rs.getString(3));
				dto.setVisitCount(rs.getString(5));
				list.add(dto);
			}
		}
		catch(SQLException e) {e.printStackTrace();}		
		return list;
	}///////////////selectList
	//총 레코드 수 얻기용]
	public int getTotalRowCount(Map map) {
		int totalRowCount=0;
		//검색시에 페이징 미 적용
		//String sql="SELECT COUNT(*) FROM bbs";
		//검색시에도 페이징 적용
		String sql="SELECT COUNT(*) FROM bbs b JOIN member m ON m.id=b.id ";
		if(map.get("searchColumn") !=null) {
			sql+=" WHERE "+map.get("searchColumn")+" LIKE '%"+map.get("searchWord")+"%' ";
		}
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalRowCount= rs.getInt(1);
		}
		catch(SQLException e) {e.printStackTrace();}
		
		return totalRowCount;
	}///////////////
	
	//상세보기용]
	public BbsDTO selectOne(String no,String prevPageName) {
		BbsDTO dto=null;
		try {
			conn.setAutoCommit(false);
			String sql;
			
			//목록에서 넘어온 경우에만 조회수 증가
			if(prevPageName.toUpperCase().indexOf("LIST") !=-1) {
				//조회 수 업데이트
				sql="UPDATE bbs SET visitcount=visitcount+1 WHERE no=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, no);
				psmt.executeUpdate();
			}
			//레코드 하나 조회
			sql="SELECT b.*,name FROM bbs b JOIN member m ON m.id = b.id WHERE no=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto = new BbsDTO();
				dto.setContent(rs.getString(4));
				dto.setId(rs.getString(2));
				dto.setName(rs.getString(7));
				dto.setNo(rs.getString(1));
				dto.setPostDate(rs.getDate(6));
				dto.setTitle(rs.getString(3));
				dto.setVisitCount(rs.getString(5));				
			}
			conn.commit();			
		}
		catch(SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			}
			catch(SQLException e1) {e1.printStackTrace();}
		}
		
		return dto;
	}///////////////////selectOne
	//이전글/다음글 얻기
	public Map<String,BbsDTO> prevNext(String key){
		Map<String,BbsDTO> map = new HashMap<>();
		try {
			//이전글 얻기]
			String sql="SELECT no,title FROM bbs WHERE no=(SELECT MIN(no) FROM bbs WHERE no > ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();
			if(rs.next()) {//이전글이 있는 경우
				map.put("PREV",new BbsDTO(rs.getString(1), null, rs.getString(2), null,null, null));
			}
			//다음글 얻기]
			sql="SELECT no,title FROM bbs WHERE no=(SELECT MAX(no) FROM bbs WHERE no < ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();
			if(rs.next()) {//다음글이 있는 경우
				map.put("NEXT",new BbsDTO(rs.getString(1), null, rs.getString(2), null,null, null));
			}
		}
		catch(SQLException e) {e.printStackTrace();}
		return map;
	}////////////////prevNext
	
	//수정용]
	public int update(BbsDTO dto) {
		int affected=0;
		String sql="UPDATE bbs SET title=?,content=? WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(3, dto.getNo());
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			affected= psmt.executeUpdate();			
			
		}
		catch(SQLException e) {e.printStackTrace();}
		
		return affected;
	}///////////////insert
	//수정용]
	public int delete(String key) {
		int affected=0;
		String sql="DELETE bbs WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);			
			psmt.setString(1, key);			
			affected= psmt.executeUpdate();			
		}
		catch(SQLException e) {e.printStackTrace();}		
		return affected;
	}///////////////insert
	
	
	
}//////////////BbsDAO
