package com.eduapp.backend.content.resource.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.eduapp.backend.content.resource.dto.CreateResourceDto;
import com.eduapp.backend.content.resource.dto.ResourceDto;

/**
 * Service interface for managing learning resources authored by moderators.
 */
public interface LearningResourceService {

    /**
     * Retrieve all resources created by a specific author.
     *
     * @param authorEmail the email of the resource author
     * @return a list of ResourceDto objects
     */
    List<ResourceDto> findByAuthor(String authorEmail);

    /**
     * Create a new learning resource.
     *
     * @param authorEmail the email of the resource author
     * @param dto         the payload containing resource details
     * @return the created ResourceDto
     */
    ResourceDto create(String authorEmail, CreateResourceDto dto);

    /**
     * Update an existing learning resource.
     *
     * @param id          the ID of the resource to update
     * @param authorEmail the email of the resource author
     * @param dto         the payload containing updated details
     * @return the updated ResourceDto
     */
    ResourceDto update(Long id, String authorEmail, CreateResourceDto dto);

    /**
     * Delete a learning resource.
     *
     * @param id          the ID of the resource to delete
     * @param authorEmail the email of the resource author
     */
    void delete(Long id, String authorEmail);

    /**
     * Retrieve a paginated list of public resources.
     * 
     * @return a Page of ResourceDto objects
     */
    Page<ResourceDto> getPublicResources(String search, String tag, Pageable pageable);

    /**
     * Find a resource by its ID.
     *
     * @param id the ID of the resource
     * @return the LearningResource entity
     */
    ResourceDto getPublicResourceById(Long id);
    
}
