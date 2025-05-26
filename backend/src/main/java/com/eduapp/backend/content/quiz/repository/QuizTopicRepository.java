package com.eduapp.backend.content.quiz.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eduapp.backend.content.quiz.entity.QuizTopic;

public interface QuizTopicRepository extends JpaRepository<QuizTopic, Long> {
}
