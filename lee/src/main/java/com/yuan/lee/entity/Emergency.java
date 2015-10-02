package com.yuan.lee.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class Emergency implements Serializable {
    private String emerid;

    private String emername;

    private String emerno;

    private Date happentime;

    private String emerdescribe;

    private String inaddress;

    private String note;

    private String emertypeid;

    private static final long serialVersionUID = 1L;

    public String getEmerid() {
        return emerid;
    }

    public void setEmerid(String emerid) {
        this.emerid = emerid == null ? null : emerid.trim();
    }

    public String getEmername() {
        return emername;
    }

    public void setEmername(String emername) {
        this.emername = emername == null ? null : emername.trim();
    }

    public String getEmerno() {
        return emerno;
    }

    public void setEmerno(String emerno) {
        this.emerno = emerno == null ? null : emerno.trim();
    }

    public Date getHappentime() {
        return happentime;
    }

    public void setHappentime(Date happentime) {
        this.happentime = happentime;
    }

    public String getEmerdescribe() {
        return emerdescribe;
    }

    public void setEmerdescribe(String emerdescribe) {
        this.emerdescribe = emerdescribe == null ? null : emerdescribe.trim();
    }

    public String getInaddress() {
        return inaddress;
    }

    public void setInaddress(String inaddress) {
        this.inaddress = inaddress == null ? null : inaddress.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getEmertypeid() {
        return emertypeid;
    }

    public void setEmertypeid(String emertypeid) {
        this.emertypeid = emertypeid == null ? null : emertypeid.trim();
    }
}