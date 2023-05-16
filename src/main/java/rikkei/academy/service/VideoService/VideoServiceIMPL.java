package rikkei.academy.service.VideoService;

import rikkei.academy.config.ConnectToMySQL;
import rikkei.academy.model.Category;
import rikkei.academy.model.Video;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VideoServiceIMPL implements IVideoService {
    private Connection connection = ConnectToMySQL.getConnection();
    private static final String SELECT_VIDEO_LIST = "SELECT * FROM video;";
    private static final String INSERT_INTO_VIDEO = "INSERT INTO video (video_name, video_link,channel_id,image) VALUES (?,?,?,?);";
    private static final String UPDATE_VIDEO = "UPDATE video SET video_name = ? AND image = ? WHERE video_id=?;";
    private static final String INSERT_VIDEO_CATEGORY = "INSERT INTO video_category_connection VALUES (?,?);";
    private static final String FIND_VIDEO_BY_ID = "SELECT video.video_id FROM video where video_id = ?;";
    private static final String DELETE_VIDEO = "DELETE FROM video WHERE video_id=?;";

    @Override
    public List<Video> findAll() {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_VIDEO_LIST);
            ResultSet resultSet = preparedStatement.executeQuery();
            return (List<Video>) resultSet;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void save(Video video) {
        if (findById(video.getVideo_id()) == null) {
            try {
                connection.setAutoCommit(false);
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_VIDEO);
                preparedStatement.setString(1, video.getVideo_name());
                preparedStatement.setString(2, video.getVideo_link());
                preparedStatement.setInt(3, video.getChannel().getChannel_id());
                preparedStatement.setString(4, video.getImage());
                preparedStatement.executeUpdate();
                int video_id = 0;
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                while (resultSet.next()){
                    video_id = resultSet.getInt(1);
                }
                PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_VIDEO_CATEGORY);
                List<Category> categoryList = new ArrayList<>();
                List<Integer> listCategoryID  = new ArrayList<>();
                for (int i = 0; i < categoryList.size(); i++) {
                    listCategoryID.add(categoryList.get(i).getId());
                }
                for (int i = 0; i < listCategoryID.size(); i++) {
                    preparedStatement1.setInt(1,video_id);
                    preparedStatement1.setInt(2,listCategoryID.get(i));
                    preparedStatement1.executeUpdate();
                }
                connection.commit();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_VIDEO);
                preparedStatement.setString(1, video.getVideo_name());
                preparedStatement.setString(2, video.getImage());
                preparedStatement.setInt(3, video.getVideo_id());
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
}