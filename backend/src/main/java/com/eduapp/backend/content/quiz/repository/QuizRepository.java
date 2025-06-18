package com.eduapp.backend.content.quiz.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eduapp.backend.content.quiz.entity.Quiz;

public interface QuizRepository extends JpaRepository<Quiz, Long> {

    List<Quiz> findByPublishedTrue();

    Optional<Quiz> findByIdAndPublishedTrue(Long id);

}
