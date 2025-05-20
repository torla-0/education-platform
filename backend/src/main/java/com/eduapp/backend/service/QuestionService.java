package com.eduapp.backend.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.eduapp.backend.model.Question;
import com.eduapp.backend.repository.QuestionRepository;

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
