package com.eduapp.backend.content.quiz.dto;

import java.util.List;

public class QuizDto {
    private final Long id;
    private final String title;
    private final List<QuestionDto> questions;

    public QuizDto(Long id, String title, List<QuestionDto> questions) {
        this.id = id;
        this.title = title;
        this.questions = questions;
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public List<QuestionDto> getQuestions() {
        return questions;
    }

    
}
