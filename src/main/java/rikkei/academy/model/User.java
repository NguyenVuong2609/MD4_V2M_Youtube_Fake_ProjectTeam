package rikkei.academy.model;

import java.util.Set;

public class User {
    private int user_id;
    private String name;
    private String username;
    private String password;
    private String email;
    private String avatar = "https://firebasestorage.googleapis.com/v0/b/vuongcuti-6ce58.appspot.com/o/images.png?alt=media&token=568b3bcc-c852-4669-9cd3-d4684ce4ad70";
    private Channel channel;
    private boolean status;
    private Set<Role> roleSet;

    public User() {
    }

    public User(int user_id, String name, String username, String password, String email, String avatar, Channel channel, boolean status, Set<Role> roleSet) {
        this.user_id = user_id;
        this.name = name;
        this.username = username;
        this.password = password;
        this.email = email;
        this.avatar = avatar;
        this.channel = channel;
        this.status = status;
        this.roleSet = roleSet;
    }

    public User(String name, String username, String email, String password, Set<Role> roleSet) {
        this.name = name;
        this.username = username;
        this.email = email;
        this.password = password;
        this.roleSet = roleSet;
    }

    public User(int id, String name, String avatar, Set<Role> roleSet) {
        this.user_id = id;
        this.name = name;
        this.avatar = avatar;
        this.roleSet = roleSet;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }


    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Set<Role> getRoleSet() {
        return roleSet;
    }

    public void setRoleSet(Set<Role> roleSet) {
        this.roleSet = roleSet;
    }

    public Channel getChannel() {
        return channel;
    }

    public void setChannel(Channel channel) {
        this.channel = channel;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", name='" + name + '\'' +
                '}';
    }
}
