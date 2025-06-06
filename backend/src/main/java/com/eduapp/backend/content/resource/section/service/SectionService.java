package com.eduapp.backend.content.resource.section.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.NoSuchElementException;

import org.apache.velocity.exception.ResourceNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eduapp.backend.content.resource.entity.LearningResource;
import com.eduapp.backend.content.resource.repository.LearningResourceRepository;
import com.eduapp.backend.content.resource.section.dto.CreateSectionDto;
import com.eduapp.backend.content.resource.section.dto.SectionDto;
import com.eduapp.backend.content.resource.section.dto.UpdateSectionDto;
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
    private final SectionReorderingService sectionReorderingService;

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

    /**
     * Gets a section with the previous and next section in the same learning
     * resource.
     *
     * @param sectionId the ID of the section to get
     * @return a SectionDto containing the ID, title, content, previous section
     * ID, and next section ID
     */
    public SectionDto getSectionWithPrevNext(Long sectionId) {
        Section section = sectionRepository.findById(sectionId)
                .orElseThrow(() -> new NoSuchElementException("Section not found"));

        Long resourceId = section.getResource().getId();
        List<Section> sections = sectionRepository.findByResourceIdOrderBySectionOrderAsc(resourceId);

        Section prev = null, next = null;
        for (int i = 0; i < sections.size(); i++) {
            if (sections.get(i).getId().equals(sectionId)) {
                if (i > 0) {
                    prev = sections.get(i - 1);
                }
                if (i < sections.size() - 1) {
                    next = sections.get(i + 1);
                }
                break;
            }
        }

        SectionDto dto = new SectionDto();
        dto.setId(section.getId());
        dto.setTitle(section.getTitle());
        dto.setContent(section.getContent());
        dto.setSectionOrder(section.getSectionOrder());
        dto.setPublished(section.isPublished());
        dto.setPrevSectionId(prev != null ? prev.getId() : null);
        dto.setNextSectionId(next != null ? next.getId() : null);
        // Add author, updatedAt, etc if needed

        return dto;
    }

    /**
     * Updates an existing section with new details.
     *
     * @param id the ID of the section to update
     * @param dto the data transfer object containing updated section details
     * @return the updated section as a DTO
     * @throws ResourceNotFoundException if the section is not found
     */
    @Transactional
    public SectionDto updateSection(Long id, UpdateSectionDto dto) {
        Section section = sectionRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Section not found"));

        section.setTitle(dto.getTitle());
        section.setContent(dto.getContent());
        section.setSectionOrder(dto.getSectionOrder());
        section.setPublished(dto.isPublished());
        section.setUpdatedAt(LocalDateTime.now());
        return sectionMapper.toSectionDto(sectionRepository.save(section));
    }

    /**
     * Deletes a section by its ID.
     *
     * @param id the ID of the section to be deleted
     */
    @Transactional
    public void deleteSection(Long id) {
        sectionRepository.deleteById(id);
    }

    /**
     * Moves a section up one order in its resource.
     *
     * @param id the ID of the section to move up
     */
    @Transactional
    public void moveSectionUp(Long id) {
        sectionReorderingService.moveUp(id);
    }

    /**
     * Moves a section down one order in its resource.
     *
     * @param id the ID of the section to move down
     */
    @Transactional
    public void moveSectionDown(Long id) {
        sectionReorderingService.moveDown(id);
    }

    /**
     * Sets the published status of a section.
     *
     * @param id the ID of the section to update
     * @param published the new published status
     * @throws ResourceNotFoundException if the section is not found
     */
    @Transactional
    public void setPublished(Long id, boolean published) {
        Section section = sectionRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Section not found"));
        section.setPublished(published);
        section.setUpdatedAt(LocalDateTime.now());
    }

}
