package com.eduapp.backend.content.resource.section.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.content.resource.section.dto.SectionDto;
import com.eduapp.backend.content.resource.section.service.SectionService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/sections")
@PreAuthorize("hasRole('USER')")
public class SectionOverviewController {

    private final SectionService sectionService;

    
    @GetMapping("/{id}")
    public ResponseEntity<SectionDto> getSection(@PathVariable Long id) {
        SectionDto dto = sectionService.getSectionWithPrevNext(id);
        return ResponseEntity.ok(dto);
    }
    
}
