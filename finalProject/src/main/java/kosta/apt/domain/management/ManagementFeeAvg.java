package kosta.apt.domain.management;

import java.io.Serializable;

public class ManagementFeeAvg implements Serializable {
	private int mf_waterFeeAvg;
	private int mf_gasFeeAvg;
	private int mf_electricFeeAvg;
	public int getMf_waterFeeAvg() {
		return mf_waterFeeAvg;
	}
	public void setMf_waterFeeAvg(int mf_waterFeeAvg) {
		this.mf_waterFeeAvg = mf_waterFeeAvg;
	}
	public int getMf_gasFeeAvg() {
		return mf_gasFeeAvg;
	}
	public void setMf_gasFeeAvg(int mf_gasFeeAvg) {
		this.mf_gasFeeAvg = mf_gasFeeAvg;
	}
	public int getMf_electricFeeAvg() {
		return mf_electricFeeAvg;
	}
	public void setMf_electricFeeAvg(int mf_electricFeeAvg) {
		this.mf_electricFeeAvg = mf_electricFeeAvg;
	}
	@Override
	public String toString() {
		return "ManagementFeeAvg [mf_waterFeeAvg=" + mf_waterFeeAvg + ", mf_gasFeeAvg=" + mf_gasFeeAvg
				+ ", mf_electricFeeAvg=" + mf_electricFeeAvg + "]";
	}
	

}
