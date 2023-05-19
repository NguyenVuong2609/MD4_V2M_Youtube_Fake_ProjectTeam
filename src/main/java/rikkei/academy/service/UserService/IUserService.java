package rikkei.academy.service.UserService;

import rikkei.academy.model.Channel;
import rikkei.academy.model.Role;
import rikkei.academy.model.User;
import rikkei.academy.service.IGeneric;

import java.util.Set;

public interface IUserService extends IGeneric<User> {
    boolean existedByUsername(String username);
    boolean existedByEmail(String email);
    User userLogin(String username, String password);
    Set<Role> findRoleByUserId(int user_id);
    void updateAvatar(String avatar, int id);
    Channel findChannelByUserId(int user_id);
}
