package com.bonita.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String postcode;
	private String addr1;
	private String addr2;
	private String useon;
	private String primaryon;
	private String locon;
	private String eventon;
	private String useyn;
	private Date regdate;

}
