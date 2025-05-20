package com.eduapp.backend.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.dto.UserDto;
import com.eduapp.backend.model.User;

@RestController
@RequestMapping("/api/users")
public class UserController {
    @GetMapping("/me")
public ResponseEntity<UserDto> getCurrentUser(@AuthenticationPrincipal User user) {
    return ResponseEntity.ok(new UserDto(user));
}

}
