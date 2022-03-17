package kr.co.weather.domain;

public class LocGrid {
	private String region_1;
	private String region_2;
	private int grid_x;
	private int grid_y;
	
	public String getRegion_1() {
		return region_1;
	}
	public void setRegion_1(String region_1) {
		this.region_1 = region_1;
	}
	public String getRegion_2() {
		return region_2;
	}
	public void setRegion_2(String region_2) {
		this.region_2 = region_2;
	}
	public int getGrid_x() {
		return grid_x;
	}
	public void setGrid_x(int grid_x) {
		this.grid_x = grid_x;
	}
	public int getGrid_y() {
		return grid_y;
	}
	public void setGrid_y(int grid_y) {
		this.grid_y = grid_y;
	}
	
	@Override
	public String toString() {
		return "LocGrid [region_1=" + region_1 + ", region_2=" + region_2 + ", grid_x=" + grid_x + ", grid_y=" + grid_y
				+ "]";
	}
}
