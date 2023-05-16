package rikkei.academy.service;

import rikkei.academy.service.RoleService.IRoleService;
import rikkei.academy.service.RoleService.RoleServiceIMPL;
import rikkei.academy.service.UserService.IUserService;
import rikkei.academy.service.UserService.UserServiceIMPL;
import rikkei.academy.service.VideoService.IVideoService;
import rikkei.academy.service.VideoService.VideoServiceIMPL;

public class Service {
    private static Service instance;
    private static final IRoleService roleService = new RoleServiceIMPL();
    private static final IUserService userService = new UserServiceIMPL();
    private static final IVideoService videoService = new VideoServiceIMPL();

    public IRoleService getRoleService() {
        return roleService;
    }
    public IUserService getUserService() {
        return userService;
    }
    public IVideoService getVideoService(){return videoService;}

    public static synchronized Service getInstance() {
        if (instance == null) instance = new Service();
        return instance;
    }
}
