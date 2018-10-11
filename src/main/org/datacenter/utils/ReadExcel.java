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
            int columnCount = row.getPhysicalNumberOfCells();
            for(int j = 0;j < columnCount;j ++) {
                String temp = row.getCell(j).getStringCellValue();
                if(i == 1) {
                    logger.info("device Cell = {}",temp);
                }
            }
            deviceList.add(device);
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
        Workbook workbook = new HSSFWorkbook(inputStream);
        Sheet sheet = workbook.getSheetAt(0);
        return sheet;
    }
}
