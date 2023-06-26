package com.invinciblearmada.invinciblearmada.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.invinciblearmada.invinciblearmada.user.model.UserDto;
import com.invinciblearmada.invinciblearmada.util.DBUtil;

public class UserDaoImpl implements UserDao {

	private static UserDao userDao;
	private static DBUtil dbUtil;
	
	public UserDaoImpl() {
		if(dbUtil==null) {
			this.dbUtil = DBUtil.getInstance();
		}
	}

	public static UserDao getInstance() {
		if(userDao ==null) {
			userDao = new UserDaoImpl();
		}
		return userDao;
	}
	
	@Override
	public UserDto UserLogin(String userId, String userPw) throws SQLException {
		
		Connection conn = dbUtil.getConnection();
		
		UserDto loginUser = new UserDto();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("select * \n");
		sb.append("from user \n");
		sb.append("where user_id = ? and user_password = ?\n");
		
		stmt = conn.prepareStatement(sb.toString());
		stmt.setString(1, userId);
		stmt.setString(2, userPw);

		rs = stmt.executeQuery();
		
		if(rs.next()) {
			loginUser.setUserId(rs.getString("user_id"));
			loginUser.setUserNo(rs.getInt("user_no"));
			loginUser.setUserName(rs.getString("user_name"));
			loginUser.setUserPassword(rs.getString("user_password"));
			loginUser.setUserNickname(rs.getString("user_nickname"));
		}
		
		return loginUser;
	}

	@Override
	public int UserRegist(UserDto userDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserDto> UserList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserDto UserDetail(int userNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int UserDelete(int userNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
