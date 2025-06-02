package com.eduapp.backend.content.resource.section.controller;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.content.resource.section.dto.SectionBookmarkDto;
import com.eduapp.backend.content.resource.section.service.SectionBookmarkService;
import com.eduapp.backend.user.entity.User;

@RestController
@RequestMapping("/api/sections/{sectionId}/bookmark")
public class SectionBookmarkController {

    private final SectionBookmarkService bookmarkService;

    public SectionBookmarkController(SectionBookmarkService bookmarkService) {
        this.bookmarkService = bookmarkService;
    }

    @GetMapping
    public SectionBookmarkDto getBookmarkStatus(@PathVariable Long sectionId, Authentication authentication) {
        User user = (User) authentication.getPrincipal();
        return bookmarkService.getBookmarkStatus(sectionId, user);
    }

    @PostMapping("/toggle")
    public SectionBookmarkDto toggleBookmark(@PathVariable Long sectionId, Authentication authentication) {
        User user = (User) authentication.getPrincipal();
        bookmarkService.toggleBookmark(sectionId, user);
        return bookmarkService.getBookmarkStatus(sectionId, user);
    }
}
