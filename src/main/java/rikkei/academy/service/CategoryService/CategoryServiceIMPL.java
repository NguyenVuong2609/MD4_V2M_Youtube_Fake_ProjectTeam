package rikkei.academy.service.CategoryService;

import rikkei.academy.config.ConnectToMySQL;
import rikkei.academy.model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class CategoryServiceIMPL implements ICategoryService{
    private Connection connection = ConnectToMySQL.getConnection();
    private static final String INSERT_INTO_CATEGORY = "insert into category (category_name) values (?)";
    @Override
    public List<Category> findAll() {
        return null;
    }

    @Override
    public void save(Category category) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_CATEGORY);
            preparedStatement.setString(1,category.getName());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Category findById(int id) {
        return null;
    }

    @Override
    public void deleteById(int id) {

    }
}
