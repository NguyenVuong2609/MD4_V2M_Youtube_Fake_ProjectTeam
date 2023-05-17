package rikkei.academy.service.LikeService;

import rikkei.academy.config.ConnectToMySQL;
import rikkei.academy.model.Like;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikeServiceIMPL implements ILikeService{
    private final Connection connection = ConnectToMySQL.getConnection();
    private String INSERT_INTO_LIKE = "insert into user_like (user_id, video_id) values (?,?)";
    private String DELETE_LIKE_BY_ID = "delete from user_like where video_id = ? and user_id = ?";
    private String CHECK_LIKE = "select * from user_like join user u on u.user_id = user_like.user_id where video_id = ? and u.user_id = ?";
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
    public void deleteByVideoIdAndUserId(int video_id, int user_id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_LIKE_BY_ID);
            preparedStatement.setInt(1,video_id);
            preparedStatement.setInt(2,user_id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean checkLike(int video_id, int user_id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CHECK_LIKE);
            preparedStatement.setInt(1,video_id);
            preparedStatement.setInt(2,user_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
}
