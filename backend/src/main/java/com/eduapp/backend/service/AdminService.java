package com.eduapp.backend.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.eduapp.backend.dto.UserDto;
import com.eduapp.backend.model.User;
import com.eduapp.backend.model.enums.Role;
import com.eduapp.backend.repository.UserRepository;

@Service
public class AdminService {
    
    private final UserRepository userRepository;

    public AdminService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void promoteToModerator(Long userId){
        User user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("User not found"));

        user.setRole(Role.MODERATOR);
        userRepository.save(user);
    } 

    public List<UserDto> getAllUsers() {
        return userRepository.findAll()
            .stream()
            .map(UserDto::new)
            .collect(Collectors.toList());
    }
}
