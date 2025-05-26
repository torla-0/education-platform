package com.eduapp.backend.user.dto;

public class UpdateProfileRequest {
    private String username;
    private String firstName;
    private String lastName;
    private String email;

    public String getUsername() {
        return username;
    }
    
    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }
    

}
