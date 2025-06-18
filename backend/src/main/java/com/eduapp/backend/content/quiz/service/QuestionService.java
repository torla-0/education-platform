package com.eduapp.backend.content.quiz.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eduapp.backend.content.quiz.dto.CreateQuestionDto;
import com.eduapp.backend.content.quiz.dto.QuestionDto;
import com.eduapp.backend.content.quiz.entity.Question;
import com.eduapp.backend.content.quiz.entity.QuestionOption;
import com.eduapp.backend.content.quiz.entity.Quiz;
import com.eduapp.backend.content.quiz.mapper.QuestionDtoMapper;
import com.eduapp.backend.content.quiz.repository.QuestionRepository;
import com.eduapp.backend.content.quiz.repository.QuizRepository;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class QuestionService {

    private final QuestionRepository questionRepository;
    private final QuizRepository quizRepository;

    /**
     * Get all questions for the given quiz.
     *
     * @param quizId the ID of the quiz
     * @return list of questions as DTOs
     */
    public List<QuestionDto> getByQuizId(Long quizId) {
        List<Question> questions = questionRepository.findByQuizId(quizId);
        return questions.stream()
                .map(QuestionDtoMapper::toDto)
                .toList();

    }

    /**
     * Create a new question for a quiz with the given ID.
     *
     * @param quizId the ID of the quiz
     * @param dto the data transfer object containing the question details
     * @return the created question
     * @throws RuntimeException if the quiz is not found
     */
    @Transactional
    public Question addQuestionToQuiz(Long quizId, CreateQuestionDto dto) {
        Quiz quiz = quizRepository.findById(quizId)
                .orElseThrow(() -> new RuntimeException("Quiz not found"));

        Question question = new Question();
        question.setQuiz(quiz);
        question.setTopic(quiz.getTopic());
        question.setText(dto.getText());

        List<QuestionOption> options = dto.getOptions().stream().map(optDto -> {
            QuestionOption option = new QuestionOption();
            option.setText(optDto.getText());
            option.setCorrect(optDto.isCorrect());
            option.setQuestion(question);
            return option;
        }).collect(Collectors.toList());

        question.setOptions(options);
        return questionRepository.save(question);
    }

    /**
     * Get a list of random questions for the given quiz, up to the given count.
     *
     * @param quizId the ID of the quiz
     * @param count the number of questions to return
     * @return list of question DTOs
     */
    public List<QuestionDto> getRandomQuestionsByQuizId(Long quizId, int count) {
        Pageable limit = PageRequest.of(0, count);
        List<Question> questions = questionRepository.findRandomByQuizId(quizId, limit);
        return questions.stream()
                .map(QuestionDtoMapper::toDto)
                .toList();
    }

}
