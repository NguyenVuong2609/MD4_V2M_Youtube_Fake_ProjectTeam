package rikkei.academy.service.RoleService;

import rikkei.academy.model.Role;
import rikkei.academy.model.RoleName;

public interface IRoleService {
    Role findByName(RoleName name);
}
