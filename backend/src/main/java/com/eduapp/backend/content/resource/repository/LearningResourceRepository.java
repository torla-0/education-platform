package com.eduapp.backend.content.resource.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eduapp.backend.content.resource.entity.ResourceEntity;

public interface LearningResourceRepository extends JpaRepository<ResourceEntity,Long> {
  List<ResourceEntity> findAllByAuthorEmail(String email);
}
