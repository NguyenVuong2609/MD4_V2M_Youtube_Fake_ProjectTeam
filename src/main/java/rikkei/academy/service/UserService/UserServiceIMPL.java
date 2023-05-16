package rikkei.academy.service.UserService;

import rikkei.academy.config.ConnectToMySQL;
import rikkei.academy.model.Role;
import rikkei.academy.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class UserServiceIMPL implements IUserService{
    private Connection connection = ConnectToMySQL.getConnection();
    private final String SELECT_ALL_USERNAME = "select username from user";
    private final String SELECT_ALL_EMAIL = "select email from user";
    private final String INSERT_INTO_USER = "insert into user (name, username, email, password, avatar) values (?,?,?,?,?)";
    private final String INSERT_INTO_USERROLE = "insert into user_role values (?,?)";
    private final String SELECT_USER_LOGIN = "select * from user where (username = ? and convert(password using utf8mb4) collate utf8mb4_bin = ?)";
    @Override
    public List<User> findAll() {
        return null;
    }

    @Override
    public void save(User user) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_USER, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getUsername());
            preparedStatement.setString(3,user.getEmail());
            preparedStatement.setString(4,user.getPassword());
            preparedStatement.setString(5,user.getAvatar());
            preparedStatement.executeUpdate();
            int user_id = 0;
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            while (resultSet.next()){
                user_id = resultSet.getInt(1);
            }
            //! Set User_id and Role_id into user_role table
            PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_INTO_USERROLE);
            Set<Role> roleSet = user.getRoleSet();
            List<Role> roleList = new ArrayList<>(roleSet);
            //! convert Set --> List
            List<Integer> listRoleId = new ArrayList<>();
            for (int i = 0; i < roleList.size(); i++) {
                listRoleId.add(roleList.get(i).getId());
            }
            for (int i = 0; i < listRoleId.size(); i++) {
                preparedStatement1.setInt(1,user_id);
                preparedStatement1.setInt(2,listRoleId.get(i));
                preparedStatement1.executeUpdate();
            }
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public User findById(int id) {
        return null;
    }

    @Override
    public void deleteById(int id) {

    }

    @Override
    public boolean existedByUsername(String username) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERNAME);
            List<String> listUserName = new ArrayList<>();
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                listUserName.add(resultSet.getString("username"));
            }
            for (int i = 0; i < listUserName.size(); i++) {
                if (username.equals(listUserName.get(i))){
                    return true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public boolean existedByEmail(String email) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMAIL);
            List<String> listEmail = new ArrayList<>();
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                listEmail.add(resultSet.getString("email"));
            }
            for (int i = 0; i < listEmail.size(); i++) {
                if (email.equals(listEmail.get(i))){
                    return true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public User userLogin(String username, String password) {
        User user = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_LOGIN);
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,password);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("user_id");
                String name = resultSet.getString("name");
                String avatar = resultSet.getString("avatar");
                Set<Role> roleSet = findRoleByUserId(id);
                user = new User(id,name,avatar,roleSet);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    @Override
    public Set<Role> findRoleByUserId(int user_id) {
        return null;
    }

    @Override
    public void updateAvatar(String avatar, int id) {

    }
}
