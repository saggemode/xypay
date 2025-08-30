package com.xypay.xypay.admin;

import com.xypay.xypay.domain.User;
import com.xypay.xypay.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class UserManagementController {
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @GetMapping("/users")
    public String listUsers(Model model) {
        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);
        return "admin-users";
    }
    
    @GetMapping("/users/new")
    public String newUserForm(Model model) {
        model.addAttribute("user", new User());
        return "admin-user-form";
    }
    
    @PostMapping("/users")
    public String createUser(@ModelAttribute User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        return "redirect:/admin/users";
    }
    
    @GetMapping("/users/{id}/edit")
    public String editUserForm(@PathVariable Long id, Model model) {
        User user = userRepository.findById(id).orElseThrow();
        model.addAttribute("user", user);
        return "admin-user-form";
    }
    
    @PostMapping("/users/{id}")
    public String updateUser(@PathVariable Long id, @ModelAttribute User user) {
        User existingUser = userRepository.findById(id).orElseThrow();
        existingUser.setUsername(user.getUsername());
        existingUser.setEmail(user.getEmail());
        existingUser.setFirstName(user.getFirstName());
        existingUser.setLastName(user.getLastName());
        existingUser.setRoles(user.getRoles());
        if (user.getPassword() != null && !user.getPassword().isEmpty()) {
            existingUser.setPassword(passwordEncoder.encode(user.getPassword()));
        }
        userRepository.save(existingUser);
        return "redirect:/admin/users";
    }
    
    @PostMapping("/users/{id}/delete")
    public String deleteUser(@PathVariable Long id) {
        userRepository.deleteById(id);
        return "redirect:/admin/users";
    }
}
