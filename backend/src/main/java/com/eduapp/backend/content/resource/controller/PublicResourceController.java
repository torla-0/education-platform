package com.eduapp.backend.content.resource.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.content.resource.dto.ResourceDto;
import com.eduapp.backend.content.resource.service.LearningResourceService;

@RestController
@RequestMapping("/api/public/resources")
public class PublicResourceController {

    private final LearningResourceService resourceService;

    public PublicResourceController(LearningResourceService resourceService) {
        this.resourceService = resourceService;
    }

    @GetMapping
    public Page<ResourceDto> getAllPublicResources(
            @RequestParam(defaultValue = "") String search,
            @RequestParam(defaultValue = "ALL") String tag,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {
        Pageable pageable = PageRequest.of(page, size);
        return resourceService.getPublicResources(search, tag, pageable);
    }



    @GetMapping("/{id}")
    public ResourceDto getResourceById(@PathVariable Long id) {
        return resourceService.getPublicResourceById(id);
    }

}