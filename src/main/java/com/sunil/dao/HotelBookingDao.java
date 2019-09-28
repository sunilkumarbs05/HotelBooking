package com.sunil.dao;

/*
 * Copyright 2012-2014 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import java.util.List;

import com.sunil.model.HotelDetail;

public interface HotelBookingDao {
	List<String> getCities();

	List<HotelDetail> getHotelDetailsbyCity(String city);

	List<String> getHotelsByCity(String city);

	int getRoomNumber(String city, String hotelName);

}
