package com.eduapp.backend.util;

import com.eduapp.backend.dto.QuestionDto;
import com.eduapp.backend.dto.QuestionOptionDto;
import com.eduapp.backend.dto.QuizDto;
import com.eduapp.backend.model.Question;
import com.eduapp.backend.model.QuestionOption;
import com.eduapp.backend.model.Quiz;

import java.util.List;
import java.util.stream.Collectors;

public class DtoMapper {

    public static QuestionOptionDto toDto(QuestionOption option) {
        return new QuestionOptionDto(
            option.getId(),
            option.getText(),
            option.isCorrect()
        );
    }

    public static QuestionDto toDto(Question question) {
        List<QuestionOptionDto> optionDtos = question.getOptions()
            .stream()
            .map(DtoMapper::toDto)
            .collect(Collectors.toList());

        return new QuestionDto(
            question.getId(),
            question.getText(),
            optionDtos
        );
    }

    public static QuizDto toDto(Quiz quiz) {
        List<QuestionDto> questionDtos = quiz.getQuestions()
            .stream()
            .map(DtoMapper::toDto)
            .collect(Collectors.toList());

        return new QuizDto(
            quiz.getId(),
            quiz.getTitle(),
            questionDtos
        );
    }
}
