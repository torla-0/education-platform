package com.eduapp.backend.content.resource.service;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.velocity.exception.ResourceNotFoundException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import com.eduapp.backend.content.resource.dto.CreateResourceDto;
import com.eduapp.backend.content.resource.dto.ResourceDto;
import com.eduapp.backend.content.resource.dto.UpdateResourceDto;
import com.eduapp.backend.content.resource.entity.LearningResource;
import com.eduapp.backend.content.resource.mapper.ResourceMapper;
import com.eduapp.backend.content.resource.repository.LearningResourceRepository;
import com.eduapp.backend.content.resource.spec.LearningResourceSpecification;

@Service
public class LearningResourceServiceImpl implements LearningResourceService {

    private final LearningResourceRepository resourceRepository;
    private final ResourceMapper mapper;

    public LearningResourceServiceImpl(LearningResourceRepository resourceRepository,
            ResourceMapper mapper) {
        this.resourceRepository = resourceRepository;
        this.mapper = mapper;
    }

    @Override
    public List<ResourceDto> findByAuthor(String authorEmail) {
        return resourceRepository.findAllByAuthorEmail(authorEmail).stream()
                .map(mapper::toResourceDto)
                .collect(Collectors.toList());
    }

    @Override
    public ResourceDto create(String authorEmail, CreateResourceDto dto) {
        LearningResource entity = mapper.toResourceEntity(authorEmail, dto);
        LearningResource saved = resourceRepository.save(entity);
        return mapper.toResourceDto(saved);
    }

    @Override
    @Transactional
    public ResourceDto update(Long id, String userEmail, UpdateResourceDto dto) {
        LearningResource resource = resourceRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Resource not found"));

        if (!resource.getAuthorEmail().equals(userEmail)) {
            throw new AccessDeniedException("Not allowed to edit");
        }

        mapper.updateEntityFromDto(resource, dto);

        LearningResource saved = resourceRepository.save(resource);
        return mapper.toResourceDto(saved);
    }

    @Override
    @Transactional
    public void delete(Long id, String authorEmail) {
        LearningResource entity = resourceRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(
                HttpStatus.NOT_FOUND,
                String.format("Learning Resource not found with id='%s'", id)));

        if (!entity.getAuthorEmail().equals(authorEmail)) {
            throw new ResponseStatusException(
                    HttpStatus.FORBIDDEN,
                    "You are not the author of this resource.");
        }

        resourceRepository.delete(entity);
    }

    @Override
    public ResourceDto getPublicResourceById(Long id) {
        LearningResource resource = resourceRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND,
                String.format("Learning Resource not found with id='%s'", id)));
        System.out.println("Returning description: " + resource.getDescription());

        // Filter out any moderator-only/internal fields here
        return mapper.toResourceDto(resource);
    }

    @Override
    public Page<ResourceDto> getPublicResources(String search, String tag, Pageable pageable) {
        return resourceRepository
                .findAll(LearningResourceSpecification.publishedAndMatches(search, tag), pageable)
                .map(mapper::toResourceDto);
    }

}
