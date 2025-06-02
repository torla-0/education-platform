package com.eduapp.backend.content.resource.section.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CreateSectionCommentDto {
    @NotBlank(message = "Comment cannot be empty")
    private String content;
}