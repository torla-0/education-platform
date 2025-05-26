package com.eduapp.backend.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.dto.AuthResponse;
import com.eduapp.backend.dto.LoginRequest;
import com.eduapp.backend.dto.UserRegisterRequest;
import com.eduapp.backend.service.AuthService;
import com.eduapp.backend.user.entity.User;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final PasswordEncoder passwordEncoder;

    @Autowired
    private AuthService authService;

    AuthController(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @PostMapping("/register")
    public ResponseEntity<Map<String, String>> register(@RequestBody UserRegisterRequest request) {
        String response = authService.registerUser(request);
        Map<String, String> body = new HashMap<>();
        body.put("message", response);
        return ResponseEntity.ok(body); 
    }


    @PostMapping("/login")
    public ResponseEntity<AuthResponse> login(@RequestBody LoginRequest request) {
        return ResponseEntity.ok(authService.login(request));
    }

    @PostMapping("/re-authenticate")
    public ResponseEntity<?> reAuthenticate(
            @RequestBody Map<String, String> request,
            @AuthenticationPrincipal User user) {

        String rawPassword = request.get("password");

        if (user == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User not found");
        }

        if (!passwordEncoder.matches(rawPassword, user.getPassword())) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid password");
        }

        return ResponseEntity.ok().build();
    }



}

