package org.datacenter.service.impl;

import org.datacenter.dao.UserDao;
import org.datacenter.entity.User;
import org.datacenter.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: xiaolong
 * @Date: Created in 下午2:06 18-10-7
 * @Desription:
 */
@Service
public class UserServiceImpl implements UserService {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserDao userDao;


    public User queryByName(String userName) {
        User user = userDao.queryByName(userName);
        return user;
    }

}
