package com.DieboldNixdorf.ProCompta.controller;

 
 
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@org.springframework.web.bind.annotation.RestController
@RequestMapping("/api")
public class RestController {
	
	@GetMapping("/disque")
	 public List<String> listDisque() {
	 
		List<String> listDisque = Stream.of("C:", "D:", "E:").collect(Collectors.toList());
		return listDisque;
	}
	
	
	
	
	
	
	
	
	
	
	
}
