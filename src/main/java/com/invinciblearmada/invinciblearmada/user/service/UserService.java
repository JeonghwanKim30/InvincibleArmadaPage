package com.invinciblearmada.invinciblearmada.user.service;

import java.sql.SQLException;
import java.util.List;

import com.invinciblearmada.invinciblearmada.user.model.UserDto;

public interface UserService {
	public UserDto UserLogin(String userId, String userPw) throws SQLException;
	public int UserRegist(UserDto userDto);
	public List<UserDto> UserList();
	public UserDto UserDetail(int userNo);
	public int UserDelete(int userNo);
}
