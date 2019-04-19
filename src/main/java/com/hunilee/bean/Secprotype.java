package com.hunilee.bean;

import java.io.Serializable;

public class Secprotype implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer scId;

    private String scName;

    private String nId;
    
    private String hotPro;
    					
    private String scDetaila;
    
    private String scDetailb;
    
    private String scDetailc;
    
    private String pic1;

    private String pic2;

    private String pic3;

    private String pic4;

    private String pic5;

    private String pic6;

    private String pic7;

    private String pic8;

    private String pic9;

    public Integer getScId() {
        return scId;
    }

    public void setScId(Integer scId) {
        this.scId = scId;
    }

    public String getScName() {
        return scName;
    }

    public void setScName(String scName) {
        this.scName = scName == null ? null : scName.trim();
    }

    public String getnId() {
        return nId;
    }

    public void setnId(String nId) {
        this.nId = nId == null ? null : nId.trim();
    }


	public String getHotPro() {
		return hotPro;
	}

	public void setHotPro(String hotPro) {
		this.hotPro = hotPro;
	}

	public String getScDetaila() {
		return scDetaila;
	}

	public void setScDetaila(String scDetaila) {
		this.scDetaila = scDetaila;
	}

	public String getScDetailb() {
		return scDetailb;
	}

	public void setScDetailb(String scDetailb) {
		this.scDetailb = scDetailb;
	}

	public String getScDetailc() {
		return scDetailc;
	}

	public void setScDetailc(String scDetailc) {
		this.scDetailc = scDetailc;
	}

	public String getPic1() {
		return pic1;
	}

	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}

	public String getPic2() {
		return pic2;
	}

	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}

	public String getPic3() {
		return pic3;
	}

	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}

	public String getPic4() {
		return pic4;
	}

	public void setPic4(String pic4) {
		this.pic4 = pic4;
	}

	public String getPic5() {
		return pic5;
	}

	public void setPic5(String pic5) {
		this.pic5 = pic5;
	}

	public String getPic6() {
		return pic6;
	}

	public void setPic6(String pic6) {
		this.pic6 = pic6;
	}

	public String getPic7() {
		return pic7;
	}

	public void setPic7(String pic7) {
		this.pic7 = pic7;
	}

	public String getPic8() {
		return pic8;
	}

	public void setPic8(String pic8) {
		this.pic8 = pic8;
	}

	public String getPic9() {
		return pic9;
	}

	public void setPic9(String pic9) {
		this.pic9 = pic9;
	}
    
	
    
}