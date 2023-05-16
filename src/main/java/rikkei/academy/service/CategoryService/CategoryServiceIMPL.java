package rikkei.academy.service.CategoryService;

import rikkei.academy.config.ConnectToMySQL;
import rikkei.academy.model.Category;

import java.sql.*;
import java.util.List;


public class CategoryServiceIMPL implements ICategoryService{
    private Connection connection = ConnectToMySQL.getConnection();
    private final String INSERT_INTO_CATEGORY = "INSERT INTO category(category_name) VALUES (?)";
    @Override
    public List<Category> findAll() {
        return null;
    }

    @Override
    public void save(Category category) {
        try {
            // chuan bi cau query
           PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_CATEGORY);
           //dien tham so vao cau query
           preparedStatement.setString(1,category.getName());
           // thuc hien cau lenh query
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

