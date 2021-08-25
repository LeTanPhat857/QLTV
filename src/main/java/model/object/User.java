package model.object;

import java.sql.Date;
import java.sql.Timestamp;

public class User {
    // fields
    private int libraryId;
    private String userName;
    private boolean gender;
    private Date birthday;
    private String email;
    private String address;
    private String cmnd;
    private String password;
    private Date createDate;
    private boolean isDelete;
    private int statusId;
    private int roleId;
    private String randomKey;
    private Timestamp getPassTime;

    // constructor

    // methods
    public int getLibraryId() {
        return libraryId;
    }

    public void setLibraryId(int libraryId) {
        this.libraryId = libraryId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String firstName) {
        this.userName = firstName;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
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

    public boolean isDelete() {
        return isDelete;
    }

    public void setDelete(boolean delete) {
        isDelete = delete;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRandomKey() { return randomKey; }

    public void setRandomKey(String randomKey) {
        this.randomKey = randomKey;
    }

    public Timestamp getGetPassTime() {
        return getPassTime;
    }

    public void setGetPassTime(Timestamp getPassTime) {
        this.getPassTime = getPassTime;
    }
}
