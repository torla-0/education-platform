package com.eduapp.backend.content.quiz.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.eduapp.backend.content.quiz.entity.Question;
import com.eduapp.backend.content.quiz.repository.QuestionRepository;

@Service
public class QuestionService {

    private final QuestionRepository repository;

    public QuestionService(QuestionRepository repository) {
        this.repository = repository;
    }

    public List<Question> findByTopicId(Long topicId) {
        return repository.findByTopicId(topicId);
    }
}
