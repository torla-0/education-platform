package com.eduapp.backend.content.resource.mapper;

import java.util.Arrays;

import org.springframework.stereotype.Component;

import com.eduapp.backend.content.resource.dto.CreateResourceDto;
import com.eduapp.backend.content.resource.dto.ResourceDto;
import com.eduapp.backend.content.resource.entity.LearningResource;
import com.eduapp.backend.content.resource.entity.enums.ResourceStatus;

@Component
public class ResourceMapper {

    public ResourceDto toResourceDto(LearningResource entity) {
        ResourceDto dto = new ResourceDto();
        dto.setId(entity.getId());
        dto.setTitle(entity.getTitle());
        dto.setUrl(entity.getUrl());
        dto.setTags(entity.getTags().toArray(new String[0]));
        dto.setAuthorEmail(entity.getAuthorEmail());
        dto.setStatus(entity.getStatus().name());
        dto.setCreatedAt(entity.getCreatedAt().toString());
        dto.setUpdatedAt(entity.getUpdatedAt().toString());
        return dto;
    }

    public LearningResource toResourceEntity(String authorEmail, CreateResourceDto dto) {
        LearningResource entity = new LearningResource();
        entity.setAuthorEmail(authorEmail);
        entity.setTitle(dto.getTitle());
        entity.setUrl(dto.getUrl());
        entity.setTags(Arrays.asList(dto.getTags()));
        entity.setStatus(ResourceStatus.DRAFT);
        return entity;
    }
}