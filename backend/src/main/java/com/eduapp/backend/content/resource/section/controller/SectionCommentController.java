package com.eduapp.backend.content.resource.section.controller;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.content.resource.section.dto.CreateSectionCommentDto;
import com.eduapp.backend.content.resource.section.dto.SectionCommentDto;
import com.eduapp.backend.content.resource.section.service.SectionCommentService;
import com.eduapp.backend.user.entity.User;

@RestController
@RequestMapping("/api/sections/{sectionId}/comments")
public class SectionCommentController {

    private final SectionCommentService commentService;

    public SectionCommentController(SectionCommentService commentService) {
        this.commentService = commentService;
    }

    @GetMapping
    public List<SectionCommentDto> getComments(@PathVariable Long sectionId) {
        return commentService.getComments(sectionId);
    }

    @PostMapping
    public SectionCommentDto addComment(
            @PathVariable Long sectionId,
            @RequestBody CreateSectionCommentDto dto,
            Authentication authentication
    ) {
        User user = (User) authentication.getPrincipal();
        return commentService.addComment(sectionId, user, dto);
    }
}