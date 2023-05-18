package rikkei.academy.service.VideoService;

import rikkei.academy.model.Channel;
import rikkei.academy.model.Video;
import rikkei.academy.service.IGeneric;

import java.util.List;

public interface IVideoService extends IGeneric<Video> {
    Channel findChannelById(int id);
    void updateViewById(int id);
    List<Video> findListRelatedVideoByCategoryId(int category_id, int video_id);
    int getNoOfRecords();
    List<Video> findAll(int start, int elementOfPage);
    List<Video> showTrendingList ();
    List<Video> searchForVideo(String searchContent);
}
