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

package com.sunil.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.sunil.model.HotelDetail;

@Repository
class HotelBookingDaoImpl implements HotelBookingDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<HotelDetail> getHotelDetailsbyCity(String city) {
		return this.entityManager
				.createQuery("SELECT h FROM HotelDetail h where city=?",
						HotelDetail.class).setParameter(1, city)
				.getResultList();
	}

	@Override
	public List<String> getCities() {
		return this.entityManager.createQuery(
				"SELECT distinct h.city FROM HotelDetail h", String.class)
				.getResultList();
	}

	@Override
	public List<String> getHotelsByCity(String city) {
		return this.entityManager
				.createQuery(
						"SELECT h.hotelname FROM HotelDetail h where city=?",
						String.class).setParameter(1, city).getResultList();
	}

	@Override
	public int getRoomNumber(String city, String hotelName) {
		return this.entityManager
				.createQuery(
						"SELECT h.numberrooms FROM HotelDetail h where city=:city and hotelname=:hotelname",
						Integer.class).setParameter("city", city)
				.setParameter("hotelname", hotelName).getSingleResult();
	}

}
