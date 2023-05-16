package rikkei.academy.service;

import rikkei.academy.service.ChannelService.ChannelServiceIMPL;
import rikkei.academy.service.ChannelService.IChannelService;
import rikkei.academy.service.RoleService.IRoleService;
import rikkei.academy.service.RoleService.RoleServiceIMPL;
import rikkei.academy.service.UserService.IUserService;
import rikkei.academy.service.UserService.UserServiceIMPL;

public class Service {
    private static Service instance;
    private static final IRoleService roleService = new RoleServiceIMPL();
    private static final IUserService userService = new UserServiceIMPL();
    private static final IChannelService channelService = new ChannelServiceIMPL();

    public IRoleService getRoleService() {
        return roleService;
    }

    public IUserService getUserService() {
        return userService;
    }

    public IChannelService getChannelService() {
        return channelService;
    }


    public static synchronized Service getInstance() {
        if (instance == null) instance = new Service();
        return instance;
    }
}
