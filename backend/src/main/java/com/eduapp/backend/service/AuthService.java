package com.eduapp.backend.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.eduapp.backend.dto.AuthResponse;
import com.eduapp.backend.dto.LoginRequest;
import com.eduapp.backend.dto.UserRegisterRequest;
import com.eduapp.backend.model.User;
import com.eduapp.backend.model.enums.Role;
import com.eduapp.backend.repository.UserRepository;
import com.eduapp.backend.security.JwtService;

@Service
public class AuthService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private JwtService jwtService;

    @Autowired
    private AuthenticationManager authenticationManager;

    public String registerUser(UserRegisterRequest request) {
    if (userRepository.findByEmail(request.getEmail()).isPresent()) {
        return "Email already in use";
    }

    User user = new User();
    user.setUsername(request.getUsername()); // <-- THIS was missing
    user.setEmail(request.getEmail());
    user.setPassword(passwordEncoder.encode(request.getPassword()));
    user.setFirstName(request.getFirstName());
    user.setLastName(request.getLastName());
    user.setRole(Role.USER);

    userRepository.save(user);
    return "User registered successfully";
    }

    public AuthResponse login(LoginRequest request) {
        authenticationManager.authenticate(
            new UsernamePasswordAuthenticationToken(
                request.getEmail(),
                request.getPassword()
            )
        );

        User user = userRepository.findByEmail(request.getEmail())
            .orElseThrow(() -> new RuntimeException("User not found"));

        String token = jwtService.generateToken(user);
        return new AuthResponse(token);
    }

}

