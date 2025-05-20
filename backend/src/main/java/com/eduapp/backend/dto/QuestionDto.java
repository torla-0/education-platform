package com.eduapp.backend.dto;

import java.util.List;

public class QuestionDto {
    private final Long id;
    private final String text;
    private final String correctAnswer;
    private final List<String> options;

    public QuestionDto(Long id, String text, String correctAnswer, List<String> options) {
        this.id = id;
        this.text = text;
        this.correctAnswer = correctAnswer;
        this.options = options;
    }

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
