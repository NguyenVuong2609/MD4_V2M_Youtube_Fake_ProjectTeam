package rikkei.academy.model;

import java.util.List;

public class Playlist {
    private int playlist_id;
    private String playlist_name;
    private boolean status;
    private List<Video> videoList;
    private User user;

    public Playlist() {
    }

    public Playlist(int playlist_id, String playlist_name, boolean status, List<Video> videoList, User user) {
        this.playlist_id = playlist_id;
        this.playlist_name = playlist_name;
        this.status = status;
        this.videoList = videoList;
        this.user = user;
    }

    public Playlist(String playlistName, User user) {
        this.playlist_name = playlistName;
        this.user = user;
    }


    public int getPlaylist_id() {
        return playlist_id;
    }

    public void setPlaylist_id(int playlist_id) {
        this.playlist_id = playlist_id;
    }

    public String getPlaylist_name() {
        return playlist_name;
    }

    public void setPlaylist_name(String playlist_name) {
        this.playlist_name = playlist_name;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public List<Video> getVideoList() {
        return videoList;
    }

    public void setVideoList(List<Video> videoList) {
        this.videoList = videoList;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Playlist{" +
                "playlist_id=" + playlist_id +
                ", playlist_name='" + playlist_name + '\'' +
                ", status=" + status +
                '}';
    }
}
