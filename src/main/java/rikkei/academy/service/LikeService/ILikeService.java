package rikkei.academy.service.LikeService;

import rikkei.academy.model.Like;

public interface ILikeService {
    void save(Like like);
    void deleteByVideoIdAndUserId(int video_id, int user_id);
    boolean checkLike(int video_id, int user_id);
    int countLikeByVideoId(int video_id);
}
