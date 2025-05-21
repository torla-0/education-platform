package com.eduapp.backend.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.dto.UpdateProfileRequest;
import com.eduapp.backend.dto.UserDto;
import com.eduapp.backend.model.User;
import com.eduapp.backend.service.UserService;


@RestController
@RequestMapping("/api/users")
public class UserController {
    private final UserService userService;  

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }
    @GetMapping("/me")
    public ResponseEntity<UserDto> getCurrentUser(@AuthenticationPrincipal User user) {
        return ResponseEntity.ok(new UserDto(user));
    }

    @PutMapping("/me")
    public ResponseEntity<Map<String, String>> updateMyProfile(@RequestBody UpdateProfileRequest request, 
        @AuthenticationPrincipal User user) {
        
        userService.updateUserProfile(user, request);
        Map<String, String> response = new HashMap<>();
        response.put("message", "Profile updated successfully");
        return ResponseEntity.ok(response);
    }

}
