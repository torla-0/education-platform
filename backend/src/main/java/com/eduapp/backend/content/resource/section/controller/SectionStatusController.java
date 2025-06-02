package com.eduapp.backend.content.resource.section.controller;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.content.resource.section.dto.SectionStatusDto;
import com.eduapp.backend.content.resource.section.service.SectionStatusService;
import com.eduapp.backend.user.entity.User;
@RestController
@RequestMapping("/api/sections/{sectionId}/status")
public class SectionStatusController {

    private final SectionStatusService sectionStatusService;

    public SectionStatusController(SectionStatusService sectionStatusService) {
        this.sectionStatusService = sectionStatusService;
    }

    @GetMapping
    public SectionStatusDto getStatus(@PathVariable Long sectionId, Authentication authentication) {
        User user = (User) authentication.getPrincipal();
        return sectionStatusService.getStatus(sectionId, user);
    }
}
