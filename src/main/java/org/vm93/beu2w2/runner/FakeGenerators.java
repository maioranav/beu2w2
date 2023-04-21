package org.vm93.beu2w2.runner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;
import org.vm93.beu2w2.service.EmployeeService;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class FakeGenerators implements ApplicationRunner {
	
	@Autowired
	EmployeeService employeedao;

	@Override
	public void run(ApplicationArguments args) throws Exception {
		
		//Uncomment this line to make generator start on Boot
		//generateFakes();

	}
	
	public void generateFakes() {
		log.warn("*** > FakeGeneratorStarted < ***");
		
		for (int i = 0; i < 10; i++) {
		employeedao.saveFakeEmployee();
		}
		
		log.warn("*** > FakeGeneratorEnded < ***");
	}

}
