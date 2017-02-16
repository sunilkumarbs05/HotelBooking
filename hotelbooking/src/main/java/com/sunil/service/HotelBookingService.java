package com.sunil.service;

import java.util.List;

import com.sunil.model.BookingDetails;
import com.sunil.model.HotelDetail;

public interface HotelBookingService {

	public List<String> getCities();

	public List<String> getHotelsByCity(String city);

	public String bookHotel(BookingDetails bookingDetails);

	public List<HotelDetail> getHotelDetailsbyCity(String city);

}
