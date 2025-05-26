package com.eduapp.backend.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.dto.QuestionDto;
import com.eduapp.backend.dto.QuizTopicDto;
import com.eduapp.backend.model.Question;
import com.eduapp.backend.model.QuizTopic;
import com.eduapp.backend.service.QuestionService;
import com.eduapp.backend.service.QuizTopicService;

@RestController
@RequestMapping("/api/topics")
public class QuizTopicController {

    private final QuizTopicService topicService;
    private final QuestionService questionService;

    public QuizTopicController(QuizTopicService topicService, QuestionService questionService) {
        this.topicService = topicService;
        this.questionService = questionService;
    }

    @GetMapping
    public ResponseEntity<List<QuizTopicDto>> getAllTopics() {
        List<QuizTopic> topics = topicService.findAllTopics();
        List<QuizTopicDto> dtoList = topics.stream()
            .map(t -> new QuizTopicDto(t.getId(), t.getName()))
            .toList();
        return ResponseEntity.ok(dtoList);
    }


    @GetMapping("/{id}/questions")
    public ResponseEntity<List<QuestionDto>> getQuestionsByTopic(@PathVariable Long id) {
        List<Question> questions = questionService.findByTopicId(id);
        List<QuestionDto> dtoList = questions.stream()
            .map(q -> com.eduapp.backend.util.DtoMapper.toDto(q))
            .toList();
        return ResponseEntity.ok(dtoList);
    }

}
