package com.invinciblearmada.invinciblearmada.user.dao;

import java.util.List;

import com.invinciblearmada.invinciblearmada.user.model.UserDto;

public interface UserDao {
	public UserDto UserLogin(UserDto userDto);
	public int UserRegist(UserDto userDto);
	public List<UserDto> UserList();
	public UserDto UserDetail(int userNo);
	public int UserDelete(int userNo);
}
