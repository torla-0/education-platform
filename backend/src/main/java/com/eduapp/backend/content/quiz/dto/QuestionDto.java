package com.eduapp.backend.content.quiz.dto;

import java.util.List;

public class QuestionDto {
    private final Long id;
    private final String text;
    private final List<QuestionOptionDto> options;

    public QuestionDto(Long id, String text, List<QuestionOptionDto> options) {
        this.id = id;
        this.text = text;
        this.options = options;
    }

    public Long getId() {
        return id;
    }

    public String getText() {
        return text;
    }

    public List<QuestionOptionDto> getOptions() {
        return options;
    }
}
