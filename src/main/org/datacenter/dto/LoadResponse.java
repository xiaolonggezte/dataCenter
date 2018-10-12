package org.datacenter.dto;

/**
 * @Author: xiaolong
 * @Date: Created in 下午1:24 18-10-10
 * @Desription:
 */
public class LoadResponse {
    private int code;
    private String msg;
    private String data;

    public LoadResponse() {
    }

    public LoadResponse(int code) {
        this.code = code;
    }

    public LoadResponse(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public LoadResponse(int code, String msg, String data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
