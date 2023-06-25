package com.invinciblearmada.invinciblearmada.user.dao;

import java.util.List;

import com.invinciblearmada.invinciblearmada.user.model.UserDto;
import com.invinciblearmada.invinciblearmada.util.DBUtil;

public class UserDaoImpl implements UserDao {

	private UserDao userDao;
	private DBUtil dbUtil;
	
	public UserDaoImpl() {
		if(dbUtil==null) {
			this.dbUtil = DBUtil.getInstance();
		}
	}

	public UserDaoImpl getInstance() {
		if(userDao ==null) {
			userDao = 
		}
		return userDao;
	}
	
	@Override
	public UserDto UserLogin(UserDto userDto) {
		// TODO Auto-generated method stub
		return null;
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
