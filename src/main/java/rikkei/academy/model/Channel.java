package rikkei.academy.model;

import java.util.List;

public class Channel {
    private int channel_id;
    private String channel_name;
    private User owner;
    private List<User> followerList;
    private List<Video> videoList;
    private boolean status;

    public Channel() {
    }

    public Channel(int channel_id, String channel_name, User owner, List<User> followerList, List<Video> videoList, boolean status) {
        this.channel_id = channel_id;
        this.channel_name = channel_name;
        this.owner = owner;
        this.followerList = followerList;
        this.videoList = videoList;
        this.status = status;
    }

    public int getChannel_id() {
        return channel_id;
    }

    public void setChannel_id(int channel_id) {
        this.channel_id = channel_id;
    }

    public String getChannel_name() {
        return channel_name;
    }

    public void setChannel_name(String channel_name) {
        this.channel_name = channel_name;
    }

    public User getOwner() {
        return owner;
    }

    public void setUser(User user) {
        this.owner = user;
    }

    public List<Video> getVideoList() {
        return videoList;
    }

    public void setVideoList(List<Video> videoList) {
        this.videoList = videoList;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Channel{" +
                "channel_id=" + channel_id +
                ", channel_name='" + channel_name + '\'' +
                ", status=" + status +
                '}';
    }
}
