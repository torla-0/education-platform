package com.eduapp.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eduapp.backend.model.Quiz;

public interface QuizRepository extends JpaRepository<Quiz, Long> {
}
