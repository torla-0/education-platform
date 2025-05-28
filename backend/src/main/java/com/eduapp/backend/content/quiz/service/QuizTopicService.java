package com.eduapp.backend.content.quiz.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.eduapp.backend.content.quiz.dto.QuizTopicDto;
import com.eduapp.backend.content.quiz.repository.QuizTopicRepository;

/**
 * Service for retrieving quiz topics and mapping to DTOs.
 */
@Service
public class QuizTopicService {

    private final QuizTopicRepository topicRepository;

    public QuizTopicService(QuizTopicRepository topicRepository) {
        this.topicRepository = topicRepository;
    }

    /**
     * Retrieve all quiz topics and convert to DTOs.
     */
    public List<QuizTopicDto> findAllTopics() {
        return topicRepository.findAll().stream()
            .map(topic -> new QuizTopicDto(topic.getId(), topic.getName()))
            .collect(Collectors.toList());
    }
}
