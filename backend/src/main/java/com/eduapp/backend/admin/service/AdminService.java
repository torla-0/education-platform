package com.eduapp.backend.admin.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.eduapp.backend.user.dto.UserDto;
import com.eduapp.backend.user.entity.User;
import com.eduapp.backend.user.entity.enums.Role;
import com.eduapp.backend.user.repository.UserRepository;

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
    
    public void demoteUser(Long id) {
        User user = userRepository.findById(id).orElseThrow();
        if (user.getRole() == Role.MODERATOR) {
            user.setRole(Role.USER);
            userRepository.save(user);
        } else {
            throw new IllegalArgumentException("Cannot demote a user that is not a moderator");
        }
    }


    public List<UserDto> getAllUsers() {
        return userRepository.findAll()
            .stream()
            .map(UserDto::new)
            .collect(Collectors.toList());
    }
}
