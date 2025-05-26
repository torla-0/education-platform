package com.eduapp.backend.content.quiz.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.content.quiz.dto.QuizDto;
import com.eduapp.backend.content.quiz.service.QuizService;

/**
 * Controller for quizzes.
 */
@RestController
@RequestMapping("/api/quizzes")
public class QuizController {

    private final QuizService quizService;

    public QuizController(QuizService quizService) {
        this.quizService = quizService;
    }

    /**
     * GET /api/quizzes
     * @return list of all quizzes as DTOs
     */
    @GetMapping
    public ResponseEntity<List<QuizDto>> getAllQuizzes() {
        List<QuizDto> dtoList = quizService.findAll();
        return ResponseEntity.ok(dtoList);
    }

    /**
     * GET /api/quizzes/{id}
     * @param id quiz ID
     * @return quiz detail as DTO
     */
    @GetMapping("/{id}")
    public ResponseEntity<QuizDto> getQuizById(@PathVariable Long id) {
        QuizDto dto = quizService.findById(id);
        return ResponseEntity.ok(dto);
    }
}
