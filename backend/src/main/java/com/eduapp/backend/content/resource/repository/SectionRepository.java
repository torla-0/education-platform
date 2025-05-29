package com.eduapp.backend.content.resource.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eduapp.backend.content.resource.entity.Section;


public interface SectionRepository extends JpaRepository<Section, Long> {
    
}