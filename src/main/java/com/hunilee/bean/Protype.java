package com.hunilee.bean;

public class Protype {
    private Integer nId;

    private String nName;

    private String nType;

    public Integer getnId() {
        return nId;
    }

    public void setnId(Integer nId) {
        this.nId = nId;
    }

    public String getnName() {
        return nName;
    }

    public void setnName(String nName) {
        this.nName = nName == null ? null : nName.trim();
    }

    public String getnType() {
        return nType;
    }

    public void setnType(String nType) {
        this.nType = nType == null ? null : nType.trim();
    }
}