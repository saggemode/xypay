package com.xypay.xypay.controller;

import com.xypay.xypay.service.SetupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    
    @Autowired
    private SetupService setupService;
    
    @GetMapping("/")
    public String home() {
        // Check if system is initialized, if not redirect to setup
        if (!setupService.isSystemInitialized()) {
            return "redirect:/setup";
        }
        return "redirect:/admin/ui/dashboard";
    }
    
    @GetMapping("/login")
    public String login() {
        return "login";
    }
}