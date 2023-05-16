package rikkei.academy.service.VideoService;

import rikkei.academy.config.ConnectToMySQL;
import rikkei.academy.model.Category;
import rikkei.academy.model.Channel;
import rikkei.academy.model.Video;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VideoServiceIMPL implements IVideoService {
    private Connection connection = ConnectToMySQL.getConnection();
    private static final String SELECT_VIDEO_LIST = "SELECT * FROM video;";
    private static final String INSERT_INTO_VIDEO = "INSERT INTO video (video_name, video_link,channel_id,image) VALUES (?,?,?,?);";
    private static final String UPDATE_VIDEO = "UPDATE video SET video_name = ? AND image = ? AND status = ? WHERE video_id=?;";
    private static final String INSERT_VIDEO_CATEGORY = "INSERT INTO video_category_connection VALUES (?,?);";
    private static final String FIND_VIDEO_BY_ID = "SELECT video.video_id FROM video where video_id = ?;";
    private static final String DELETE_VIDEO = "DELETE FROM video WHERE video_id=?;";
    private static final String SELECT_CHANNEL_BY_ID = "";

    @Override
    public List<Video> findAll() {
        List<Video> videoList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_VIDEO_LIST);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Video video = new Video();
                video.setVideo_id(resultSet.getInt("video_id"));
                video.setVideo_name(resultSet.getString("video_name"));
                video.setVideo_link(resultSet.getString("video_link"));
                video.setStatus(resultSet.getBoolean("status"));
                video.setView(resultSet.getInt("view"));
                video.setImage(resultSet.getString("image"));
                video.setVideo_date(resultSet.getDate("video_date"));
                videoList.add(video);
            }
            return videoList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void save(Video video) {
        if (findById(video.getVideo_id()) == null) {
            try {
                connection.setAutoCommit(false);
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_VIDEO, Statement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, video.getVideo_name());
                preparedStatement.setString(2, video.getVideo_link());
                preparedStatement.setInt(3, video.getChannel().getChannel_id());
                preparedStatement.setString(4, video.getImage());
                preparedStatement.executeUpdate();
                int video_id = 0;
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                while (resultSet.next()) {
                    video_id = resultSet.getInt(1);
                }
                PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_VIDEO_CATEGORY);
                Category category = video.getCategory();
                int category_id = category.getId();
                preparedStatement1.setInt(1, video_id);
                preparedStatement1.setInt(2, category_id);
                preparedStatement1.executeUpdate();
                connection.commit();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_VIDEO);
                preparedStatement.setString(1, video.getVideo_name());
                preparedStatement.setString(2, video.getImage());
                preparedStatement.setBoolean(3, video.isStatus());
                preparedStatement.setInt(4, video.getVideo_id());
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public Video findById(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_VIDEO_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            int video_id = 0;
            while (resultSet.next()) {
                video_id = resultSet.getInt(1);
            }
            for (int i = 0; i < findAll().size(); i++) {
                if (findAll().get(i).getVideo_id() == video_id) {
                    return findAll().get(i);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public void deleteById(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_VIDEO);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Channel findChannelById(int id) {
        Channel channel = new Channel();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CHANNEL_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
