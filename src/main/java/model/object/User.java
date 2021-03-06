package model.object;

import java.sql.Date;
import java.sql.Timestamp;

public class User {
    // fields
	private int id;
    private int libraryCardId;
    private String password;
    private String name;
    private String CMND;
    private String gender;
    private Date birthday;
    private String imgLink;
    private String email;
    private String address;
    private Date createdDate;
    private String randomKey;
    private Timestamp getPassTime;
    private int userStatusId;
    private int roleId;
    // constructor
    
    // methods
    public int getLibraryCardId() {
		return libraryCardId;
	}
    public User(){
    	
    }
	public User(int id, int libraryCardId, String password, String name, String cMND, String gender, Date birthday,
			String imgLink, String email, String address, Date createdDate, String randomKey, Timestamp getPassTime,
			int userStatusId, int roleId) {
		super();
		this.id = id;
		this.libraryCardId = libraryCardId;
		this.password = password;
		this.name = name;
		CMND = cMND;
		this.gender = gender;
		this.birthday = birthday;
		this.imgLink = imgLink;
		this.email = email;
		this.address = address;
		this.createdDate = createdDate;
		this.randomKey = randomKey;
		this.getPassTime = getPassTime;
		this.userStatusId = userStatusId;
		this.roleId = roleId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setLibraryCardId(int libraryCardId) {
		this.libraryCardId = libraryCardId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCMND() {
		return CMND;
	}
	public void setCMND(String cMND) {
		CMND = cMND;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return this.birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getImgLink() {
		return imgLink;
	}
	public void setImgLink(String imgLink) {
		this.imgLink = imgLink;
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
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
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
	@Override
	public String toString() {
		return "User [id=" + id + ", libraryCardId=" + libraryCardId + ", password=" + password + ", name=" + name
				+ ", CMND=" + CMND + ", gender=" + gender + ", birthday=" + birthday + ", imgLink=" + imgLink
				+ ", email=" + email + ", address=" + address + ", createdDate=" + createdDate + ", randomKey="
				+ randomKey + ", getPassTime=" + getPassTime + ", userStatusId=" + userStatusId + ", roleId=" + roleId
				+ "]";
	}
	
	
}
