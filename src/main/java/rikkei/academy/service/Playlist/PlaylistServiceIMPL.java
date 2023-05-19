package rikkei.academy.service.Playlist;

import rikkei.academy.config.ConnectToMySQL;
import rikkei.academy.model.Playlist;
import rikkei.academy.model.Video;
import rikkei.academy.service.Service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlaylistServiceIMPL implements IPlaylist {
    private Connection connection = ConnectToMySQL.getConnection();
    private final String SELECT_ALL_PLAYLIST = "SELECT * FROM playlist;";
    private final String SELECT_PLAYLIST_BY_ID = "SELECT playlist.playlist_id FROM playlist WHERE playlist_id = ?;";
    private final String INSERT_INTO_PLAYLIST = "INSERT INTO playlist (playlist_name,user_id) VALUES (?, ?);";
    private final String INSERT_INTO_VIDEO_PLAYLIST_CONNECTION = "INSERT INTO video_playlist_connection VALUES (?,?);";
    private final String UPDATE_PLAYLIST = "UPDATE playlist SET playlist_name = ? AND status = ? WHERE playlist_id = ?;";
    private final String SELECT_VIDEO_INCLUDED_IN_PLAYLIST = "select p.playlist_id, playlist_name from playlist p " +
            "join user u on u.user_id = p.user_id " +
            "join video_playlist_connection vpc on p.playlist_id = vpc.playlist_id where video_id = ? and p.user_id = ?;";
    private final String SELECT_VIDEO_NOT_INCLUDED_IN_PLAYLIST = "select distinct p.playlist_id, playlist_name from playlist p join user u on u.user_id = p.user_id join video_playlist_connection vpc on p.playlist_id = vpc.playlist_id where not exists(select 1 from video_playlist_connection vpc where vpc.playlist_id = p.playlist_id and vpc.video_id = ?) and p.user_id = ?;";
    private final String DELETE_FROM_VIDEO_PLAYLIST_CONNECTION = "DELETE FROM video_playlist_connection WHERE video_id = ? and playlist_id = ?;";
    private final String SHOW_LIST_PLAYLIST = "SELECT playlist_id FROM playlist WHERE user_id = ?;";
    private final String SHOW_VIDEO_IN_PLAYLIST = "select video_id from video_playlist_connection where playlist_id = ?;";

    @Override
    public List<Playlist> findAll() {
        List<Playlist> allPlaylist = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PLAYLIST);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
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
        if (findById(playlist.getPlaylist_id()) == null) {
            try {
                connection.setAutoCommit(false);
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_PLAYLIST, Statement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, playlist.getPlaylist_name());
                preparedStatement.setInt(2, playlist.getUser().getUser_id());
                preparedStatement.executeUpdate();
                connection.commit();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PLAYLIST);
                preparedStatement.setString(1, playlist.getPlaylist_name());
                preparedStatement.setBoolean(2, playlist.isStatus());
                preparedStatement.setInt(3, playlist.getPlaylist_id());
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
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            int playlist_id = 0;
            while (resultSet.next()) {
                playlist_id = resultSet.getInt(1);
            }
            for (int i = 0; i < findAll().size(); i++) {
                if (findAll().get(i).getPlaylist_id() == playlist_id) {
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

    @Override
    public void insertVideoList(Playlist playlist) {
        try {
            int playlistID = playlist.getPlaylist_id();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_VIDEO_PLAYLIST_CONNECTION);
            List<Video> videoList = playlist.getVideoList();
            List<Integer> videoIDList = new ArrayList<>();
            for (int i = 0; i < videoList.size(); i++) {
                videoIDList.add(videoList.get(i).getVideo_id());
            }
            for (int i = 0; i < videoIDList.size(); i++) {
                preparedStatement.setInt(1, videoIDList.get(i));
                preparedStatement.setInt(2, playlistID);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public List<Playlist> showListHavingVideo(int video_id, int user_id) {
        List<Playlist> listPlaylist = new ArrayList<>();
        Playlist playlist;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_VIDEO_INCLUDED_IN_PLAYLIST);
            preparedStatement.setInt(1, video_id);
            preparedStatement.setInt(2, user_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                playlist = new Playlist();
                playlist.setPlaylist_id(resultSet.getInt(1));
                playlist.setPlaylist_name(resultSet.getString(2));
                listPlaylist.add(playlist);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listPlaylist;
    }

    @Override
    public List<Playlist> showListNotHavingVideo(int video_id, int user_id) {
        List<Playlist> listPlaylist = new ArrayList<>();
        Playlist playlist;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_VIDEO_NOT_INCLUDED_IN_PLAYLIST);
            preparedStatement.setInt(1,video_id);
            preparedStatement.setInt(2,user_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                playlist = new Playlist();
                playlist.setPlaylist_id(resultSet.getInt(1));
                playlist.setPlaylist_name(resultSet.getString(2));
                listPlaylist.add(playlist);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listPlaylist;
    }

    @Override
    public void deleteVideoFromPlaylist(int video_int, int playlist_int) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FROM_VIDEO_PLAYLIST_CONNECTION);
            preparedStatement.setInt(1,video_int);
            preparedStatement.setInt(2,playlist_int);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Playlist> showPlaylist(int user_id) {
        List<Playlist> listPlaylist = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SHOW_LIST_PLAYLIST);
            preparedStatement.setInt(1, user_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                listPlaylist.add(findById(resultSet.getInt(1)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listPlaylist;
    }

    @Override
    public List<Video> showListVideoInPlaylist(int playlist_id) {
        List<Video> videoList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SHOW_VIDEO_IN_PLAYLIST);
            preparedStatement.setInt(1,playlist_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                videoList.add(Service.getInstance().getVideoService().findById(resultSet.getInt(1)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return videoList;
    }

    ;
}
