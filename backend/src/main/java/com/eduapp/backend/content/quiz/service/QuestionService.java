package com.eduapp.backend.content.quiz.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eduapp.backend.content.quiz.dto.CreateQuestionDto;
import com.eduapp.backend.content.quiz.entity.Question;
import com.eduapp.backend.content.quiz.entity.QuestionOption;
import com.eduapp.backend.content.quiz.entity.Quiz;
import com.eduapp.backend.content.quiz.repository.QuestionRepository;
import com.eduapp.backend.content.quiz.repository.QuizRepository;

@Service
public class QuestionService {

    private final QuestionRepository questionRepository;
    private final QuizRepository quizRepository;

    public QuestionService(QuestionRepository repository, QuizRepository quizRepository) {
        this.questionRepository = repository;
        this.quizRepository = quizRepository;
    }

    public List<Question> findByTopicId(Long topicId) {
        return questionRepository.findByTopicId(topicId);
    }

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

}
