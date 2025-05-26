package com.eduapp.backend.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

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

    @ManyToOne
    @JoinColumn(name = "quiz_id", nullable = false)
    @JsonManagedReference
    private Quiz quiz;

    @ManyToOne
    @JoinColumn(name = "topic_id", nullable = false)
    @JsonBackReference
    private QuizTopic topic;


    @OneToMany(mappedBy = "question", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonBackReference
    private List<QuestionOption> options;

    public Question() {}

    public Question(String text, QuizTopic topic) {
        this.text = text;        
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
    public Quiz getQuiz() {
        return quiz;
    }

    public void setQuiz(Quiz quiz) {
        this.quiz = quiz;
    }

}
