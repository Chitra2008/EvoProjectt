package com.mastek.demo.dao;


import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import javax.servlet.http.*;




import com.mastek.demo.model.Employee;

public class EmpDao extends HttpServlet{
	
	
	
	public static Connection getConnection(){ 
		
	    Connection con=null;  
	    try{  
	    	Class.forName("oracle.jdbc.driver.OracleDriver");
	    	String dbURL = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST= 132.145.42.131)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=Testdb_pdb1.evopaassub1.evopaasvcn.oraclevcn.com)))";
			String strUserID = "trainee_schema";
			String strPassword = "Trn__Schema_21";
			con = DriverManager.getConnection(dbURL, strUserID, strPassword);
 
			
	    }catch(Exception e){System.out.println(e);}  
	    return con; 
	   
	}  
	
	
	public static List<Employee> getAllRecords() throws SQLException{  
	    List<Employee> list=new ArrayList<Employee>();  
	    Connection con = null;
	    try{  
	         con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select  r.reqId, e.ename, r.depart, r.destination, r.travelDate, e.empId from BATCH4BTR_login e join BATCH4BTR_request r on e.empId = r.empid");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	Employee u=new Employee();  

	        	u.setReqId(rs.getInt("reqId"));
	            u.setEmpName(rs.getString("ename"));
	            u.setDepart(rs.getString("depart"));
	            u.setDestination(rs.getString("destination"));
	            u.setTravelDate(rs.getString("travelDate"));
	            u.setEmpId(rs.getInt("empId"));	      
	            list.add(u);  
	        }  
	    }catch(Exception e){System.out.println(e);}
	    finally {
			con.close();
		}
	    return list;  
	}  
	
	public static int save (Employee e) throws SQLException {
		int status = 0;
		Connection con = null;
		try {
			con = getConnection();
			
			String email, pass;
			email = e.getEmpEmail();
			pass = e.getEpass();
			
			System.out.println(email);
			System.out.println(pass);
			
			Employee u = getRecordByEmail(email, pass);
			
			System.out.println(u.getEmpId());
			
			int a = u.getEmpId(); 
			System.out.println(a);
			
			PreparedStatement ps = con.prepareStatement("insert into BATCH4BTR_request(depart,destination,travelDate,accom,advnc,amt,empId) values(?,?,?,?,?,?,?)");
			
	
			ps.setString(1, e.getDepart());
			ps.setString(2, e.getDestination());
			ps.setString(3, e.getTravelDate());
			ps.setString(4, e.getAccom());
			ps.setString(5, e.getAdvance());
			ps.setInt(6, e.getAmount());
			ps.setInt(7, a);

			status = ps.executeUpdate();
			 
		}
		catch(Exception ex) {System.out.println(ex);}
		finally {
			con.close();
		}
		return status;
	}
	
	public static boolean ApproveLogic (int reqId) throws SQLException {
		Connection con = null;
		boolean status = false;
		try {
			con = getConnection();
			
			CallableStatement stmt = con.prepareCall("{call get_next_approver(?) }");
			stmt.setInt(1, reqId);
			 status = stmt.execute();
			 
		}
		catch(Exception ex) {System.out.println(ex);}
		finally {
			con.close();
		}
		
		return status;
	}
	
	
	
	

	public static Employee getRecordById(int empId) throws SQLException{  
		Employee u=null;  
		Connection con = null;
	    try{  
	        con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select  be.*, br.*, bed.*  from BATCH4BTR_login  be full outer join  BATCH4BTR_request br on be.empId = br.empId\r\n"
	        		+ "full outer join BATCH4BTR_empDetails bed on  be.empId = bed.empId  where be.empId= ?");  
	        ps.setInt(1,empId);  
	        ResultSet rs=ps.executeQuery();  
	        
	        	 while(rs.next()){  
	                u=new Employee();  
	                u.setEmpId(rs.getInt("empId"));
	                u.setEmpName(rs.getString("ename"));
	                u.setEmpEmail(rs.getString("email"));
	                u.setEpass(rs.getString("pass"));
	                u.setPostdetailsid(rs.getInt("postDetailsId"));
	                u.setReqId(rs.getInt("reqID"));
	                u.setDepart(rs.getString("depart"));
	                u.setDestination(rs.getString("destination"));
	                u.setTravelDate(rs.getString("travelDate"));
	 	            u.setAccom(rs.getString("accom"));
	 	            u.setAdvance(rs.getString("advnc"));
	 	            u.setAmount(rs.getInt("amt"));
	 	            u.setStatus(rs.getString("status"));
	 	            u.setNation(rs.getString("nationality"));
	 	            u.setNationId(rs.getInt("nationId"));
	 	            u.setDob(rs.getString("dob"));
	 	            u.setDoj(rs.getString("joinDate"));
	 	            u.setPassport(rs.getString("passport"));
	 	            u.setGender(rs.getString("gender"));
	 	            u.setDept(rs.getString("dept"));
	 	            
	 	      
	 	          
	                 }
	    }catch(Exception e){System.out.println(e);}  
	    finally {
			con.close();
		}
	    return u;
	} 
	
	 
	
	
	public static Employee getRecordByEmail(String email, String pass) throws SQLException{  
		 Connection con = null;
		 Employee u=new Employee();  
	    try{  
	         con=getConnection(); 

	        PreparedStatement ps=con.prepareStatement("select email, pass, postDetailsId, empid from BATCH4BTR_login where email=? and pass=?");  
	        ps.setString(1,email);  
	        ps.setString(2, pass);
	        ResultSet rs=ps.executeQuery();  
	        	 while(rs.next()){  
	                
	        		 if (rs.getString(1).equals(email) && rs.getString(2).equals(pass)) {

	 	 	            u.setEmpEmail(rs.getString("email"));
	 	 	            u.setEpass(rs.getString("pass"));
	 	 	            u.setPostdetailsid(rs.getInt("POSTDETAILSID"));
	 	 	            u.setEmpId(rs.getInt("empId"));
	 	 	
		 	           
	                 } 
	             }	  
	        	 
	        	 u.toString();
	    }catch(Exception e){System.out.println(e);}  
	    finally {
			con.close();
		}
	    return u;
	} 

	public static Employee getRecordByAEmail(String email, String pass) throws SQLException{  
		 Connection con = null;
		 Employee u=new Employee();  
	    try{  
	         con=getConnection(); 

	        PreparedStatement ps=con.prepareStatement("select email, pass, postDetailsId from BATCH4BTR_login where email=? and pass=?");  
	        ps.setString(1,email);  
	        ps.setString(2, pass);
	        ResultSet rs=ps.executeQuery();  
	        	 while(rs.next()){  
	                
	        		 if (rs.getString(1).equals(email) && rs.getString(2).equals(pass)) {

	 	 	            u.setEmpEmail(rs.getString("email"));
	 	 	            u.setEpass(rs.getString("pass"));
	 	 	            u.setPostdetailsid(rs.getInt("POSTDETAILSID"));

	                 } 
	             }	  
	        	 
	    }catch(Exception e){System.out.println(e);}  
	    finally {
			con.close();
		}
	    return u;
	} 


	
	
	public static int saveDetails(Employee e) throws SQLException {
        int status = 0;
        Connection con = null;
        try {
            System.out.println(e.toString());
             con = getConnection();
            PreparedStatement ps = con.prepareStatement("insert into BATCH4BTR_login(ename,email,pass) values(?,?,?)");
            ps.setString(1, e.getEmpName());
            ps.setString(2, e.getEmpEmail());
            ps.setString(3, e.getEpass());
            status = ps.executeUpdate();
            
            PreparedStatement ss = con.prepareStatement("select empId from BATCH4BTR_login where email = ?");
            ss.setString(1, e.getEmpEmail());
            ResultSet r = ss.executeQuery();
            
            while(r.next()){  
            	
                e.setEmpId(r.getInt("empId"));
                System.out.println(e.getEmpId());
            	
            	}
          
            PreparedStatement rs = con.prepareStatement("insert into BATCH4BTR_empDetails(nationality,nationid,joindate,dob,passport,gender,dept,empid) values(?,?,?,?,?,?,?,?)");
           
            rs.setString(1, e.getNation());
            rs.setInt(2, 101);
            rs.setString(3, e.getDoj());
            rs.setString(4, e.getDob());
            rs.setString(5, e.getPassport());
            rs.setString(6, e.getGender());
            rs.setString(7, e.getDept());
            rs.setInt(8, e.getEmpId() );
            status = rs.executeUpdate();
        }
        catch(Exception ex) {System.out.println(ex);}
        finally {
           con.close();
        }
        return status;
    }
}
