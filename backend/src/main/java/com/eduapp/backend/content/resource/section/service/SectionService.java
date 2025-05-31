package com.eduapp.backend.content.resource.section.service;

import java.util.List;
import java.util.NoSuchElementException;

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

    public SectionDto getSectionWithPrevNext(Long sectionId) {
        Section section = sectionRepository.findById(sectionId)
            .orElseThrow(() -> new NoSuchElementException("Section not found"));

        Long resourceId = section.getResource().getId();
        List<Section> sections = sectionRepository.findByResourceIdOrderBySectionOrderAsc(resourceId);

        Section prev = null, next = null;
        for (int i = 0; i < sections.size(); i++) {
            if (sections.get(i).getId().equals(sectionId)) {
                if (i > 0) prev = sections.get(i - 1);
                if (i < sections.size() - 1) next = sections.get(i + 1);
                break;
            }
        }

        SectionDto dto = new SectionDto();
        dto.setId(section.getId());
        dto.setTitle(section.getTitle());
        dto.setContent(section.getContent());
        dto.setPrevSectionId(prev != null ? prev.getId() : null);
        dto.setNextSectionId(next != null ? next.getId() : null);
        // Add author, updatedAt, etc if needed

        return dto;
    }
}