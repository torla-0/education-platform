package com.eduapp.backend.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.dto.QuestionDto;
import com.eduapp.backend.model.Question;
import com.eduapp.backend.model.QuestionOption;
import com.eduapp.backend.service.QuestionService;

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
        List<QuestionDto> dtoList = questions.stream().map(q ->
            new QuestionDto(
                q.getId(),
                q.getText(),
                q.getCorrectAnswer(),
                q.getOptions().stream().map(QuestionOption::getText).toList()
            )
        ).toList();
        return ResponseEntity.ok(dtoList);
    }

}
