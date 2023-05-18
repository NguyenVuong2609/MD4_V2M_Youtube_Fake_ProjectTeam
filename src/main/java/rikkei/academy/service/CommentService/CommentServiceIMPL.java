package rikkei.academy.service.CommentService;

import rikkei.academy.config.ConnectToMySQL;
import rikkei.academy.model.Comment;
import rikkei.academy.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentServiceIMPL implements ICommentService{
    private final Connection connection = ConnectToMySQL.getConnection();
    private final String INSERT_INTO_COMMENT = "insert into comment (comment_content, user_id, video_id) values (?,?,?)";
    private final String DELETE_COMMENT_BY_ID = "delete from comment where comment_id = ?";
    private final String FIND_LIST_COMMENT_BY_VIDEO_ID = "select c.comment_id, c.comment_content, u.user_id, u.name, u.avatar, c.comment_date from comment c join user u on c.user_id = u.user_id\n where c.video_id = ? order by c.comment_date DESC;";

    @Override
    public void save(Comment comment) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_COMMENT);
            preparedStatement.setString(1,comment.getComment_content());
            preparedStatement.setInt(2,comment.getUser().getUser_id());
            preparedStatement.setInt(3,comment.getVideo().getVideo_id());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteById(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_COMMENT_BY_ID);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Comment> findListCommentByVideoId(int id) {
        Comment comment;
        User user;
        List<Comment> commentList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_LIST_COMMENT_BY_VIDEO_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                comment = new Comment();
                user = new User();
                comment.setComment_id(resultSet.getInt(1));
                comment.setComment_content(resultSet.getString(2));
                user.setUser_id(resultSet.getInt(3));
                user.setName(resultSet.getString(4));
                user.setAvatar(resultSet.getString(5));
                comment.setDate(resultSet.getDate(6));
                comment.setUser(user);
                commentList.add(comment);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return commentList;
    }
}
