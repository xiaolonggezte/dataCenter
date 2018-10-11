package test.java.dao;

import org.junit.Test;

import java.io.File;
import java.io.FileWriter;

/**
 * @Author: xiaolong
 * @Date: Created in 下午3:23 18-10-11
 * @Desription:
 */
public class ContentWriter {
    @Test
    public void contentWriterTest() {
        String md = "# Hello World!";
//        File file = new File("../../../webapp/jsp/temp.md");
//
        File file = new File("/home/acm-icpc/workspace/dataCenter/src/main/webapp/jsp/temp.md");

        FileWriter fw;
        try {
            fw = new FileWriter(file);
            fw.write(md);
            fw.close();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        }
    }
}
