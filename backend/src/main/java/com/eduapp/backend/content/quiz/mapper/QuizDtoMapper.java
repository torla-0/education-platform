package com.eduapp.backend.content.quiz.mapper;

import com.eduapp.backend.content.quiz.dto.QuizDto;
import com.eduapp.backend.content.quiz.entity.Quiz;

public class QuizDtoMapper {

    public static QuizDto toQuizDto(Quiz quiz) {
        return new QuizDto(
                quiz.getId(),
                quiz.getTitle(),
                quiz.getTopic().getId(),
                quiz.getTopic().getName(),
                quiz.isPublished(),
                quiz.getQuestions().size(),
                quiz.getCreatedAt(),
                quiz.getUpdatedAt()
        );
    }
}
