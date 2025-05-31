package com.eduapp.backend.content.resource.section.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eduapp.backend.content.resource.section.entity.Section;


public interface SectionRepository extends JpaRepository<Section, Long> {
    List<Section> findByResourceIdOrderBySectionOrderAsc(Long resourceId);
}