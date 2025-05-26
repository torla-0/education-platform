package com.eduapp.backend.content.resource.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.content.resource.dto.CreateResourceDto;
import com.eduapp.backend.content.resource.dto.ResourceDto;
import com.eduapp.backend.content.resource.service.LearningResourceService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/moderator/resources")
@PreAuthorize("hasRole('MODERATOR')")
public class ModeratorController {

    private final LearningResourceService resourceService;

    public ModeratorController(LearningResourceService resourceService) {
        this.resourceService = resourceService;
    }

    @GetMapping
    public List<ResourceDto> list() {
        return resourceService.findByAuthor(currentUserEmail());
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ResourceDto create(@RequestBody @Valid CreateResourceDto dto) {
        return resourceService.create(currentUserEmail(), dto);
    }

    @PutMapping("/{id}")
    public ResourceDto update(
            @PathVariable("id") Long id,
            @RequestBody @Valid CreateResourceDto dto) {

        return resourceService.update(id, currentUserEmail(), dto);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable("id") Long id) {
        resourceService.delete(id, currentUserEmail());
    }

    /** Helper to fetch authenticated user’s email from the security context */
    private String currentUserEmail() {
        return SecurityContextHolder.getContext()
                                    .getAuthentication()
                                    .getName();
    }
}
