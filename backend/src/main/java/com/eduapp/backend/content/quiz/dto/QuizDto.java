package com.eduapp.backend.content.quiz.dto;

import java.time.Instant;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QuizDto {

    private Long id;
    private String title;
    private Long topicId;
    private String topicName;
    private boolean published;
    private Instant createdAt;
    private Instant updatedAt;

}
