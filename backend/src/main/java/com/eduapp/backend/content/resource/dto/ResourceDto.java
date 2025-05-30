package com.eduapp.backend.content.resource.dto;

import java.util.List;

import com.eduapp.backend.content.resource.section.dto.SectionDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class ResourceDto {
    private Long id;
    private String title;
    private String url;
    private String[] tags;
    private String authorFirstName;
    private String authorLastName;
    private String status;
    private String createdAt;
    private String updatedAt;
    private List<SectionDto> sections;

}
