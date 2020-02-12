package com.bonita.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTests {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test 
	public void textConnection() {
		try(Connection conn = 
			DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE",
					"user1",
					"1234")) {
			System.out.println(conn);
		}catch(Exception e) {
			fail(e.getMessage());
		}
	}

}
