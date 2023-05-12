package rikkei.academy.model;

public class User {
    int user_id;
    String name;
    String username;
    String password;

    public User() {
    }

    public User(int user_id, String name, String username, String password) {
        this.user_id = user_id;
        this.name = name;
        this.username = username;
        this.password = password;
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
}
