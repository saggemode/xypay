package com.xypay.xypay.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SuperuserDashboardController {
    @GetMapping("/superuser/dashboard")
    public String superuserDashboard() {
        return "superuser-dashboard";
    }
}
