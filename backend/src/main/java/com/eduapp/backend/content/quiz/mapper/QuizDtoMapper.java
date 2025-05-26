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

    public static QuestionOptionDto toQuestionOptionDto(QuestionOption option) {
        return new QuestionOptionDto(
            option.getId(),
            option.getText(),
            option.isCorrect()
        );
    }

    public static QuestionDto toQuestionDto(Question question) {
        List<QuestionOptionDto> optionDtos = question.getOptions()
            .stream()
            .map(QuizDtoMapper::toQuestionOptionDto)
            .collect(Collectors.toList());

        return new QuestionDto(
            question.getId(),
            question.getText(),
            optionDtos
        );
    }

    public static QuizDto toQuizDto(Quiz quiz) {
        List<QuestionDto> questionDtos = quiz.getQuestions()
            .stream()
            .map(QuizDtoMapper::toQuestionDto)
            .collect(Collectors.toList());

        return new QuizDto(
            quiz.getId(),
            quiz.getTitle(),
            questionDtos
        );
    }
}
