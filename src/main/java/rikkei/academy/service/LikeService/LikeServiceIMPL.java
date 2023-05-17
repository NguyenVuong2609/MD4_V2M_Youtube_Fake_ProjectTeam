package rikkei.academy.service.LikeService;

import rikkei.academy.config.ConnectToMySQL;
import rikkei.academy.model.Like;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class LikeServiceIMPL implements ILikeService{
    private Connection connection = ConnectToMySQL.getConnection();
    private static final String INSERT_INTO_LIKE = "insert into like (user_id,video_id) values (?,?)";
    private static final String DELETE_LIKE_BY_ID = "DELETE FROM like WHERE like_id = ?";

    @Override
    public void save(Like like) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_LIKE);
            preparedStatement.setInt(1,like.getUser().getUser_id());
            preparedStatement.setInt(2,like.getVideo().getVideo_id());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteById(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_LIKE_BY_ID);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

//try {
//        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LIKE_POST_BY_ID);
//        preparedStatement.setInt(1, postId);
//        User currentUser = new UserServiceIMPL().getCurrentUser(request);
//        int userId = currentUser.getUserId();
//        preparedStatement.setInt(2, userId);
//        ResultSet resultSet = preparedStatement.executeQuery();
//        List<Like> likeList = new ArrayList<>();
//
//        while (resultSet.next()) {
//        int likeId = resultSet.getInt("likeId");
//        likeList.add(new Like(likeId, currentUser));
//        }
//        if (likeList.size() == 0) {
//        connection.setAutoCommit(false);
//        PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_INTO_LIKE, Statement.RETURN_GENERATED_KEYS);
//        preparedStatement1.executeUpdate();
//        ResultSet resultSet1 = preparedStatement1.getGeneratedKeys();
//        int likeId = 0;
//        while (resultSet1.next()) {
//        likeId = resultSet1.getInt(1);
//        }
//        PreparedStatement preparedStatement2 = connection.prepareStatement(INSERT_INTO_LIKE_POST);
//        preparedStatement2.setInt(1, likeId);
//        preparedStatement2.setInt(2, postId);
//        preparedStatement2.setInt(3, userId);
//        preparedStatement2.executeUpdate();
//        connection.commit();
//        } else {
//        connection.setAutoCommit(false);
//        PreparedStatement preparedStatement1 = connection.prepareStatement(DELETE_LIKE_POST);
//        preparedStatement1.setInt(1, postId);
//        preparedStatement1.executeUpdate();
//
//        PreparedStatement preparedStatement2 = connection.prepareStatement(DELETE_FROM_LIKE);
//        preparedStatement2.executeUpdate();
//        connection.commit();
//        }
//        } catch (SQLException e) {
//        throw new RuntimeException(e);
//        }
