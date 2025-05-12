package com.eduapp.backend.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.eduapp.backend.model.Question;
import com.eduapp.backend.repository.QuestionRepository;

@Service
public class QuestionService {

    private final QuestionRepository questionRepository;

    public QuestionService(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    public List<Question> findByTopicId(Long topicId) {
        return questionRepository.findByTopicId(topicId);
    }

    public List<Question> findAll() {
    return questionRepository.findAll();
}

}
