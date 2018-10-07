package org.datacenter.entity;

/**
 * @Author: xiaolong
 * @Date: Created in 下午12:59 18-10-7
 * @Desription:
 */
public class User {
    private int userId;
    private String userName;
    private String userEmail;
    private String userTel;
    private int userAdmin;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel;
    }

    public int getUserAdmin() {
        return userAdmin;
    }

    public void setUserAdmin(int userAdmin) {
        this.userAdmin = userAdmin;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userTel='" + userTel + '\'' +
                ", userAdmin=" + userAdmin +
                '}';
    }
}
