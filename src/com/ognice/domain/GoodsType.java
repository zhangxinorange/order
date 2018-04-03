package com.ognice.domain;

import java.util.Date;

public class GoodsType {
    private Long tid;

    private String tname;

    private Integer status;

    private Date createdate;

    public Long getTid() {
        return tid;
    }

    public void setTid(Long tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

	public GoodsType(String tname) {
		super();
		this.tname = tname;
	}

	public GoodsType() {
		super();
	}
    
    
}