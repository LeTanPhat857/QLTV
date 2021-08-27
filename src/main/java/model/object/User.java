package model.object;

import java.sql.Date;
import java.sql.Timestamp;

public class User {
    // fields
    private int libraryCardId;
    private String userName;
    private String gender;
    private Date birthday;
    private String email;
    private String address;
    private String cmnd;
    private String password;
    private Date createDate;
    private String imgLink;
    private String randomKey;
    private Timestamp getPassTime;
    private int userStatusId;
    private int roleId;

    // constructor
    
    // methods
	public int getLibraryCardId() {
		return libraryCardId;
	}
	public void setLibraryCardId(int libraryCardId) {
		this.libraryCardId = libraryCardId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCmnd() {
		return cmnd;
	}
	public void setCmnd(String cmnd) {
		this.cmnd = cmnd;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getImgLink() {
		return imgLink;
	}
	public void setImgLink(String imgLink) {
		this.imgLink = imgLink;
	}
	public String getRandomKey() {
		return randomKey;
	}
	public void setRandomKey(String randomKey) {
		this.randomKey = randomKey;
	}
	public Timestamp getGetPassTime() {
		return getPassTime;
	}
	public void setGetPassTime(Timestamp getPassTime) {
		this.getPassTime = getPassTime;
	}
	public int getUserStatusId() {
		return userStatusId;
	}
	public void setUserStatusId(int userStatusId) {
		this.userStatusId = userStatusId;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

}
