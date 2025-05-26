package com.eduapp.backend.content.quiz.dto;

public class QuizTopicDto {
    private final Long id;
    private final String name;

    public QuizTopicDto(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    // Getteri
    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
