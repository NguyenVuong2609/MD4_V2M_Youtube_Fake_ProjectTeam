package rikkei.academy.model;

import java.util.Date;

public class Comment {
    private int comment_id;
    private String comment_content;
    private User user;
    private Video video;
    private Date date;

    public Comment() {
    }

    public Comment(int comment_id, String comment_content, User user, Video video, Date date) {
        this.comment_id = comment_id;
        this.comment_content = comment_content;
        this.user = user;
        this.video = video;
        this.date = date;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "comment_id=" + comment_id +
                ", comment_content='" + comment_content + '\'' +
                '}';
    }
}
