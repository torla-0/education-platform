package com.eduapp.backend.auth.dto;

public class UserRegisterRequest {
    private String username;
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    // Getteri i setteri
    public String getEmail() {
    return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public void setFirstName(String firstname) {
        this.firstName = firstname;
    }
    public void setLastName(String lastname) {
        this.lastName = lastname;
    }

    public String getFirstName() {
        return firstName;
    }
    public String getLastName() {
        return lastName;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
}

