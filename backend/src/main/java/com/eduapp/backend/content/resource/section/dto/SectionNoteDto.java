package com.eduapp.backend.content.resource.section.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class SectionNoteDto {
    private String noteContent;
    private LocalDateTime lastModified;
}