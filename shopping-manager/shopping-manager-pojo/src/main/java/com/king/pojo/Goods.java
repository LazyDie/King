package com.king.pojo;

public class Goods {
    private Integer id;

    private Integer gid;

    private String name;

    private String path;

    private String barcode;

    private String cateId;

    private Integer number;

    private Double cpirce;

    private Double ppirce;

    private Double rprice;

    private Integer mid;

    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode == null ? null : barcode.trim();
    }


    public String getCateId() {
		return cateId;
	}

	public void setCateId(String cateId) {
		this.cateId = cateId;
	}

	public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Double getCpirce() {
        return cpirce;
    }

    public void setCpirce(Double cpirce) {
        this.cpirce = cpirce;
    }

    public Double getPpirce() {
        return ppirce;
    }

    public void setPpirce(Double ppirce) {
        this.ppirce = ppirce;
    }

    public Double getRprice() {
        return rprice;
    }

    public void setRprice(Double rprice) {
        this.rprice = rprice;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}