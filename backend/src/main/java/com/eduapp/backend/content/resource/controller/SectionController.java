package com.eduapp.backend.content.resource.controller;


import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.content.resource.dto.CreateSectionDto;
import com.eduapp.backend.content.resource.dto.SectionDto;
import com.eduapp.backend.content.resource.service.SectionService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/moderator/sections")
@RequiredArgsConstructor
@PreAuthorize("hasRole('MODERATOR')")
public class SectionController {

    private final SectionService sectionService;

    
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public SectionDto  addSection(@RequestBody CreateSectionDto dto) {
        return sectionService.createSection(dto);
    }
}