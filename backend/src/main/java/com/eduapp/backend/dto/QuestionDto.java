package com.eduapp.backend.dto;

import java.util.List;

public class QuestionDto {
    private Long id;
    private String text;
    private String correctAnswer;
    private List<String> options;

    public QuestionDto(Long id, String text, String correctAnswer, List<String> options) {
        this.id = id;
        this.text = text;
        this.correctAnswer = correctAnswer;
        this.options = options;
    }

    // Getteri
    public Long getId() {
        return id;
    }

    public String getText() {
        return text;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }

    public List<String> getOptions() {
        return options;
    }
}
