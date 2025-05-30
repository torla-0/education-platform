package com.eduapp.backend.content.resource.section.controller;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.content.resource.section.dto.SectionNoteDto;
import com.eduapp.backend.content.resource.section.service.SectionNoteService;
import com.eduapp.backend.user.entity.User;

@RestController
@RequestMapping("/api/sections/{sectionId}/note")
public class SectionNoteController {

    private final SectionNoteService noteService;

    public SectionNoteController(SectionNoteService noteService) {
        this.noteService = noteService;
    }

    @GetMapping
    public SectionNoteDto getUserNote(@PathVariable Long sectionId, Authentication authentication) {
        User user = (User) authentication.getPrincipal();
        return noteService.getUserNote(sectionId, user);
    }

    @PostMapping
    public SectionNoteDto saveUserNote(
            @PathVariable Long sectionId,
            @RequestBody String noteContent,
            Authentication authentication
    ) {
        User user = (User) authentication.getPrincipal();
        return noteService.saveUserNote(sectionId, user, noteContent);
    }
}
