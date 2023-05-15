package rikkei.academy.service.ChannelService;

import rikkei.academy.config.ConnectToMySQL;
import rikkei.academy.model.Channel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class ChannelServiceIMPL implements IChannelService{
    private Connection connection = ConnectToMySQL.getConnection();
    private final String INSERT_INTO_CHANNEL = "insert into channel (channel_name, status, user_id) values (?,?,?)";

    @Override
    public List<Channel> findAll() {
        return null;
    }

    @Override
    public void save(Channel channel) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_CHANNEL);
            preparedStatement.setString(1,channel.getChannel_name());
            preparedStatement.setBoolean(2,true);
            preparedStatement.setInt(3,channel.getOwner().getUser_id());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Channel findById(int id) {
        return null;
    }

    @Override
    public void deleteById(int id) {

    }
}
