package com.eduapp.backend.user.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.user.dto.ChangePasswordRequest;
import com.eduapp.backend.user.dto.DeletionRequestDto;
import com.eduapp.backend.user.dto.UpdateProfileRequest;
import com.eduapp.backend.user.dto.UserDto;
import com.eduapp.backend.user.entity.User;
import com.eduapp.backend.user.service.UserService;




@RestController
@RequestMapping("/api/users")
public class UserController {
    private final UserService userService;  
    
    public UserController(UserService userService) {
        this.userService = userService;
    }
    @GetMapping("/me")
    public ResponseEntity<UserDto> getCurrentUser(@AuthenticationPrincipal User user) {
        UserDto dto = new UserDto(user);
        dto.setDeletionRequested(user.isDeletionRequested()); // or getDeletionRequested()
        return ResponseEntity.ok(dto);
    }


    @PutMapping("/me")
    public ResponseEntity<Map<String, String>> updateMyProfile(@RequestBody UpdateProfileRequest request, 
        @AuthenticationPrincipal User user) {
        
        userService.updateUserProfile(user, request);
        Map<String, String> response = new HashMap<>();
        response.put("message", "Profile updated successfully");
        return ResponseEntity.ok(response);
    }

    @PutMapping("/me/password")
    public ResponseEntity<?> changePassword(
        @AuthenticationPrincipal User user,
        @RequestBody ChangePasswordRequest request    
    ) {
        boolean success = userService.changePassword(user, request.getCurrentPassword(), request.getNewPassword());
        
        if(!success){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(Map.of("message", "Current password is incorrect"));
        }
        return ResponseEntity.ok(Map.of("message", "Password changed successfully"));
    }

    
    @PostMapping("/request-deletion")
    public ResponseEntity<?> requestAccountDeletion(@RequestBody DeletionRequestDto request,
                                                    @AuthenticationPrincipal User user) {
        boolean success = userService.handleDeletionRequest(user.getEmail(), request.getPassword());

        if (success) {
            return ResponseEntity.ok(Map.of("message", "Deletion request received"));
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("message", "Invalid password"));
        }
    }

    @PostMapping("/cancel-deletion")
    public ResponseEntity<UserDto> cancelDeletion(@AuthenticationPrincipal User user) {
        User updated = userService.cancelDeletion(user); 
        return ResponseEntity.ok(new UserDto(updated));
    }




}
