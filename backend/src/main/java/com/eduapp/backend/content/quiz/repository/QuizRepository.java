package com.eduapp.backend.content.quiz.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eduapp.backend.content.quiz.entity.Quiz;

public interface QuizRepository extends JpaRepository<Quiz, Long> {
}
