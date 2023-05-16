package rikkei.academy.model;

import java.util.List;

public class Video {
    private int video_id;
    private String video_name;
    private String video_link;
    private String video_date;
    private int view = 0;
    private String image;
    private boolean status;
    private Channel channel;
    private Category category;
    private List<Comment> commentList;
    private List<Like> likeList;

    public Video() {
    }

    public Video(int video_id, String video_name, String video_link, String video_date, int view, String image, boolean status, Channel channel, Category category, List<Comment> commentList, List<Like> likeList) {
        this.video_id = video_id;
        this.video_name = video_name;
        this.video_link = video_link;
        this.video_date = video_date;
        this.view = view;
        this.image = image;
        this.status = status;
        this.channel = channel;
        this.category = category;
        this.commentList = commentList;
        this.likeList = likeList;
    }

    public Video(String videoName, String videoLink, String videoAvatar, Channel channel, Category category) {
        this.video_name = videoName;
        this.video_link = videoLink;
        this.image = videoAvatar;
        this.channel = channel;
        this.category = category;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
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
