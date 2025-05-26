package com.eduapp.backend.content.quiz.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eduapp.backend.content.quiz.entity.Question;

public interface QuestionRepository extends JpaRepository<Question, Long> {
    List<Question> findByTopicId(Long topicId);
}
