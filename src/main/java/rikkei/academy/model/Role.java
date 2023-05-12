package rikkei.academy.model;

public class Role {
    int id;
    RoleName name;

    public Role() {
    }

    public Role(int id, RoleName name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public RoleName getName() {
        return name;
    }

    public void setName(RoleName name) {
        this.name = name;
    }
}
