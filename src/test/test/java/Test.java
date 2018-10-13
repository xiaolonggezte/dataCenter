package test.java;

import java.io.UnsupportedEncodingException;

/**
 * @Author: xiaolong
 * @Date: Created in 上午10:00 18-10-13
 * @Desription:
 */
public class Test {
    @org.junit.Test
    public void Test() throws UnsupportedEncodingException {
//        String name = "Î¢ÐÍ¼ÆËã»ú";
        String name = "abc";
        String newName = new String(name.getBytes("ISO-8859-1"),"GBK");
        System.out.println(newName);
    }
}
