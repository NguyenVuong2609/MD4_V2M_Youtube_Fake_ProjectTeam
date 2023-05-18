package rikkei.academy.model;

import java.util.List;

public class History {
    private int history_id;
    private List<Video> videoList;

    public History(int history_id, List<Video> videoList) {
        this.history_id = history_id;
        this.videoList = videoList;
    }

    public History() {
    }

    public int getHistory_id() {
        return history_id;
    }

    public void setHistory_id(int history_id) {
        this.history_id = history_id;
    }

    public List<Video> getVideoList() {
        return videoList;
    }

    public void setVideoList(List<Video> videoList) {
        this.videoList = videoList;
    }
}
