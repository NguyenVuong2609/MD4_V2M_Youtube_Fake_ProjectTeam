package rikkei.academy.service.Playlist;

import rikkei.academy.config.ConnectToMySQL;
import rikkei.academy.model.Playlist;
import rikkei.academy.service.Service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlaylistServiceIMPL implements IPlaylist {
    private Connection connection = ConnectToMySQL.getConnection();
    private final String SELECT_ALL_PLAYLIST = "SELECT * FROM playlist;";
    private final String SELECT_PLAYLIST_BY_ID = "SELECT playlist.playlist_id FROM playlist WHERE playlist_id = ?;";
    private final String INSERT_INTO_PLAYLIST = "INSERT INTO playlist (playlist_name,user_id) VALUES (?, ?);";
    @Override
    public List<Playlist> findAll() {
        List<Playlist> allPlaylist = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PLAYLIST);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Playlist playlist = new Playlist();
                playlist.setPlaylist_id(resultSet.getInt("playlist_id"));
                playlist.setUser(Service.getInstance().getUserService().findById(resultSet.getInt("user_id")));
                playlist.setPlaylist_name(resultSet.getString("playlist_name"));
                playlist.setStatus(resultSet.getBoolean("status"));
                allPlaylist.add(playlist);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return allPlaylist;
    }

    @Override
    public void save(Playlist playlist) {
        if(findById(playlist.getPlaylist_id())==null){
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_PLAYLIST, Statement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, playlist.getPlaylist_name());
                preparedStatement.setInt(2,playlist.getUser().getUser_id());
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }


    }

    @Override
    public Playlist findById(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PLAYLIST_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            int playlist_id = 0;
            while (resultSet.next()){
                playlist_id = resultSet.getInt(1);
            }
            for (int i = 0; i < findAll().size(); i++) {
                if(findAll().get(i).getPlaylist_id() == playlist_id){
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

    }
}
