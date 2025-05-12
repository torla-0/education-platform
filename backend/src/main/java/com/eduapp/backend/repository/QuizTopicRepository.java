package com.eduapp.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eduapp.backend.model.QuizTopic;

public interface QuizTopicRepository extends JpaRepository<QuizTopic, Long> {
}
