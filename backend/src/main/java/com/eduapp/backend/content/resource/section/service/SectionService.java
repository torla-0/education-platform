package com.eduapp.backend.content.resource.section.service;

import org.springframework.stereotype.Service;

import com.eduapp.backend.content.resource.entity.LearningResource;
import com.eduapp.backend.content.resource.repository.LearningResourceRepository;
import com.eduapp.backend.content.resource.section.dto.CreateSectionDto;
import com.eduapp.backend.content.resource.section.dto.SectionDto;
import com.eduapp.backend.content.resource.section.entity.Section;
import com.eduapp.backend.content.resource.section.mapper.SectionMapper;
import com.eduapp.backend.content.resource.section.repository.SectionRepository;

import lombok.RequiredArgsConstructor;



@Service
@RequiredArgsConstructor
public class SectionService {

    private final SectionRepository sectionRepository;
    private final LearningResourceRepository resourceRepository;
    private final SectionMapper sectionMapper;
    /**
     * Creates a new section for a given learning resource.
     *
     * @param dto the data transfer object containing section details
     * @return the created section as a DTO
     */

    public SectionDto createSection(CreateSectionDto dto) {
        LearningResource resource = resourceRepository.findById(dto.getResourceId())
                .orElseThrow(() -> new RuntimeException("Resource not found"));

        Section section = sectionMapper.toSection(dto, resource);
        section = sectionRepository.save(section);

        return sectionMapper.toSectionDto(section);
    }
}