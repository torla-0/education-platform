package com.eduapp.backend.content.quiz.mapper;

import java.util.List;
import java.util.stream.Collectors;

import com.eduapp.backend.content.quiz.dto.QuestionDto;
import com.eduapp.backend.content.quiz.dto.QuestionOptionDto;
import com.eduapp.backend.content.quiz.dto.QuizDto;
import com.eduapp.backend.content.quiz.entity.Question;
import com.eduapp.backend.content.quiz.entity.QuestionOption;
import com.eduapp.backend.content.quiz.entity.Quiz;

public class QuizDtoMapper {

    public static QuizDto toQuizDto(Quiz quiz) {
        return new QuizDto(
                quiz.getId(),
                quiz.getTitle(),
                quiz.getTopic().getId(),
                quiz.getTopic().getName(),
                quiz.isPublished(),
                quiz.getCreatedAt(),
                quiz.getUpdatedAt()
        );
    }
}
