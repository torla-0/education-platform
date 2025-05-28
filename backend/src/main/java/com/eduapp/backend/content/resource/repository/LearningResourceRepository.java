package com.eduapp.backend.content.resource.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eduapp.backend.content.resource.entity.LearningResource;

public interface LearningResourceRepository extends JpaRepository<LearningResource,Long> {
  List<LearningResource> findAllByAuthorEmail(String email);
}
