package com.eduapp.backend.service;

import com.eduapp.backend.model.Quiz;
import com.eduapp.backend.repository.QuizRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuizService {

    private final QuizRepository quizRepository;

    public QuizService(QuizRepository quizRepository) {
        this.quizRepository = quizRepository;
    }

    public List<Quiz> findAll() {
        return quizRepository.findAll();
    }

    public Quiz findById(Long id) {
        return quizRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Quiz not found"));
    }
}
