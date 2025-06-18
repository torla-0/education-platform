package com.eduapp.backend.content.quiz.mapper;

import java.util.List;
import java.util.stream.Collectors;

import com.eduapp.backend.content.quiz.dto.QuestionDto;
import com.eduapp.backend.content.quiz.dto.QuestionOptionDto;
import com.eduapp.backend.content.quiz.entity.Question;
import com.eduapp.backend.content.quiz.entity.QuestionOption;

public class QuestionDtoMapper {

    public static QuestionOptionDto toOptionDto(QuestionOption option) {
        return new QuestionOptionDto(
                option.getId(),
                option.getText(),
                option.isCorrect()
        );
    }

    public static QuestionDto toDto(Question question) {
        List<QuestionOptionDto> options = question.getOptions()
                .stream()
                .map(QuestionDtoMapper::toOptionDto)
                .collect(Collectors.toList());

        return new QuestionDto(
                question.getId(),
                question.getText(),
                options
        );
    }
}
