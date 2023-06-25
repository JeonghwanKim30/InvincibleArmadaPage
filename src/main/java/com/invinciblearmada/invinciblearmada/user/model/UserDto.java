package com.invinciblearmada.invinciblearmada.user.model;

public class UserDto {
	private int userNo;
	private String userName;
	private String userId;
	private String userPassword;
	private String userNickname;
	private int type;
	private int teamNo;
	private String userDescription;
	private String userEmail;
	private int winCount;
	private int loseCount;
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getTeamNo() {
		return teamNo;
	}
	public void setTeamNo(int teamNo) {
		this.teamNo = teamNo;
	}
	public String getUserDescription() {
		return userDescription;
	}
	public void setUserDescription(String userDescription) {
		this.userDescription = userDescription;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getWinCount() {
		return winCount;
	}
	public void setWinCount(int winCount) {
		this.winCount = winCount;
	}
	public int getLoseCount() {
		return loseCount;
	}
	public void setLoseCount(int loseCount) {
		this.loseCount = loseCount;
	}
	
	@Override
	public String toString() {
		return "UserDto [userNo=" + userNo + ", userName=" + userName + ", userId=" + userId + ", userPassword="
				+ userPassword + ", userNickname=" + userNickname + ", type=" + type + ", teamNo=" + teamNo
				+ ", userDescription=" + userDescription + ", userEmail=" + userEmail + ", winCount=" + winCount
				+ ", loseCount=" + loseCount + "]";
	}
	
	

}
