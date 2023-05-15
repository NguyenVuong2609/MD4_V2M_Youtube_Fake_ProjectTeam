package rikkei.academy.service.RoleService;

import rikkei.academy.config.ConnectToMySQL;
import rikkei.academy.model.Role;
import rikkei.academy.model.RoleName;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleServiceIMPL implements IRoleService {
    private Connection connection = ConnectToMySQL.getConnection();
    private final String FIND_BY_ROLE_NAME = "select * from role where role_name = ?;";

    @Override
    public Role findByName(RoleName name) {
        Role role = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ROLE_NAME);
            preparedStatement.setString(1, String.valueOf(name));
            ResultSet resultSet = preparedStatement.executeQuery();
            int roleId = 0;
            while (resultSet.next()) {
                roleId = resultSet.getInt("role_id");
                role = new Role(roleId, name);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return role;
    }
}
