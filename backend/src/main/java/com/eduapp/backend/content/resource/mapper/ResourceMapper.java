package com.eduapp.backend.content.resource.mapper;

import java.time.Instant;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.stereotype.Component;

import com.eduapp.backend.content.resource.dto.CreateResourceDto;
import com.eduapp.backend.content.resource.dto.ResourceDto;
import com.eduapp.backend.content.resource.dto.UpdateResourceDto;
import com.eduapp.backend.content.resource.entity.LearningResource;
import com.eduapp.backend.content.resource.entity.enums.ResourceStatus;
import com.eduapp.backend.content.resource.section.mapper.SectionMapper;
import com.eduapp.backend.user.entity.User;
import com.eduapp.backend.user.repository.UserRepository;

@Component
public class ResourceMapper {

    private final SectionMapper sectionMapper;
    private final UserRepository userRepository;

    public ResourceMapper(SectionMapper sectionMapper, UserRepository userRepository) {
        this.sectionMapper = sectionMapper;
        this.userRepository = userRepository;
    }

    public ResourceDto toResourceDto(LearningResource entity) {
        List sectionDtos = entity.getSections() != null
                ? entity.getSections().stream()
                        .map(sectionMapper::toSectionDto)
                        .collect(Collectors.toList())
                : Collections.emptyList();

        String authorFirstName = null;
        String authorLastName = null;
        if (entity.getAuthorEmail() != null) {
            User author = userRepository.findByEmail(entity.getAuthorEmail()).orElse(null);
            if (author != null) {
                authorFirstName = author.getFirstName();
                authorLastName = author.getLastName();
            } else {
                authorFirstName = "Unknown";
                authorLastName = "";
            }
        }

        return ResourceDto.builder()
                .id(entity.getId())
                .title(entity.getTitle())
                .description(entity.getDescription())
                .url(entity.getUrl())
                .tags(entity.getTags() != null ? entity.getTags().toArray(new String[0]) : new String[0])
                .status(entity.getStatus().name())
                .createdAt(entity.getCreatedAt() != null ? entity.getCreatedAt().toString() : null)
                .updatedAt(entity.getUpdatedAt() != null ? entity.getUpdatedAt().toString() : null)
                .sections(sectionDtos)
                .authorEmail(entity.getAuthorEmail())
                .authorFirstName(authorFirstName)
                .authorLastName(authorLastName)
                .build();
    }

    public LearningResource toResourceEntity(String authorEmail, CreateResourceDto dto) {
        return LearningResource.builder()
                .authorEmail(authorEmail)
                .title(dto.getTitle())
                .description(dto.getDescription())
                .url(dto.getUrl())
                .tags(dto.getTags() != null ? Arrays.asList(dto.getTags()) : Collections.emptyList())
                .status(ResourceStatus.DRAFT)
                .createdAt(Instant.now())
                .updatedAt(Instant.now())
                .build();
    }

    public void updateEntityFromDto(LearningResource resource, UpdateResourceDto dto) {
        Optional.ofNullable(dto.getTitle()).map(String::trim).ifPresent(resource::setTitle);
        Optional.ofNullable(dto.getDescription()).map(String::trim).ifPresent(resource::setDescription);
        Optional.ofNullable(dto.getUrl()).map(String::trim).ifPresent(resource::setUrl);
        Optional.ofNullable(dto.getTags())
                .map(tags -> new ArrayList<>(new HashSet<>(tags)))
                .ifPresent(resource::setTags);
        Optional.ofNullable(dto.getStatus())
                .map(ResourceStatus::valueOf)
                .ifPresent(resource::setStatus);

        resource.setUpdatedAt(Instant.now());
    }

}
