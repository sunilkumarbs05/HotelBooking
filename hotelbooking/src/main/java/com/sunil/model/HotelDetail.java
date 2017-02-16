package com.sunil.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "hoteldetail")
public class HotelDetail {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String city;
	private String hotelname;
	private int numberrooms;
	private int price;
	private float star;

	public Long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getHotelname() {
		return hotelname;
	}

	public void setHotelname(String hotelname) {
		this.hotelname = hotelname;
	}

	public int getNumberrooms() {
		return numberrooms;
	}

	public void setNumberrooms(int numberrooms) {
		this.numberrooms = numberrooms;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public float getStar() {
		return star;
	}

	public void setStar(float star) {
		this.star = star;
	}

}
