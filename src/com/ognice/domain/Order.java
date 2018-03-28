package com.ognice.domain;

import java.util.Date;

/***
 * 订单表
 * @author pc
 *
 */
public class Order implements java.io.Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long id;

    private String ordername;

    private String customname;

    private String ordergood;

    private Double ordernum;

    private String remark;
    
    private Long uId;
    
    private Double ordertotal;
    
    private Date orderDate;
    
    private String userName;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOrdername() {
        return ordername;
    }

    public void setOrdername(String ordername) {
        this.ordername = ordername == null ? null : ordername.trim();
    }

    public String getCustomname() {
        return customname;
    }

    public void setCustomname(String customname) {
        this.customname = customname == null ? null : customname.trim();
    }

    public String getOrdergood() {
        return ordergood;
    }

    public void setOrdergood(String ordergood) {
        this.ordergood = ordergood == null ? null : ordergood.trim();
    }

    public Double getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(Double ordernum) {
        this.ordernum = ordernum;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public Long getuId() {
		return uId;
	}

	public void setuId(Long uId) {
		this.uId = uId;
	}

	public Double getOrdertotal() {
		return ordertotal;
	}

	public void setOrdertotal(Double ordertotal) {
		this.ordertotal = ordertotal;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Order(Long id, String ordername) {
		super();
		this.id = id;
		this.ordername = ordername;
	}

	public Order() {
		super();
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Order(String ordername, String userName) {
		super();
		this.ordername = ordername;
		this.userName = userName;
	}

	
	
    
	
}