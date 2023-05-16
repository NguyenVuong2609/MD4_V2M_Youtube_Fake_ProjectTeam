package rikkei.academy.service.ChannelService;

import rikkei.academy.model.Channel;
import rikkei.academy.service.IGeneric;

public interface IChannelService extends IGeneric<Channel> {
    int findChannelByUserId(int id);
}
