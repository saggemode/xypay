package com.xypay.xypay.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminDashboardController {
    @GetMapping("/admin/dashboard")
    public String dashboard() {
        return "admin-dashboard";
    }

    @GetMapping("/admin/user-registration")
    public String userRegistrationMonitor() {
        return "admin-user-registration";
    }
}