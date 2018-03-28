package com.ognice.domain;

import java.util.Date;
/**
*
* 明细表 实体类
*
**/
public class Storedetail {
    private Long id;

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    private Integer c_id;

	public Integer getC_id() {
        return c_id;
    }

    public void setC_id(Integer c_id) {
        this.c_id = c_id;
    }

    private Integer r_id;

	public Integer getR_id() {
        return r_id;
    }

    public void setR_id(Integer r_id) {
        this.r_id = r_id;
    }

    private String r_name;

	public String getR_name() {
        return r_name;
    }

    public void setR_name(String r_name) {
        this.r_name = r_name;
    }

    private String r_unit;

	public String getR_unit() {
        return r_unit;
    }

    public void setR_unit(String r_unit) {
        this.r_unit = r_unit;
    }

    private Integer type;

	public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    private Integer s_num;

	public Integer getS_num() {
        return s_num;
    }

    public void setS_num(Integer s_num) {
        this.s_num = s_num;
    }

    private Double price;

	public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    private Date order_date;

	public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    private String pull_com;

	public String getPull_com() {
        return pull_com;
    }

    public void setPull_com(String pull_com) {
        this.pull_com = pull_com;
    }

    private String let_com;

	public String getLet_com() {
        return let_com;
    }

    public void setLet_com(String let_com) {
        this.let_com = let_com;
    }

    private String oprator;

	public String getOprator() {
        return oprator;
    }

    public void setOprator(String oprator) {
        this.oprator = oprator;
    }

    private String remark;

	public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

}