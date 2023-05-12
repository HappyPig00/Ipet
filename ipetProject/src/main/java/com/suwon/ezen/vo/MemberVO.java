package com.suwon.ezen.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private int mno;
	private String name;
	private String phone;
	private String address;
	private String email;
	private String id;
	private String password;
	private String auth;
	private Date createDate;
}
