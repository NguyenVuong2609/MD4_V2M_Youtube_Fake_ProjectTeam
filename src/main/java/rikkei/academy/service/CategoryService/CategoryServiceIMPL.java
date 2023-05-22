package rikkei.academy.service.CategoryService;

import rikkei.academy.config.ConnectToMySQL;
import rikkei.academy.model.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryServiceIMPL implements ICategoryService{
    public static List<Category> categoryList = new ArrayList<>();
    private Connection connection = ConnectToMySQL.getConnection();
    private static final String INSERT_INTO_CATEGORY = "insert into category (category_name) values (?)";
    private static final String SELECT_CATEGORY_BY_NAME = "SELECT  * FROM category WHERE category_name = ?";
    private static final String SELECT_ALL_CATEGORY = "SELECT * FROM category";
    private static final String SELECT_CATEGORY_BY_VIDEO_ID = "select c.category_id, category_name from category c join video_category_connection vcc on c.category_id = vcc.category_id\n where video_id = ?";
    @Override
    public List<Category> findAll() {
        List<Category> categoryList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORY);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Category category = new Category();
                category.setId(resultSet.getInt("category_id"));
                category.setName(resultSet.getString("category_name"));
                categoryList.add(category);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return categoryList;
    }

    @Override
    public void save(Category category) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_CATEGORY);
            preparedStatement.setString(1,category.getName());
            preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Category findById(int id) {
        for (int i = 0; i < categoryList.size(); i++) {
            if (categoryList.get(i).getId()==id){
                return categoryList.get(i);
            }
        }
        return null;
    }

    @Override
    public void deleteById(int id) {
        categoryList.remove(findById(id));
    }

    @Override
    public Category findByName(String name) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CATEGORY_BY_NAME);
            preparedStatement.setString(1, name);
            ResultSet resultSet = preparedStatement.executeQuery();
            String category_name = null;
            while (resultSet.next()){
                category_name = resultSet.getString("category_name");
            }
            for (int i = 0; i < findAll().size(); i++) {
                if(findAll().get(i).getName().equalsIgnoreCase(category_name)){
                    return findAll().get(i);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public Category findByVideoId(int video_id) {
        Category category = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CATEGORY_BY_VIDEO_ID);
            preparedStatement.setInt(1,video_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                category = new Category();
                category.setId(resultSet.getInt(1));
                category.setName(resultSet.getString(2));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return category;
    }
}
