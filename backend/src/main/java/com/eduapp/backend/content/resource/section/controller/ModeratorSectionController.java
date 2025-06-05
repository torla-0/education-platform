package com.eduapp.backend.content.resource.section.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.content.resource.section.dto.SectionDto;
import com.eduapp.backend.content.resource.section.dto.UpdateSectionDto;
import com.eduapp.backend.content.resource.section.service.SectionService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/mod/sections")
@RequiredArgsConstructor
@PreAuthorize("hasRole('MODERATOR')")
public class ModeratorSectionController {

    private final SectionService sectionService;

    @PutMapping("/{id}")
    public ResponseEntity<SectionDto> updateSection(@PathVariable Long id,
            @RequestBody UpdateSectionDto dto) {
        return ResponseEntity.ok(sectionService.updateSection(id, dto));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteSection(@PathVariable Long id) {
        sectionService.deleteSection(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/{id}/move-up")
    public ResponseEntity<Void> moveUp(@PathVariable Long id) {
        sectionService.moveSectionUp(id);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/{id}/move-down")
    public ResponseEntity<Void> moveDown(@PathVariable Long id) {
        sectionService.moveSectionDown(id);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/{id}/publish")
    public ResponseEntity<Void> publish(@PathVariable Long id) {
        sectionService.setPublished(id, true);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/{id}/unpublish")
    public ResponseEntity<Void> unpublish(@PathVariable Long id) {
        sectionService.setPublished(id, false);
        return ResponseEntity.ok().build();
    }
}
