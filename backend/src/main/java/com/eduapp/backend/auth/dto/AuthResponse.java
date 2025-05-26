package com.eduapp.backend.auth.dto;

public class AuthResponse {
    private final String token;

    public AuthResponse(String token) {
        this.token = token;
    }

    // Getter
    public String getToken(){
        return token;
    }
}
