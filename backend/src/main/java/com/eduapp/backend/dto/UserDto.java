package com.eduapp.backend.dto;

import com.eduapp.backend.model.enums.Role;

import com.eduapp.backend.model.User;

public class UserDto {
    private final Long id;
    private final String email;
    private final String firstName;
    private final String lastName;
    private final String username;
    private boolean deletionRequested;
    private Role role;


    public UserDto(User user) {
        this.id = user.getId();
        this.email = user.getEmail();
        this.firstName = user.getFirstName();
        this.lastName = user.getLastName();
        this.username = user.getUsername();
        this.role = user.getRole();
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getUsername(){
        return username;
    }
    
    public boolean isDeletionRequested() {
        return deletionRequested;
    }

    public void setDeletionRequested(boolean deletionRequested) {
        this.deletionRequested = deletionRequested;
    }
    public Role getRole() {
        return role;
    }
}
