package com.eduapp.backend.auth.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eduapp.backend.auth.dto.AuthResponse;
import com.eduapp.backend.auth.dto.LoginRequest;
import com.eduapp.backend.auth.dto.UserRegisterRequest;
import com.eduapp.backend.auth.security.JwtService;
import com.eduapp.backend.user.entity.User;
import com.eduapp.backend.user.entity.enums.Role;
import com.eduapp.backend.user.repository.UserRepository;

import jakarta.persistence.EntityManager;

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

    @Autowired
    private EntityManager entityManager;
    
    @Transactional
    public String registerUser(UserRegisterRequest request) {
    if (userRepository.findByEmail(request.getEmail()).isPresent()) {
        return "Email already in use";
    }
 
    if (userRepository.findByUsername(request.getUsername()).isPresent()) {
        return "Username already in use";
    }

    User user = new User();
    user.setEmail(request.getEmail());
    user.setPassword(passwordEncoder.encode(request.getPassword()));
    user.setFirstName(request.getFirstName());
    user.setLastName(request.getLastName());
    user.setUsername(request.getUsername());
    user.setRole(Role.USER);

    userRepository.save(user);
    entityManager.flush();  

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

