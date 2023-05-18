package rikkei.academy.service.HistoryService;

import rikkei.academy.model.History;
import rikkei.academy.model.User;
import rikkei.academy.model.Video;
import rikkei.academy.service.IGeneric;

import java.util.List;

public interface IHistoryService extends IGeneric<History> {
    int findHistoryByUserId(int user_id);
    void addVideo (int video_id, int user_id);
    void deleteVideo (User user);
    List<Video> findListVideoInHistory (int user_id);
}
