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
public class ProductDTO {
	private int pno;
	private String pname;
	private String ptype;
	private String pmeno;
	private int price;
	private int availl_cnt;
	private int sale_cnt;
	private String p_img;
	private Date regdate;

}
