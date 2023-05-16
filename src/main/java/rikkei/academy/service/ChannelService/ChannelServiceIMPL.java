package rikkei.academy.service.ChannelService;

import rikkei.academy.config.ConnectToMySQL;
import rikkei.academy.model.Channel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class ChannelServiceIMPL implements IChannelService{
    private Connection connection = ConnectToMySQL.getConnection();
    private final String INSERT_INTO_CHANNEL = "insert into channel (channel_name,avatar, user_id) values (?,?,?)";

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
            preparedStatement.setString(1,channel.getChannel_name());
            preparedStatement.setString(2,channel.getAvatar());
            preparedStatement.setInt(3,channel.getOwner().getUser_id());
            preparedStatement.executeUpdate();
            connection.commit();
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
