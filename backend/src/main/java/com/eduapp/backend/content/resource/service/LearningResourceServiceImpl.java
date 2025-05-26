package com.eduapp.backend.content.resource.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import com.eduapp.backend.content.resource.dto.CreateResourceDto;
import com.eduapp.backend.content.resource.dto.ResourceDto;
import com.eduapp.backend.content.resource.entity.ResourceEntity;
import com.eduapp.backend.content.resource.mapper.ResourceMapper;
import com.eduapp.backend.content.resource.repository.LearningResourceRepository;

@Service
public class LearningResourceServiceImpl implements LearningResourceService {

    private final LearningResourceRepository resourceRepository;
    private final ResourceMapper mapper;

    @Autowired
    public LearningResourceServiceImpl(LearningResourceRepository resourceRepository,
                                       ResourceMapper mapper) {
        this.resourceRepository = resourceRepository;
        this.mapper = mapper;
    }

    @Override
    public List<ResourceDto> findByAuthor(String authorEmail) {
        return resourceRepository.findAllByAuthorEmail(authorEmail).stream()
                .map(mapper::toDto)
                .collect(Collectors.toList());
    }

    @Override
    public ResourceDto create(String authorEmail, CreateResourceDto dto) {
        ResourceEntity entity = mapper.toEntity(authorEmail, dto);
        ResourceEntity saved = resourceRepository.save(entity);
        return mapper.toDto(saved);
    }

    @Override
    @Transactional
    public ResourceDto update(Long id, String authorEmail, CreateResourceDto dto) {
        ResourceEntity entity = resourceRepository.findById(id)
            .orElseThrow(() -> new ResponseStatusException(
                HttpStatus.NOT_FOUND,
                String.format("Learning Resource not found with id='%s'", id)));

        if (!entity.getAuthorEmail().equals(authorEmail)) {
            throw new ResponseStatusException(
                HttpStatus.FORBIDDEN,
                "You are not the author of this resource.");
        }

        ResourceEntity updatedEntity = mapper.toEntity(authorEmail, dto);
        updatedEntity.setId(entity.getId());

        ResourceEntity saved = resourceRepository.save(updatedEntity);
        return mapper.toDto(saved);
    }

    @Override
    @Transactional
    public void delete(Long id, String authorEmail) {
        ResourceEntity entity = resourceRepository.findById(id)
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
}
