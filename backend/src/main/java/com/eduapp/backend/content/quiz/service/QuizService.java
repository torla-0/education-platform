package com.eduapp.backend.content.quiz.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.eduapp.backend.content.quiz.dto.QuizDto;
import com.eduapp.backend.content.quiz.entity.Quiz;
import com.eduapp.backend.content.quiz.mapper.QuizDtoMapper;
import com.eduapp.backend.content.quiz.repository.QuizRepository;

/**
 * Service for retrieving and mapping Quiz entities to DTOs.
 */
@Service
public class QuizService {

    private final QuizRepository quizRepository;

    public QuizService(QuizRepository quizRepository) {
        this.quizRepository = quizRepository;
    }

    /**
     * Retrieve all quizzes and convert to DTOs.
     */
    public List<QuizDto> findAll() {
        return quizRepository.findAll().stream()
            .map(QuizDtoMapper::toQuizDto)
            .collect(Collectors.toList());
    }

    /**
     * Retrieve a single quiz by ID and convert to DTO.
     * @throws RuntimeException if not found
     */
    public QuizDto findById(Long id) {
        Quiz quiz = quizRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Quiz not found: " + id));
        return QuizDtoMapper.toQuizDto(quiz);
    }
}

