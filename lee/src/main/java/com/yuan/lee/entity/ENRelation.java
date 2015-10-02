package com.yuan.lee.entity;

import java.io.Serializable;

public class ENRelation implements Serializable {
    private String enrelationid;

    private String nodeid;

    private String emerid;

    private static final long serialVersionUID = 1L;

    public String getEnrelationid() {
        return enrelationid;
    }

    public void setEnrelationid(String enrelationid) {
        this.enrelationid = enrelationid == null ? null : enrelationid.trim();
    }

    public String getNodeid() {
        return nodeid;
    }

    public void setNodeid(String nodeid) {
        this.nodeid = nodeid == null ? null : nodeid.trim();
    }

    public String getEmerid() {
        return emerid;
    }

    public void setEmerid(String emerid) {
        this.emerid = emerid == null ? null : emerid.trim();
    }
}