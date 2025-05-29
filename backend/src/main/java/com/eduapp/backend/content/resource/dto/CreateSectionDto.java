package com.eduapp.backend.content.resource.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class CreateSectionDto {
    private String title;
    private String content;
    private int sectionOrder;
    private Long resourceId;
}