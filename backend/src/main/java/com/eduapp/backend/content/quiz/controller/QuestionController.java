package com.eduapp.backend.content.quiz.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.content.quiz.dto.QuestionDto;
import com.eduapp.backend.content.quiz.entity.Question;
import com.eduapp.backend.content.quiz.mapper.QuizDtoMapper;
import com.eduapp.backend.content.quiz.service.QuestionService;

@RestController
@RequestMapping("/api/questions")
public class QuestionController {

    private final QuestionService service;

    public QuestionController(QuestionService service) {
        this.service = service;
    }

    @GetMapping("/topics/{id}/questions")
    public ResponseEntity<List<QuestionDto>> getQuestionsByTopic(@PathVariable Long id) {
        List<Question> questions = service.findByTopicId(id);
        List<QuestionDto> dtoList = questions.stream()            
            .map(QuizDtoMapper::toQuestionDto)
            .collect(Collectors.toList());

        return ResponseEntity.ok(dtoList);
    }
}
