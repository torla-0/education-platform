package com.eduapp.backend.content.resource.section.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UpdateSectionDto {

    private String title;
    private String content;
    private Integer sectionOrder;
    private boolean published;
}
