package com.eduapp.backend.service;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.eduapp.backend.dto.UpdateProfileRequest;
import com.eduapp.backend.model.User;
import com.eduapp.backend.repository.UserRepository;

@Service
public class UserService {

    private final PasswordEncoder passwordEncoder;

    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public void updateUserProfile(User user, UpdateProfileRequest request) {

        user.setFirstName(request.getFirstName());
        user.setLastName(request.getLastName());
        user.setEmail(request.getEmail());
        user.setUsername(request.getUsername());

        userRepository.save(user);
    }

    public boolean changePassword(User user, String currentPassword, String newPassword) {
        if(!passwordEncoder .matches(currentPassword, user.getPassword())) {
            return false;
        }
        
        user.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user);
        return true;
    }

    public boolean handleDeletionRequest(String email, String password) {
        User user = userRepository.findByEmail(email).orElse(null);
        if (user == null || !passwordEncoder.matches(password, user.getPassword())) {
            return false;
        }

        user.setDeletionRequested(true);
        user.setScheduledDeletionAt(LocalDateTime.now().plusDays(30)); 
        userRepository.save(user);
        return true;
    }

}
