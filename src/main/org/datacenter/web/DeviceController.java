package org.datacenter.web;

import org.datacenter.dto.LoadResponse;
import org.datacenter.entity.Device;
import org.datacenter.service.DeviceService;
import org.datacenter.utils.ReadExcel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @Author: xiaolong
 * @Date: Created in 下午6:03 18-10-7
 * @Desription:
 */
@Controller
public class DeviceController {

    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private DeviceService deviceService;
    @Autowired
    private ReadExcel readExcel;

    @RequestMapping("/data/device")
    public @ResponseBody List<Device> queryAll(@RequestParam("page") int page, @RequestParam("limit") int limit,
                                               @RequestParam(value = "deviceNumber", required = false, defaultValue = "-1") int deviceNumber) {
        logger.info("offset={},limit={}, deviceNumer={}",page,limit,deviceNumber);
        int offset = (page - 1) * limit;
        return deviceService.queryAll(offset, limit, deviceNumber);
    }
    @RequestMapping(value = "/device/upload",method = RequestMethod.POST)
    @ResponseBody
    public LoadResponse deviceUpload(@RequestParam("file") MultipartFile file) {
        logger.info("start upload device_file");
        if(file==null) return new LoadResponse(404,"error");
        //获取文件名
        String name=file.getOriginalFilename();
        //进一步判断文件是否为空（即判断其大小是否为0或其名称是否为null）
        long size=file.getSize();
        if(name==null || ("").equals(name) && size==0) return new LoadResponse(404,"error");

        List<Device> deviceList = readExcel.getDeviceList(file);
        logger.info("deviceList.size() = {}",deviceList == null ?  0 : deviceList.size());
        List<Device> remainDeviceList = deviceList == null ? null : deviceService.deviceListInsert(deviceList);
        logger.info("remainDeviceList.size() = {}",remainDeviceList == null ? 0 : remainDeviceList.size());
        return new LoadResponse(0,"success");
    }

}
