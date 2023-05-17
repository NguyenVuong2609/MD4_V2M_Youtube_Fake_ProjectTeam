package rikkei.academy.service.VideoService;

import rikkei.academy.model.Channel;
import rikkei.academy.model.Video;
import rikkei.academy.service.IGeneric;

public interface IVideoService extends IGeneric<Video> {
    Channel findChannelById(int id);
}
