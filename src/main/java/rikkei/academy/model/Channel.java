package rikkei.academy.model;

import java.util.List;

public class Channel {
    private int channel_id;
    private String channel_name;
    private User owner;
    private List<User> followerList;
    private List<Video> videoList;
    private boolean status = true;
    private String avatar = "https://firebasestorage.googleapis.com/v0/b/vuongcuti-6ce58.appspot.com/o/images.png?alt=media&token=568b3bcc-c852-4669-9cd3-d4684ce4ad70";

    public Channel() {
    }

    public Channel(int channel_id, String channel_name, User owner, List<User> followerList, List<Video> videoList, boolean status, String avatar) {
        this.channel_id = channel_id;
        this.channel_name = channel_name;
        this.owner = owner;
        this.followerList = followerList;
        this.videoList = videoList;
        this.status = status;
        this.avatar = avatar;
    }

    public Channel(String name, String avatar, User user) {
        this.channel_name = name;
        this.avatar = avatar;
        this.owner = user;
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

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public List<User> getFollowerList() {
        return followerList;
    }

    public void setFollowerList(List<User> followerList) {
        this.followerList = followerList;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
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
