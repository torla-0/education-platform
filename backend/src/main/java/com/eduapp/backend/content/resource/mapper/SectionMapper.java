package com.eduapp.backend.content.resource.mapper;

import org.springframework.stereotype.Component;

import com.eduapp.backend.content.resource.dto.CreateSectionDto;
import com.eduapp.backend.content.resource.dto.SectionDto;
import com.eduapp.backend.content.resource.entity.LearningResource;
import com.eduapp.backend.content.resource.entity.Section;

@Component
public class SectionMapper {
    public Section toSection(CreateSectionDto dto, LearningResource resource) {
        return Section.builder()
            .title(dto.getTitle())
            .content(dto.getContent())
            .sectionOrder(dto.getSectionOrder())
            .resource(resource)
            .build();
    }

    public SectionDto toSectionDto(Section entity) {
        return SectionDto.builder()
            .id(entity.getId())
            .title(entity.getTitle())
            .content(entity.getContent())
            .sectionOrder(entity.getSectionOrder())
            .build();
    }
}
