package rikkei.academy.model;

import java.util.List;

public class Video {
    private int video_id;
    private String video_name;
    private String video_link;
    private String video_date;
    private int view = 0;
    private boolean status;
    private Channel channel;
    private List<Comment> commentList;
    private List<Like> likeList;

    public Video() {
    }

    public Video(int video_id, String video_name, String video_link, String video_date, int view, boolean status, Channel channel, List<Comment> commentList, List<Like> likeList) {
        this.video_id = video_id;
        this.video_name = video_name;
        this.video_link = video_link;
        this.video_date = video_date;
        this.view = view;
        this.status = status;
        this.channel = channel;
        this.commentList = commentList;
        this.likeList = likeList;
    }

    public int getVideo_id() {
        return video_id;
    }

    public void setVideo_id(int video_id) {
        this.video_id = video_id;
    }

    public String getVideo_name() {
        return video_name;
    }

    public void setVideo_name(String video_name) {
        this.video_name = video_name;
    }

    public String getVideo_link() {
        return video_link;
    }

    public void setVideo_link(String video_link) {
        this.video_link = video_link;
    }

    public String getVideo_date() {
        return video_date;
    }

    public void setVideo_date(String video_date) {
        this.video_date = video_date;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Channel getChannel() {
        return channel;
    }

    public void setChannel(Channel channel) {
        this.channel = channel;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public List<Like> getLikeList() {
        return likeList;
    }

    public void setLikeList(List<Like> likeList) {
        this.likeList = likeList;
    }

    @Override
    public String toString() {
        return "Video{" +
                "video_id=" + video_id +
                ", video_name='" + video_name + '\'' +
                ", status=" + status +
                '}';
    }
}
