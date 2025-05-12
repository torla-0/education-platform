package com.eduapp.backend.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.eduapp.backend.model.QuizTopic;
import com.eduapp.backend.repository.QuizTopicRepository;

@Service
public class QuizTopicService {

    private final QuizTopicRepository topicRepository;

    public QuizTopicService(QuizTopicRepository topicRepository) {
        this.topicRepository = topicRepository;
    }

    public List<QuizTopic> findAllTopics() {
        return topicRepository.findAll();
    }
}
