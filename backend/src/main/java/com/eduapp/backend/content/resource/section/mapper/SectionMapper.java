package com.eduapp.backend.content.resource.section.mapper;

import org.springframework.stereotype.Component;

import com.eduapp.backend.content.resource.entity.LearningResource;
import com.eduapp.backend.content.resource.section.dto.CreateSectionDto;
import com.eduapp.backend.content.resource.section.dto.SectionDto;
import com.eduapp.backend.content.resource.section.entity.Section;

@Component
public class SectionMapper {

    public Section toSection(CreateSectionDto dto, LearningResource resource) {
        return Section.builder()
                .title(dto.getTitle())
                .content(dto.getContent())
                .sectionOrder(dto.getSectionOrder())
                .published(dto.isPublished())
                .resource(resource)
                .build();
    }

    public SectionDto toSectionDto(Section entity) {
        return SectionDto.builder()
                .id(entity.getId())
                .title(entity.getTitle())
                .content(entity.getContent())
                .sectionOrder(entity.getSectionOrder())
                .published(entity.isPublished())
                .createdAt(entity.getCreatedAt())
                .updatedAt(entity.getUpdatedAt())
                .build();
    }
}
