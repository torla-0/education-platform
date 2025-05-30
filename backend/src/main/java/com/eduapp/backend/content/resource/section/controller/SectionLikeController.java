package com.eduapp.backend.content.resource.section.controller;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.content.resource.section.dto.SectionLikeDto;
import com.eduapp.backend.content.resource.section.service.SectionLikeService;
import com.eduapp.backend.user.entity.User;

@RestController
@RequestMapping("/api/sections/{sectionId}/like")
public class SectionLikeController {

    private final SectionLikeService likeService;

    public SectionLikeController(SectionLikeService likeService) {
        this.likeService = likeService;
    }

    @GetMapping
    public SectionLikeDto getLikeStatus(@PathVariable Long sectionId, Authentication authentication) {
        User user = (User) authentication.getPrincipal();
        return likeService.getLikeStatus(sectionId, user);
    }

    @PostMapping("/toggle")
    public void toggleLike(@PathVariable Long sectionId, Authentication authentication) {
        User user = (User) authentication.getPrincipal();
        likeService.toggleLike(sectionId, user);
    }
}
