package com.eduapp.backend.controller;

import com.eduapp.backend.dto.QuizDto;
import com.eduapp.backend.model.Quiz;
import com.eduapp.backend.service.QuizService;
import com.eduapp.backend.util.DtoMapper;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/quizzes")
public class QuizController {

    private final QuizService quizService;

    public QuizController(QuizService quizService) {
        this.quizService = quizService;
    }

    @GetMapping
    public ResponseEntity<List<QuizDto>> getAllQuizzes() {
        List<Quiz> quizzes = quizService.findAll();
        List<QuizDto> dtoList = quizzes.stream()
            .map(DtoMapper::toDto)
            .collect(Collectors.toList());
        return ResponseEntity.ok(dtoList);
    }

    @GetMapping("/{id}")
    public ResponseEntity<QuizDto> getQuizById(@PathVariable Long id) {
        Quiz quiz = quizService.findById(id);
        QuizDto dto = DtoMapper.toDto(quiz);
        return ResponseEntity.ok(dto);
    }
}
