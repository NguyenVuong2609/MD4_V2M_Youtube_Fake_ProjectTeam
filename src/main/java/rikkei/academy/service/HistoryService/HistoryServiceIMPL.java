package rikkei.academy.service.HistoryService;

import rikkei.academy.config.ConnectToMySQL;
import rikkei.academy.model.History;
import rikkei.academy.model.User;
import rikkei.academy.model.Video;
import rikkei.academy.service.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HistoryServiceIMPL implements IHistoryService {
    private Connection connection = ConnectToMySQL.getConnection();
    private final String INSERT_INTO_VIDEO_HISTORY_CONNECTION = "INSERT INTO video_history_connection VALUES (?,?);";
    private final String SELECT_ALL_HISTORY = "SELECT * FROM history";
    private final String SELECT_HISTORY_BY_ID = "SELECT history_id from history WHERE history_id = ?;";
    private final String SELECT_HISTORY_BY_USER_ID = "SELECT history_id from history WHERE user_id = ?;";
    private final String DELETE_FROM_HISTORY = "DELETE FROM history where history_id = ?";
    private final String SELECT_VIDEO = "SELECT vhn.video_id from video_history_connection vhn JOIN history h on vhn.history_id = h.history_id " +
            "WHERE h.user_id = ?;";
    private final String CHECK_HISTORY = "SELECT vhn.video_id, vhn.history_id from video_history_connection vhn JOIN history h on vhn.history_id = h.history_id " +
            "WHERE h.user_id = ? AND vhn.video_id=?;";



    @Override
    public List<History> findAll() {
        return null;
    }

    @Override
    public void save(History history) {

    }

    @Override
    public History findById(int id) {

        return null;
    }

    @Override
    public void deleteById(int id) {

    }

    @Override
    public int findHistoryByUserId(int user_id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_HISTORY_BY_USER_ID);
            preparedStatement.setInt(1, user_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            int history_id = 0;
            while (resultSet.next()) {
                history_id = resultSet.getInt(1);
            }
            return history_id;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void addVideo(int video_id, int user_id) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_VIDEO_HISTORY_CONNECTION);
            preparedStatement.setInt(1, video_id);
            preparedStatement.setInt(2, findHistoryByUserId(user_id));
            preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteVideo(User user) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FROM_HISTORY);
            preparedStatement.setInt(1, findHistoryByUserId(user.getUser_id()));
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public boolean checkExistVideo(int video_id, int user_id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CHECK_HISTORY);
            preparedStatement.setInt(1, user_id);
            preparedStatement.setInt(2, video_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                System.out.println(1234);
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public List<Video> findListVideoInHistory(int user_id) {
        List<Video> videoList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_VIDEO);
            preparedStatement.setInt(1, user_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                videoList.add(Service.getInstance().getVideoService().findById(resultSet.getInt(1)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return videoList;
    }

}
