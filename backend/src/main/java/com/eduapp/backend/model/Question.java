package com.eduapp.backend.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "question")
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 500)
    private String text;

    @Column(nullable = false, length = 255)
    private String correctAnswer;

    @ManyToOne
    @JoinColumn(name = "topic_id", nullable = false)
    @JsonBackReference
    private QuizTopic topic;


    @OneToMany(mappedBy = "question", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonBackReference
    private List<QuestionOption> options;

    public Question() {}

    public Question(String text, String correctAnswer, QuizTopic topic) {
        this.text = text;
        this.correctAnswer = correctAnswer;
        this.topic = topic;
    }

    public Long getId() {
        return id;
    }

    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }
    public void setCorrectAnswer(String correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public QuizTopic getTopic() {
        return topic;
    }
    public void setTopic(QuizTopic topic) {
        this.topic = topic;
    }

    public List<QuestionOption> getOptions() {
        return options;
    }
    public void setOptions(List<QuestionOption> options) {
        this.options = options;
    }
}
