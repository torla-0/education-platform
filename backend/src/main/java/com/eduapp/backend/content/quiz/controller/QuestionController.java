package com.eduapp.backend.content.quiz.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.content.quiz.dto.QuestionDto;
import com.eduapp.backend.content.quiz.service.QuestionService;

@RestController
@RequestMapping("/api/questions")
public class QuestionController {

    private final QuestionService service;

    public QuestionController(QuestionService service) {
        this.service = service;
    }

    @GetMapping("/quizzes/{id}/questions")
    public ResponseEntity<List<QuestionDto>> getQuestionsByQuiz(@PathVariable Long id) {
        List<QuestionDto> dtoList = service.getByQuizId(id);
        return ResponseEntity.ok(dtoList);
    }

}
