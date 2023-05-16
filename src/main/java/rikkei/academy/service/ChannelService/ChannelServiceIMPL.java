package rikkei.academy.service.ChannelService;

import rikkei.academy.config.ConnectToMySQL;
import rikkei.academy.model.Channel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ChannelServiceIMPL implements IChannelService {
    private Connection connection = ConnectToMySQL.getConnection();
    private final String INSERT_INTO_CHANNEL = "insert into channel (channel_name,avatar, user_id) values (?,?,?)";
    private final String SELECT_CHANNEL_BY_USER_ID = "select channel_id from channel where user_id = ?";
    private final String SELECT_CHANNEL_BY_ID = "select * from channel where channel_id = ?";

    @Override
    public List<Channel> findAll() {
        return null;
    }

    @Override
    public void save(Channel channel) {
        try {
            connection.setAutoCommit(false);
            System.out.println(channel);
            System.out.println(channel.getAvatar());
            System.out.println(channel.getOwner());
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_CHANNEL);
            preparedStatement.setString(1, channel.getChannel_name());
            preparedStatement.setString(2, channel.getAvatar());
            preparedStatement.setInt(3, channel.getOwner().getUser_id());
            preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Channel findById(int id) {
        Channel channel = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CHANNEL_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                channel = new Channel();
                channel.setChannel_id(resultSet.getInt(1));
                channel.setChannel_name(resultSet.getString(2));
                channel.setAvatar(resultSet.getString(5));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return channel;
    }

    @Override
    public void deleteById(int id) {

    }

    @Override
    public int findChannelByUserId(int id) {
        int channel_id = -1;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CHANNEL_BY_USER_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeQuery();
            ResultSet resultSet = preparedStatement.getResultSet();
            while (resultSet.next()) {
                channel_id = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return channel_id;
    }
}
