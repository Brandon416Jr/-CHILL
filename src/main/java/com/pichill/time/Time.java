package com.pichill.time;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import com.pichill.reserveorder.entity.ReserveOrder;

@Entity
@Table(name="time")
public class Time {
	
	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="timeID", updatable = false)
	private Integer timeID;
	
	@Column(name="reserveTime", updatable = false)
	private String reserveTime;
	
	@Column(name="courtID", updatable = false)
	private Integer courtID;
	
	
	//預約訂單
	// fetch 預設為 LAZY
	@OneToMany(mappedBy = "time", cascade = CascadeType.ALL)
	// (mappedBy = "time")的time指的是新增的Time "time"部門物件的屬性
	@OrderBy("reserveOrderID asc") 
	private Set<ReserveOrder> reserveOrder; // Set不重複
		
	public Time() {
		super();
	}

	public Time(Integer timeID, String reserveTime, Integer courtID) {
		super();
		this.timeID = timeID;
		this.reserveTime = reserveTime;
		this.courtID = courtID;
	}

	public Integer getTimeID() {
		return timeID;
	}

	public void setTimeID(Integer timeID) {
		this.timeID = timeID;
	}

	public String getReserveTime() {
		return reserveTime;
	}

	public void setReserveTime(String reserveTime) {
		this.reserveTime = reserveTime;
	}

	public Integer getCourtID() {
		return courtID;
	}

	public void setCourtID(Integer courtID) {
		this.courtID = courtID;
	}

	
	public Set<ReserveOrder> getReserveOrder() {
		return reserveOrder;
	}

	public void setReserveOrder(Set<ReserveOrder> reserveOrder) {
		this.reserveOrder = reserveOrder;
	}

	@Override
	public String toString() {
		return "Time [timeID=" + timeID + ", reserveTime=" + reserveTime + ", courtID=" + courtID + ", reserveOrder="
				+ reserveOrder + "]";
	}

	public static Time parseInt(String parameter) {
		// TODO Auto-generated method stub
		return null;
	}

	
	

}
