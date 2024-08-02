package com.nor.flightManagementSystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.nor.flightManagementSystem.bean.FlightUser;
import com.nor.flightManagementSystem.service.FlightUserService;

@RestController

public class LoginController {
	  @Autowired
	    private FlightUserService service;
	  
	    @Autowired
	    private BCryptPasswordEncoder bCrypt;
	    

	    @GetMapping("/register")
	    public ModelAndView showUserRegistrationPage() {
	        FlightUser user = new FlightUser();
	        ModelAndView mv = new ModelAndView("newUserEntry");
	        mv.addObject("userRecord", user);
	        return mv;
	    }

	    @PostMapping("/register")
	    public ModelAndView saveUserRegistrationPage(@ModelAttribute("userRecord") FlightUser user) {
	    	String encodedPassword = bCrypt.encode(user.getPassword()); 
	    	FlightUser newUser=new FlightUser();
	        newUser.setUsername(user.getUsername());
	        newUser.setPassword(encodedPassword);
	        newUser.setType(user.getType());
	        System.out.println(newUser.getUsername());
	        service.save(newUser);
	    	return new ModelAndView("loginPage");
	    }
	    

	    @GetMapping("/loginpage")
	    public ModelAndView showLoginPage() {
	        return new ModelAndView("loginPage");
	    }
//	    @GetMapping("/index")
//	    public ModelAndView showindexPage() {
//	    	return new ModelAndView("index");
//	    }
	    @GetMapping("/loginerror")
	    public ModelAndView showLoginErrorPage() {
	        return new ModelAndView("loginError");
	    }
	    @GetMapping("/index")
	    public ModelAndView showindexPage() {
	    	String indexPage="";
	    	String userType=service.getType();
	    	System.out.println(userType);
	    	
	    	if(userType.equalsIgnoreCase("Admin")) {
	    		indexPage="index1";
	    	}
	    	else if(userType.equalsIgnoreCase("Customer")) {
	    		indexPage="index2";
	    	}
	    	return new ModelAndView(indexPage);
	    }
	   
	  
	    
	    
	
}
