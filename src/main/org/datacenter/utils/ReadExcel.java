package org.datacenter.utils;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
            e.printStackTrace();
            logger.info("文件解释失败");
            return null;
        }
        int rowCount = sheet.getPhysicalNumberOfRows();
        List<Device> deviceList = new ArrayList<Device>();
        Device device;
        for(int i = 1;i < rowCount;i ++) {
            Row row = sheet.getRow(i);
            device = new Device();
            if(row.getCell(2) != null) {
                device.setDeviceNumber(tranform(row.getCell(2).getStringCellValue() ));
            }
            if(row.getCell(0) != null) {
                device.setDeviceUnitId(tranform(row.getCell(0).getStringCellValue()) );
            }
            if(row.getCell(1) != null) {
                device.setDeviceUnitName(tranform(row.getCell(1).getStringCellValue()) );
            }
            if(row.getCell(3) != null) {
                device.setDeviceCategoryNumber(tranform(row.getCell(3).getStringCellValue()) );
            }
            if(row.getCell(4) != null) {
                device.setDeviceName(tranform(row.getCell(4).getStringCellValue()) );
            }
            if(row.getCell(5) != null) {
                device.setDeviceVersion(tranform(row.getCell(5).getStringCellValue()));
            }
            if(row.getCell(6) != null) {
                device.setDevicePrice((float) row.getCell(6).getNumericCellValue());
            }
            if(row.getCell(7) != null) {
                device.setDeviceMenufactor(tranform(row.getCell(7).getStringCellValue()));
            }
            if(row.getCell(8) != null) {
                device.setDeviceDate(tranform(row.getCell(8).getStringCellValue()));
            }
            if(row.getCell(9) != null) {
                device.setDeviceGetter(tranform(row.getCell(9).getStringCellValue()));
            }
            if(row.getCell(10) != null) {
                device.setDeviceSubject(tranform(row.getCell(10).getStringCellValue()));
            }
            if(row.getCell(11) != null) {
                device.setDeviceUseDeriction(tranform(row.getCell(11).getStringCellValue()));
            }
            if(row.getCell(12) != null) {
                device.setDeviceRoom(tranform(row.getCell(12).getStringCellValue()));
            }
            if(row.getCell(13) != null) {
                device.setDeviceHander(tranform(row.getCell(13).getStringCellValue()));
            }

            deviceList.add(device);
            if(i <= 3) {
                logger.info("one device = {}",device);
            }
        }
        return deviceList;

    }

    public List<Course> getCourseList(MultipartFile mfile) {
        Sheet sheet = null;
        try {
            sheet = getSheet(mfile);
        } catch (Exception e) {
            logger.info("文件解析失败");
            e.printStackTrace();
        }

        int rowCount = sheet.getPhysicalNumberOfRows();
        List<Course> deviceList = new ArrayList<Course>();
        Course course;
        for(int i = 1;i < rowCount;i ++) {
            Row row = sheet.getRow(i);
            course = new Course();
            if(row.getCell(0) != null) {

            }
            deviceList.add(course);
        }
        return deviceList;
    }
    public Sheet getSheet(MultipartFile Mfile) throws Exception {
        CommonsMultipartFile commonsMultipartFile = (CommonsMultipartFile)Mfile;
        DiskFileItem fileItem = (DiskFileItem) commonsMultipartFile.getFileItem();
        InputStream inputStream = fileItem.getInputStream();
        Workbook workbook = null;
        Sheet sheet = null;
        try {
            workbook = new HSSFWorkbook(inputStream);//excel 2003
            sheet = workbook.getSheetAt(0);
        } catch (Exception e) {
            try {
                workbook = new XSSFWorkbook(inputStream);// excel 2007
                sheet = workbook.getSheetAt(0);
            } catch (Exception ee) {
                ee.printStackTrace();
            }

        }
        return sheet;
    }

    public String tranform(String oldString) {
//        String newName = null;
//        try {
//            newName = new String(oldString.getBytes("ISO-8859-1"),"GBK");
//            logger.info("oldString={},newString={}",oldString,newName);
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        return oldString;
    }
}
