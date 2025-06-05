package com.eduapp.backend.content.resource.section.dto;

import java.time.LocalDateTime;

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
public class SectionDto {

    private Long id;
    private String title;
    private String content;
    private Integer sectionOrder;
    private boolean published;

    private Long prevSectionId;
    private Long nextSectionId;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
