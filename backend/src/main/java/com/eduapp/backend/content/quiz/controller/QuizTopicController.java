package com.eduapp.backend.content.quiz.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.content.quiz.dto.QuizTopicDto;
import com.eduapp.backend.content.quiz.service.QuestionService;
import com.eduapp.backend.content.quiz.service.QuizTopicService;

/**
 * Controller for quiz topics and associated questions.
 */
@RestController
@RequestMapping("/api/topics")
public class QuizTopicController {

    private final QuizTopicService topicService;
    private final QuestionService questionService;

    public QuizTopicController(QuizTopicService topicService,
            QuestionService questionService) {
        this.topicService = topicService;
        this.questionService = questionService;
    }

    /**
     * GET /api/topics
     *
     * @return list of all quiz topics as DTOs
     */
    @GetMapping
    public ResponseEntity<List<QuizTopicDto>> getAllTopics() {
        List<QuizTopicDto> dtoList = topicService.findAllTopics();
        return ResponseEntity.ok(dtoList);
    }

    // Maybe will need it in future
    /**
     * GET /api/topics/{id}/questions
     *
     * @param id topic ID
     * @return list of questions under the given topic as DTOs
     */
    // @GetMapping("/{id}/questions")
    // public ResponseEntity<List<QuestionDto>> getQuestionsByTopic(@PathVariable Long id) {
    //     List<Question> questions = questionService.findByTopicId(id);
    //     List<QuestionDto> dtoList = questions.stream()
    //             .map(QuestionDtoMapper::toDto)
    //             .toList();
    //     return ResponseEntity.ok(dtoList);
    // }
}
