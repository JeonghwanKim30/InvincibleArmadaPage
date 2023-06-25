package com.invinciblearmada.invinciblearmada.user.service;

import java.util.List;

import com.invinciblearmada.invinciblearmada.user.dao.UserDao;
import com.invinciblearmada.invinciblearmada.user.dao.UserDaoImpl;
import com.invinciblearmada.invinciblearmada.user.model.UserDto;

public class UserServiceImpl implements UserService {

	private static UserDao userDao;
	private static UserService userService;
	
	public UserServiceImpl() {
		if(userDao==null) {
			userDao = UserDaoImpl.getInstance();
		}
	}

	public static UserService getInstance() {
		if(userService == null) {
			userService = new UserServiceImpl();
		}
		return userService;
	}
	
	@Override
	public UserDto UserLogin(UserDto userDto) {
		return userDao.UserLogin(userDto);
	}

	@Override
	public int UserRegist(UserDto userDto) {
		return userDao.UserRegist(userDto);
	}

	@Override
	public List<UserDto> UserList() {
		return userDao.UserList();
	}

	@Override
	public UserDto UserDetail(int userNo) {
		return userDao.UserDetail(userNo);
	}

	@Override
	public int UserDelete(int userNo) {
		return userDao.UserDelete(userNo);
	}


}
