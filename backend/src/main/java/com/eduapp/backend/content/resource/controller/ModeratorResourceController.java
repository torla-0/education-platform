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
import com.eduapp.backend.content.resource.dto.UpdateResourceDto;
import com.eduapp.backend.content.resource.service.LearningResourceService;
import com.eduapp.backend.user.entity.User;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/moderator/resources")
@PreAuthorize("hasRole('MODERATOR')")
public class ModeratorResourceController {

    private final LearningResourceService resourceService;

    public ModeratorResourceController(LearningResourceService resourceService) {
        this.resourceService = resourceService;
    }

    /**
     * GET /api/moderator/resources
     * @return list of resources created by the currently authenticated moderator
     */
    @GetMapping
    public List<ResourceDto> list() {
        String email = currentUserEmail();
        System.out.println("Controller: currentUserEmail = " + email);
        List<ResourceDto> list = resourceService.findByAuthor(email);
        System.out.println("Controller: resources returned = " + list.size());
        return list;
    }

    /**
     * POST /api/moderator/resources
     * Create a new learning resource.
     *
     * @param dto the payload containing resource details
     * @return the created ResourceDto
     */

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ResourceDto create(@RequestBody @Valid CreateResourceDto dto) {
        return resourceService.create(currentUserEmail(), dto);
    }

    /**
     * PUT /api/moderator/resources/{id}
     * Update an existing learning resource.
     *
     * @param id   the ID of the resource to update
     * @param dto  the payload containing updated resource details
     * @return the updated ResourceDto
     */
    @PutMapping("/{id}")
    public ResourceDto update(
            @PathVariable("id") Long id,
            @RequestBody @Valid UpdateResourceDto dto) {

        return resourceService.update(id, currentUserEmail(), dto);
    }

    /**
     * DELETE /api/moderator/resources/{id}
     * Delete a learning resource created by the currently authenticated moderator.
     *
     * @param id the ID of the resource to delete
     */
    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable("id") Long id) {
        resourceService.delete(id, currentUserEmail());
    }

    /** Helper to fetch authenticated user’s email from the security context */
    private String currentUserEmail() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof User user) {
            return user.getEmail();
        } else if (principal != null) {
            return principal.toString();
        } else {
            // Handle the case where principal is null
            // For example, you can return a default value or throw an exception
            return "Unknown";
        }
    }
}
