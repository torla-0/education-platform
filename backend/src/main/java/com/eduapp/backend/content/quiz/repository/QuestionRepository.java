package com.eduapp.backend.content.quiz.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.eduapp.backend.content.quiz.entity.Question;

public interface QuestionRepository extends JpaRepository<Question, Long> {

    List<Question> findByQuizId(Long topicId);

    @Query("SELECT q FROM Question q WHERE q.quiz.id = :quizId ORDER BY function('RAND')")
    List<Question> findRandomByQuizId(@Param("quizId") Long quizId, Pageable pageable);

    long countByQuizId(long quizId);

}
