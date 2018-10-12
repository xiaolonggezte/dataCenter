package org.datacenter.dao;

import org.apache.ibatis.annotations.Param;
import org.datacenter.entity.Device;

import java.util.List;

/**
 * @Author: xiaolong
 * @Date: Created in 下午4:44 18-10-9
 * @Desription:
 */
public interface DeviceDao {
    List<Device> queryAll(@Param("offset") int offset,@Param("limit") int limit, @Param("deviceNumber") int deviceNumber);
    void insertOne(@Param("one") Device device);
    void updateOne(@Param("one") Device device);
    void deleteOne(@Param("one") Device device);
}
