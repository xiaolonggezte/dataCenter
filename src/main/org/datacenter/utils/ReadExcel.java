package org.datacenter.utils;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.datacenter.entity.Course;
import org.datacenter.entity.Device;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: xiaolong
 * @Date: Created in 下午1:41 18-10-10
 * @Desription:
 */
@Component
public class ReadExcel {
    Logger logger = LoggerFactory.getLogger(this.getClass());


    public List<Device> getDeviceList(MultipartFile mfile) {
        Sheet sheet;
        try {
            sheet = getSheet(mfile);
        } catch (Exception e) {
            return null;
        }
        int rowCount = sheet.getPhysicalNumberOfRows();
        List<Device> deviceList = new ArrayList<Device>();
        Device device;
        for(int i = 1;i < rowCount;i ++) {
            Row row = sheet.getRow(i);
            device = new Device();
            if(row.getCell(0) != null) {
                device.setDeviceNumber(row.getCell(0).getStringCellValue() );
                logger.info("device.deviceNumber={}",device.getDeviceNumber());
            }
            if(row.getCell(1) != null) {
                device.setDeviceNumber(row.getCell(1).getStringCellValue());
            }
            if(row.getCell(2) != null) {
                device.setDeviceUnitName(row.getCell(2).getStringCellValue());
            }
            if(row.getCell(3) != null) {
                device.setDeviceNumber(row.getCell(3).getStringCellValue());
            }
            if(row.getCell(4) != null) {
                device.setDeviceName(row.getCell(4).getStringCellValue());
            }
            if(row.getCell(5) != null) {
                device.setDeviceVersion(row.getCell(5).getStringCellValue());
            }
            if(row.getCell(6) != null) {
                device.setDevicePrice((float) row.getCell(6).getNumericCellValue());
            }
            if(row.getCell(7) != null) {
                device.setDeviceMenufactor(row.getCell(7).getStringCellValue());
            }
            if(row.getCell(8) != null) {
                device.setDeviceDate(row.getCell(8).getStringCellValue());
            }
            if(row.getCell(9) != null) {
                device.setDeviceGetter(row.getCell(9).getStringCellValue());
            }
            if(row.getCell(10) != null) {
                device.setDeviceSubject(row.getCell(10).getStringCellValue());
            }
            if(row.getCell(11) != null) {
                device.setDeviceUseDeriction(row.getCell(11).getStringCellValue());
            }
            if(row.getCell(12) != null) {
                device.setDeviceRoom(row.getCell(12).getStringCellValue());
            }
            if(row.getCell(13) != null) {
                device.setDeviceHander(row.getCell(13).getStringCellValue());
            }
            if(row.getCell(14) != null) {
                device.setDeviceStatus(row.getCell(14).getStringCellValue());
            }
            if(row.getCell(15) != null) {
                device.setIsUsed(row.getCell(15).getStringCellValue());
            }

            deviceList.add(device);
            if(i == 1) {
                logger.info("one device = {}",device);
            }
        }
        return deviceList;

    }

    public List<Course> getCourseList(MultipartFile mfile) {
        Sheet sheet;
        try {
            sheet = getSheet(mfile);
        } catch (Exception e) {
            return null;
        }

        int rowCount = sheet.getPhysicalNumberOfRows();
        List<Course> deviceList = new ArrayList<Course>();
        Course course;
        for(int i = 1;i < rowCount;i ++) {
            Row row = sheet.getRow(i);
            course = new Course();
            int columnCount = row.getPhysicalNumberOfCells();
            for(int j = 0;j < columnCount;j ++) {
                String temp = row.getCell(j).getStringCellValue();
                if(i == 1) {
                    logger.info("Course Cell = {}",temp);
                }
            }
            deviceList.add(course);
        }

        return deviceList;
    }
    public Sheet getSheet(MultipartFile Mfile) throws Exception {
        CommonsMultipartFile commonsMultipartFile = (CommonsMultipartFile)Mfile;
        DiskFileItem fileItem = (DiskFileItem) commonsMultipartFile.getFileItem();
        InputStream inputStream = fileItem.getInputStream();
//         jxl提供的Workbook类
        WorkbookSettings workbookSettings = new WorkbookSettings();
//            可以设置为UTF-8或者GBK或者ISO-8859-1
        workbookSettings.setEncoding("GBK");
        Workbook workbook = new HSSFWorkbook(inputStream);
        Sheet sheet = workbook.getSheetAt(0);
        return sheet;
    }
}
