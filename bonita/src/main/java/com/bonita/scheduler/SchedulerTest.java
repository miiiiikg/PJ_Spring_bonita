package com.bonita.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SchedulerTest {
	
	// cron표기법: 작성할때 초 분 시 일 월 년 순으로
	// * : 매년 매월 매일에 동작을 한다
	// @Scheduled(cron = "0 52 9 * * *")
	public void cronTest() {
		log.info("Welcome Scheduling :)");
	}

}
