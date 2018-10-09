package org.datacenter.dao;

import org.apache.ibatis.annotations.Param;
import org.datacenter.entity.User;

/**
 * @Author: xiaolong
 * @Date: Created in 下午12:59 18-10-7
 * @Desription:
 */
public interface UserDao {

    User queryById(@Param("userId") int userId);
    User queryByName(@Param("userName") String userName);

    User queryByNamePassword(@Param("userName") String userName, @Param("password") String password);
}
