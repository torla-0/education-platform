package com.eduapp.backend.content.quiz.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.content.quiz.dto.QuestionDto;
import com.eduapp.backend.content.quiz.dto.QuizDto;
import com.eduapp.backend.content.quiz.service.QuestionService;
import com.eduapp.backend.content.quiz.service.QuizService;

import lombok.AllArgsConstructor;

/**
 * Controller for quizzes.
 */
@RestController
@RequestMapping("/api/quizzes")
@AllArgsConstructor
public class QuizController {

    private final QuizService quizService;
    private final QuestionService questionService;

    /**
     * Retrieve all published quizzes.
     *
     * @return list of published quizzes as DTOs
     */
    @GetMapping
    public ResponseEntity<List<QuizDto>> getAllPublishedQuizzes() {
        List<QuizDto> dtoList = quizService.findAllPublished();
        return ResponseEntity.ok(dtoList);
    }

    /**
     * Retrieve a published quiz by its ID and convert to DTO.
     *
     * @param id the ID of the quiz
     * @return the published quiz as a DTO, or throws an exception if not found
     */

    @GetMapping("/{id}")
    public ResponseEntity<QuizDto> getPublishedQuizById(@PathVariable Long id) {
        QuizDto dto = quizService.findPublishedById(id);
        return ResponseEntity.ok(dto);
    }

    /**
     * GET /api/quizzes/{quizId}/questions
     *
     * @param quizId the ID of the quiz
     * @return list of questions as DTOs for the specified quiz
     */
    // @GetMapping("/{quizId}/questions")
    // public List<QuestionDto> getByQuizId(@PathVariable Long quizId) {
    //     return questionService.getByQuizId(quizId);
    // }
    /**
     * GET /api/quizzes/{quizId}/questions
     *
     * @param quizId the ID of the quiz
     * @param count the number of questions to return (default: 10)
     * @return list of random questions as DTOs for the specified quiz, up to
     * the specified count
     */
    @GetMapping("/{quizId}/questions")
    public List<QuestionDto> getRandomQuestionsForQuiz(
            @PathVariable Long quizId,
            @RequestParam(defaultValue = "10") int count) {
        return questionService.getRandomQuestionsByQuizId(quizId, count);
    }

}
