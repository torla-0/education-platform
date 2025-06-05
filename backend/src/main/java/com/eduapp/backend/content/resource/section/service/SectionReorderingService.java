package com.eduapp.backend.content.resource.section.service;

import org.springframework.stereotype.Service;

import com.eduapp.backend.content.resource.section.entity.Section;
import com.eduapp.backend.content.resource.section.repository.SectionRepository;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SectionReorderingService {

    private final SectionRepository sectionRepository;

    @Transactional
    public void moveUp(Long sectionId) {
        Section section = sectionRepository.findById(sectionId).orElseThrow();
        Section above = sectionRepository.findFirstByResourceIdAndSectionOrderLessThanOrderBySectionOrderDesc(
                section.getResource().getId(), section.getSectionOrder()).orElse(null);
        if (above != null) {
            int temp = section.getSectionOrder();
            section.setSectionOrder(above.getSectionOrder());
            above.setSectionOrder(temp);
            sectionRepository.save(section);
            sectionRepository.save(above);
        }
    }

    @Transactional
    public void moveDown(Long sectionId) {
        Section section = sectionRepository.findById(sectionId).orElseThrow();
        Section below = sectionRepository.findFirstByResourceIdAndSectionOrderGreaterThanOrderBySectionOrderAsc(
                section.getResource().getId(), section.getSectionOrder()).orElse(null);
        if (below != null) {
            int temp = section.getSectionOrder();
            section.setSectionOrder(below.getSectionOrder());
            below.setSectionOrder(temp);
            sectionRepository.save(section);
            sectionRepository.save(below);
        }
    }
}
