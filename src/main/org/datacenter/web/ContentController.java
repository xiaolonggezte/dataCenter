package org.datacenter.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.File;
import java.io.FileWriter;
import java.io.UnsupportedEncodingException;

/**
 * @Author: xiaolong
 * @Date: Created in 下午2:28 18-10-11
 * @Desription:
 */
@Controller
public class ContentController {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @RequestMapping("/content/update")
    public void modifyContent(@RequestParam("content") String content) throws UnsupportedEncodingException {
        logger.info("content = {}",content);
        content = java.net.URLDecoder.decode(content,"UTF-8");
        logger.info("content = {}",content);

//        TODO 部署在其他机器上的时候注意修改文件绝对路径
        File file = new File("/home/acm-icpc/workspace/dataCenter/src/main/webapp/jsp/temp.md");

        FileWriter fw;
        try {
            fw = new FileWriter(file);
            fw.write(content);
            fw.close();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        }

    }
}
