package com.eduapp.backend.content.resource.dto;

import lombok.Data;

@Data
public class SectionDto {
    private Long id; 
    private String heading;
    private String content;
    private Integer sectionOrder;
}
