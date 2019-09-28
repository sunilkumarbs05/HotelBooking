package com.sunil.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sunil.model.BookingDetails;
import com.sunil.model.HotelDetail;
import com.sunil.model.Response;
import com.sunil.service.HotelBookingService;

@Controller
public class HotelBookingController {

	@Autowired
	HotelBookingService hotelBookingService;

	@RequestMapping(value = "/home")
	public String loadHomePage() {
		return "home";
	}

	@RequestMapping(value = "/loadHotelBook")
	public ModelAndView loadHotelBookPage() {
		ModelAndView andView = new ModelAndView("hotelbook");
		andView.addObject("cities", hotelBookingService.getCities());
		return andView;
	}

	@RequestMapping(value = "/getHotels/{city}")
	@ResponseBody
	public List<String> getHotelsByCity(@PathVariable("city") String city) {
		return hotelBookingService.getHotelsByCity(city);
	}

	@RequestMapping(value = "/bookHotel", method = RequestMethod.POST)
	@ResponseBody
	public Response bookHotel(@RequestBody BookingDetails bookingDetails) {
		Response response = new Response();
		response.setMessage(hotelBookingService.bookHotel(bookingDetails));
		return response;
	}

	@RequestMapping(value = "/loadViewHotel")
	public ModelAndView loadVeiwHotelPage() {
		ModelAndView andView = new ModelAndView("viewhotel");
		andView.addObject("cities", hotelBookingService.getCities());
		return andView;
	}

	@RequestMapping(value = "getHotelsDetails/{city}")
	@ResponseBody
	public List<HotelDetail> getHotelsDetails(@PathVariable("city") String city) {
		return hotelBookingService.getHotelDetailsbyCity(city);
	}
}
