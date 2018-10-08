package org.datacenter.service;

import org.datacenter.entity.User;

/**
 * @Author: xiaolong
 * @Date: Created in 下午2:01 18-10-7
 * @Desription:
 */

public interface UserService {

    User queryByName(String userName);
}
