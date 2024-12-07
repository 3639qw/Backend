package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import dto.Account;

public class AccountDAO extends UserDao{
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	
	
	
	public boolean InsertAccount(Account ac) {
		String query = "INSERT INTO account (userid, name, num) VALUES (?, ?, ?)";
		
		try(Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
			stmt.setString(1, ac.getId());
			stmt.setString(2, ac.getBankName());
			stmt.setString(3, ac.getAccountNumber());
			return stmt.executeUpdate() > 0;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean UpdateAccount(String bank, String bnum, String anum) {
		String query = "UPDATE account SET num = ? WHERE account.name = ? AND account.num = ?";
		try(Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(query)){
			stmt.setString(1, anum);
			stmt.setString(1, bank);
			stmt.setString(1, bnum);
			return stmt.executeUpdate() > 0;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
//	public boolean deleteAccount(String num, String bank) {
//		String sql = ""
//	}
	
	public ArrayList<Account> selectAccountList() throws SQLException{
		ResultSet rs = null;
		ArrayList<Account> aList = new ArrayList<Account>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from account;");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Account ac = new Account(rs.getString("userid"), rs.getString("name"), rs.getString("num"));
				aList.add(ac);
			}
		}catch(Exception e) {
			
		}finally {
			conn.close();
			pstmt.close();
		}
		return aList;
	}
}
