package rikkei.academy.service.Playlist;

import rikkei.academy.model.Playlist;
import rikkei.academy.model.Video;
import rikkei.academy.service.IGeneric;

import java.util.List;

public interface IPlaylist extends IGeneric<Playlist> {
    void insertVideoList (Playlist playlist);
    List<Playlist> showListHavingVideo (int video_id, int user_id);
    List<Playlist> showListNotHavingVideo (int video_id, int user_id);
    void deleteVideoFromPlaylist (int video_int, int playlist_int);
    List<Playlist> showPlaylist (int user_id);
    List<Video> showListVideoInPlaylist (int playlist_id);
}
