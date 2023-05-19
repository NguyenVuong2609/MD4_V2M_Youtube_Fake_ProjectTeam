package rikkei.academy.service.ChannelService;

import rikkei.academy.model.Channel;
import rikkei.academy.model.User;
import rikkei.academy.service.IGeneric;

import java.util.List;

public interface IChannelService extends IGeneric<Channel> {
    int findChannelByUserId(int id);
    void addSubscriber (int channel_id, int user_id);
    void unSubscribe (int channel_id, int user_id);
    boolean checkSubscribe(int channel_id, int user_id);
    int countFollower(int channel_id);
    List<User> findSubscriberByChannelId(int channel_id);
}
