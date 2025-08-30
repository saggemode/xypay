package com.xypay.xypay.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Set;
import java.util.stream.Collectors;

@Controller
public class DashboardController {
    @GetMapping("/dashboard")
    public String dashboard(Authentication authentication) {
        Set<String> roles = authentication.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.toSet());
        if (roles.contains("ROLE_SUPERUSER")) {
            return "redirect:/superuser/dashboard";
        } else if (roles.contains("ROLE_TELLER")) {
            return "redirect:/teller/dashboard";
        } else if (roles.contains("ROLE_CUSTOMER_SERVICE_OFFICER")) {
            return "redirect:/cso/dashboard";
        } else if (roles.contains("ROLE_LOAN_OFFICER")) {
            return "redirect:/loan-officer/dashboard";
        } else if (roles.contains("ROLE_RELATIONSHIP_MANAGER")) {
            return "redirect:/rm/dashboard";
        } else if (roles.contains("ROLE_OPERATIONS_OFFICER")) {
            return "redirect:/operations/dashboard";
        } else if (roles.contains("ROLE_COMPLIANCE_OFFICER")) {
            return "redirect:/compliance/dashboard";
        } else if (roles.contains("ROLE_TREASURY_OFFICER")) {
            return "redirect:/treasury/dashboard";
        } else if (roles.contains("ROLE_IT_SUPPORT")) {
            return "redirect:/it/dashboard";
        } else if (roles.contains("ROLE_BRANCH_MANAGER")) {
            return "redirect:/branch-manager/dashboard";
        } else if (roles.contains("ROLE_OPERATIONS_MANAGER")) {
            return "redirect:/operations-manager/dashboard";
        } else if (roles.contains("ROLE_CHIEF_RISK_OFFICER")) {
            return "redirect:/cro/dashboard";
        } else if (roles.contains("ROLE_EXECUTIVE")) {
            return "redirect:/executive/dashboard";
        } else {
            return "redirect:/login?error=unauthorized";
        }
    }
}
