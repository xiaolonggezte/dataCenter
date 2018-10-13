package org.datacenter.entity;

/**
 * @Author: xiaolong
 * @Date: Created in 下午1:00 18-10-7
 * @Desription:
 */
public class Device {
    private int deviceId;
    private String isUsed;
    private String deviceStatus;
    private String deviceUnitId;
    private String deviceUnitName;
    private String deviceNumber;
    private String deviceCategoryNumber;
    private String deviceName;
    private String deviceVersion;
    private float devicePrice;
    private String deviceMenufactor;
    private String deviceDate;
    private String deviceGetter;
    private String deviceSubject;
    private String deviceUseDeriction;
    private String deviceRoom;
    private String deviceHander;


    @Override
    public String toString() {
        return "Device{" +
                "deviceId=" + deviceId +
                ", isUsed='" + isUsed + '\'' +
                ", deviceStatus='" + deviceStatus + '\'' +
                ", deviceUnitId=" + deviceUnitId +
                ", deviceUnitName='" + deviceUnitName + '\'' +
                ", deviceNumber=" + deviceNumber +
                ", deviceCategoryNumber=" + deviceCategoryNumber +
                ", deviceName='" + deviceName + '\'' +
                ", deviceVersion='" + deviceVersion + '\'' +
                ", devicePrice=" + devicePrice +
                ", deviceMenufactor='" + deviceMenufactor + '\'' +
                ", deviceDate='" + deviceDate + '\'' +
                ", deviceGetter='" + deviceGetter + '\'' +
                ", deviceSubject='" + deviceSubject + '\'' +
                ", deviceUseDeriction='" + deviceUseDeriction + '\'' +
                ", deviceRoom='" + deviceRoom + '\'' +
                ", deviceHander='" + deviceHander + '\'' +
                '}';
    }

    public int getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(int deviceId) {
        this.deviceId = deviceId;
    }

    public String getIsUsed() {
        return isUsed;
    }

    public void setIsUsed(String isUsed) {
        this.isUsed = isUsed;
    }

    public String getDeviceStatus() {
        return deviceStatus;
    }

    public void setDeviceStatus(String deviceStatus) {
        this.deviceStatus = deviceStatus;
    }

    public String getDeviceUnitId() {
        return deviceUnitId;
    }

    public void setDeviceUnitId(String deviceUnitId) {
        this.deviceUnitId = deviceUnitId;
    }

    public String getDeviceUnitName() {
        return deviceUnitName;
    }

    public void setDeviceUnitName(String deviceUnitName) {
        this.deviceUnitName = deviceUnitName;
    }

    public String getDeviceNumber() {
        return deviceNumber;
    }

    public void setDeviceNumber(String deviceNumber) {
        this.deviceNumber = deviceNumber;
    }

    public String getDeviceCategoryNumber() {
        return deviceCategoryNumber;
    }

    public void setDeviceCategoryNumber(String deviceCategoryNumber) {
        this.deviceCategoryNumber = deviceCategoryNumber;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public String getDeviceVersion() {
        return deviceVersion;
    }

    public void setDeviceVersion(String deviceVersion) {
        this.deviceVersion = deviceVersion;
    }

    public float getDevicePrice() {
        return devicePrice;
    }

    public void setDevicePrice(float devicePrice) {
        this.devicePrice = devicePrice;
    }

    public String getDeviceMenufactor() {
        return deviceMenufactor;
    }

    public void setDeviceMenufactor(String deviceMenufactor) {
        this.deviceMenufactor = deviceMenufactor;
    }

    public String getDeviceDate() {
        return deviceDate;
    }

    public void setDeviceDate(String deviceDate) {
        this.deviceDate = deviceDate;
    }

    public String getDeviceGetter() {
        return deviceGetter;
    }

    public void setDeviceGetter(String deviceGetter) {
        this.deviceGetter = deviceGetter;
    }

    public String getDeviceSubject() {
        return deviceSubject;
    }

    public void setDeviceSubject(String deviceSubject) {
        this.deviceSubject = deviceSubject;
    }

    public String getDeviceUseDeriction() {
        return deviceUseDeriction;
    }

    public void setDeviceUseDeriction(String deviceUseDeriction) {
        this.deviceUseDeriction = deviceUseDeriction;
    }

    public String getDeviceRoom() {
        return deviceRoom;
    }

    public void setDeviceRoom(String deviceRoom) {
        this.deviceRoom = deviceRoom;
    }

    public String getDeviceHander() {
        return deviceHander;
    }

    public void setDeviceHander(String deviceHander) {
        this.deviceHander = deviceHander;
    }
}
