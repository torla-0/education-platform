package com.eduapp.backend.content.quiz.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eduapp.backend.content.quiz.dto.CreateQuizDto;
import com.eduapp.backend.content.quiz.dto.QuizDto;
import com.eduapp.backend.content.quiz.dto.UpdateQuizDto;
import com.eduapp.backend.content.quiz.entity.Quiz;
import com.eduapp.backend.content.quiz.entity.QuizTopic;
import com.eduapp.backend.content.quiz.mapper.QuizDtoMapper;
import com.eduapp.backend.content.quiz.repository.QuestionRepository;
import com.eduapp.backend.content.quiz.repository.QuizRepository;
import com.eduapp.backend.content.quiz.repository.QuizTopicRepository;

import lombok.AllArgsConstructor;

/**
 * Service for managing quizzes. Provides methods to create, update, delete, and
 * retrieve quizzes. Also includes methods to retrieve quizzes by their
 * published status.
 */
@AllArgsConstructor
@Service
public class QuizService {

    private final QuizRepository quizRepository;
    private final QuizTopicRepository topicRepository;
    private final QuestionRepository questionRepository;

    /**
     * Retrieve all published quizzes and convert to DTOs.
     *
     * @return list of published quizzes as DTOs
     */
    public List<QuizDto> findAllPublished() {
        return quizRepository.findByPublishedTrue()
                .stream()
                .map(QuizDtoMapper::toQuizDto)
                .collect(Collectors.toList());

    }

    /**
     * Retrieve a published quiz by its ID and convert to DTO.
     *
     * @param id the ID of the quiz
     * @return the published quiz as a DTO, or throws an exception if not found
     */
    public QuizDto findPublishedById(Long id) {
        Quiz quiz = quizRepository.findByIdAndPublishedTrue(id)
                .orElseThrow(() -> new RuntimeException("Quiz not found or not published"));
        return QuizDtoMapper.toQuizDto(quiz);
    }

    /**
     * Retrieve all quizzes and convert to DTOs.
     */
    public List<QuizDto> findAll() {
        return quizRepository.findAll().stream()
                .map(QuizDtoMapper::toQuizDto)
                .collect(Collectors.toList());
    }

    /**
     * Retrieve a single quiz by ID and convert to DTO.
     *
     * @throws RuntimeException if not found
     */
    public QuizDto findById(Long id) {
        Quiz quiz = quizRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Quiz not found: " + id));
        return QuizDtoMapper.toQuizDto(quiz);
    }

    /**
     * Create a new quiz and save it to the repository.
     *
     * @param dto the data transfer object containing the quiz details
     * @return the created quiz as a DTO
     * @throws RuntimeException if the topic is not found
     */
    @Transactional
    public QuizDto createQuiz(CreateQuizDto dto) {
        QuizTopic topic = topicRepository.findById(dto.getTopicId())
                .orElseThrow(() -> new RuntimeException("Topic not found"));

        Quiz quiz = new Quiz();
        quiz.setTitle(dto.getTitle());
        quiz.setTopic(topic);
        quiz.setQuestions(new ArrayList<>());
        quiz.setTotalQuestions(0);

        Quiz saved = quizRepository.save(quiz);
        return QuizDtoMapper.toQuizDto(saved);
    }

    /**
     * Update a quiz with the given ID using the provided DTO.
     *
     * @param id the ID of the quiz to update
     * @param dto the DTO containing the updated title and published status
     * @return the updated quiz as a DTO
     * @throws RuntimeException if the quiz is not found
     */
    @Transactional
    public QuizDto updateQuiz(Long id, UpdateQuizDto dto) {
        Quiz quiz = quizRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Quiz not found"));

        quiz.setTitle(dto.getTitle());
        quiz.setPublished(dto.isPublished());
        return QuizDtoMapper.toQuizDto(quiz);
    }

    @Transactional
    /**
     * Delete a quiz by its ID.
     *
     * @param quizId the ID of the quiz to delete
     */
    public void deleteQuiz(Long quizId) {
        quizRepository.deleteById(quizId);
    }

    /**
     * Updates the total number of questions for the quiz.
     *
     * @param quizId the ID of the quiz to update
     */
    @Transactional
    public void updateTotalQuestions(Long quizId) {
        long count = questionRepository.countByQuizId(quizId);
        quizRepository.findById(quizId).ifPresent(quiz -> {
            quiz.setTotalQuestions(count);
            quizRepository.save(quiz);
        });
    }
}
