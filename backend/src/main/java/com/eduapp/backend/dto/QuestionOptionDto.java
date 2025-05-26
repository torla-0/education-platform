package com.eduapp.backend.dto;

public class QuestionOptionDto {
    private final Long id;
    private final String text;
    private final boolean isCorrect;

    public QuestionOptionDto(Long id, String text, boolean isCorrect) {
        this.id = id;
        this.text = text;
        this.isCorrect = isCorrect;
    }

    public Long getId() {
        return id;
    }

    public String getText() {
        return text;
    }

    public boolean isCorrect() {
        return isCorrect;
    }
}
