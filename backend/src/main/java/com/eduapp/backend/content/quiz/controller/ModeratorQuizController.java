package com.eduapp.backend.content.quiz.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.content.quiz.dto.CreateQuestionDto;
import com.eduapp.backend.content.quiz.dto.CreateQuizDto;
import com.eduapp.backend.content.quiz.dto.QuizDto;
import com.eduapp.backend.content.quiz.dto.UpdateQuizDto;
import com.eduapp.backend.content.quiz.entity.Question;
import com.eduapp.backend.content.quiz.service.QuestionService;
import com.eduapp.backend.content.quiz.service.QuizService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/moderator/quizzes")
@RequiredArgsConstructor
@PreAuthorize("hasRole('MODERATOR')")
public class ModeratorQuizController {

    private final QuizService quizService;
    private final QuestionService questionService;

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public QuizDto createQuiz(@RequestBody CreateQuizDto dto) {
        return quizService.createQuiz(dto);
    }

    @GetMapping
    public List<QuizDto> listAll() {
        return quizService.findAll();
    }

    @GetMapping("/{id}")
    public QuizDto getOne(@PathVariable Long id) {
        return quizService.findById(id);
    }

    @PostMapping("/{quizId}/questions")
    @ResponseStatus(HttpStatus.CREATED)
    public Question addQuestion(@PathVariable Long quizId, @RequestBody CreateQuestionDto dto) {
        return questionService.addQuestionToQuiz(quizId, dto);
    }

    @PutMapping("/{quizId}")
    public QuizDto updateQuiz(@PathVariable Long quizId, @RequestBody UpdateQuizDto dto) {
        return quizService.updateQuiz(quizId, dto);
    }

    @DeleteMapping("/{quizId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteQuiz(@PathVariable Long quizId) {
        quizService.deleteQuiz(quizId);
    }

}
