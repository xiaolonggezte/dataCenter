package org.datacenter.dao;

import org.datacenter.entity.User;
import org.apache.ibatis.annotations.Param;

/**
 * @Author: xiaolong
 * @Date: Created in 下午12:59 18-10-7
 * @Desription:
 */
public interface UserDao {

    User queryById(@Param("userId") int userId);
}
