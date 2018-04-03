package com.ognice.domain;

import java.io.Serializable;
import java.util.Date;

public class Goods implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long gid;

    private String goodsname;

    private Integer status;

    private Date createdate;

    private Long goodtype;

    public Long getGid() {
        return gid;
    }

    public void setGid(Long gid) {
        this.gid = gid;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname == null ? null : goodsname.trim();
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

    public Long getGoodtype() {
        return goodtype;
    }

    public void setGoodtype(Long goodtype) {
        this.goodtype = goodtype;
    }
    
    private String tName;

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public Goods() {
		super();
	}

	public Goods(String goodsname) {
		super();
		this.goodsname = goodsname;
	}

	public Goods(String goodsname, Long goodtype) {
		super();
		this.goodsname = goodsname;
		this.goodtype = goodtype;
	}

	public Goods(Long goodtype) {
		super();
		this.goodtype = goodtype;
	}
    
	
}