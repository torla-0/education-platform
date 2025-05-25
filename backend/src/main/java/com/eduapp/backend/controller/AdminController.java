package com.eduapp.backend.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.dto.IdDto;
import com.eduapp.backend.dto.UserDto;
import com.eduapp.backend.service.AdminService;



@RestController
@RequestMapping("/api/admin")
@PreAuthorize("hasRole('ADMIN')")
public class AdminController {
    private final AdminService adminService;

    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    @PostMapping("/promote/{id}")
    public ResponseEntity<?> promoteToModerator(@PathVariable Long id) {
     
        adminService.promoteToModerator(id);
        return ResponseEntity.ok(Map.of("message", "User promoted to moderator"));
    }

    @PostMapping("/demote")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> demoteUser(@RequestBody IdDto idDto) {
        adminService.demoteUser(idDto.getId());
        return ResponseEntity.ok().body(Map.of("message", "User demoted successfully"));
    }

    
    @GetMapping("/users")
    public ResponseEntity<List<UserDto>> getAllUsers() {
        return ResponseEntity.ok(adminService.getAllUsers());
    }
    
}
