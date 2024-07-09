package com.itwill.gaebokchi.dto;

import com.itwill.gaebokchi.repository.User;

import lombok.Data;

@Data
public class normalUserCreateDto {
	private int id;
	private String userid;
	private String password;
	private String name;
	private String nickname;
	private String phone;
	private String email;
	private int birth;
	private int gender;
	private String address;
	private int birthYear;
	private int birthMonth;
	private int birthDay;
	private String phone0;
	private String phone1;
	private String phone2;
	private String phone3;
	private String postCode;
	private String addressMain;
	private String addressDetail;
	private int male;
	private int female;
	private String emailPrefix;
	private String emailSeparator;

	public User toEntity() {
		birth = Integer.parseInt(String.format("%04d%02d%02d", birthYear, birthMonth, birthDay));
		phone = phone0 + "/" + phone1 + "-" + phone2 + "-" + phone3;
		address = postCode + "/" + addressMain + "/" + addressDetail;
		email = emailPrefix + "@" + emailSeparator;
		if (male == 1) {
			gender = male;
		} else {
			gender = female;
		}

		return User.builder().userid(userid).password(password).name(name).nickname(nickname).phone(phone).email(email)
				.birth(birth).gender(gender).address(address).build();
	}
}