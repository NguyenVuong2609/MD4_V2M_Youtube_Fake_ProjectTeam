package rikkei.academy.model;

public class Like {
    private int like_id;
    private int like_amount = 0;
    private User user;
    private Video video;

    public Like() {
    }

    public Like(int like_id, User user, Video video) {
        this.like_id = like_id;
        this.user = user;
        this.video = video;
    }

    public Like(User user, Video video) {
        this.user = user;
        this.video = video;
    }


    public int getLike_id() {
        return like_id;
    }

    public void setLike_id(int like_id) {
        this.like_id = like_id;
    }

    public int getLike_amount() {
        return like_amount;
    }

    public void setLike_amount(int like_amount) {
        this.like_amount = like_amount;
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

    @Override
    public String toString() {
        return "Like{" +
                "like_id=" + like_id +
                '}';
    }
}
