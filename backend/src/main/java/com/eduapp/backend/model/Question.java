package com.eduapp.backend.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String text;

    private String correctAnswer;

    @ElementCollection
    private List<String> options;

    @ManyToOne
    @JoinColumn(name = "topic_id")
    @JsonBackReference
    private QuizTopic topic;


    // Prazan konstruktor (obavezan za JPA)
    public Question() {}

    // Konstruktor s parametrima
    public Question(String text, String correctAnswer, List<String> options, QuizTopic topic) {
        this.text = text;
        this.correctAnswer = correctAnswer;
        this.options = options;
        this.topic = topic;
    }

    // Getteri i setteri
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

    public List<String> getOptions() {
        return options;
    }

    public void setOptions(List<String> options) {
        this.options = options;
    }

    public QuizTopic getTopic() {
        return topic;
    }

    public void setTopic(QuizTopic topic) {
        this.topic = topic;
    }
}
