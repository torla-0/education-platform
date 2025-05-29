package com.eduapp.backend.content.resource.mapper;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Component;

import com.eduapp.backend.content.resource.dto.CreateResourceDto;
import com.eduapp.backend.content.resource.dto.ResourceDto;
import com.eduapp.backend.content.resource.entity.LearningResource;
import com.eduapp.backend.content.resource.entity.enums.ResourceStatus;

@Component
public class ResourceMapper {

    private final SectionMapper sectionMapper;

    public ResourceMapper(SectionMapper sectionMapper) {
        this.sectionMapper = sectionMapper;
    }

    public ResourceDto toResourceDto(LearningResource entity) {
        List sectionDtos = entity.getSections() != null
                ? entity.getSections().stream()
                    .map(sectionMapper::toSectionDto)
                    .collect(Collectors.toList())
                : Collections.emptyList();

        return ResourceDto.builder()
            .id(entity.getId())
            .title(entity.getTitle())
            .url(entity.getUrl())
            .tags(entity.getTags() != null ? entity.getTags().toArray(new String[0]) : new String[0])
            .authorEmail(entity.getAuthorEmail())
            .status(entity.getStatus().name())
            .createdAt(entity.getCreatedAt() != null ? entity.getCreatedAt().toString() : null)
            .updatedAt(entity.getUpdatedAt() != null ? entity.getUpdatedAt().toString() : null)
            .sections(sectionDtos)
            .build();
    }

    public LearningResource toResourceEntity(String authorEmail, CreateResourceDto dto) {
        return LearningResource.builder()
            .authorEmail(authorEmail)
            .title(dto.getTitle())
            .url(dto.getUrl())
            .tags(dto.getTags() != null ? Arrays.asList(dto.getTags()) : Collections.emptyList())
            .status(ResourceStatus.DRAFT)
            .build();
    }
}
