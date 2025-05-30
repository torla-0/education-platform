package com.eduapp.backend.user.service;

import java.time.LocalDateTime;

import org.springframework.stereotype.Service;

import com.eduapp.backend.content.resource.entity.LearningResource;
import com.eduapp.backend.content.resource.repository.LearningResourceRepository;
import com.eduapp.backend.user.entity.Enrollment;
import com.eduapp.backend.user.entity.User;
import com.eduapp.backend.user.repository.EnrollmentRepository;
import com.eduapp.backend.user.repository.UserRepository;

import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;

@Service
public class EnrollmentService {
    private final EnrollmentRepository enrollmentRepository;
    private final UserRepository userRepository;
    private final LearningResourceRepository resourceRepository;

    public EnrollmentService(
        EnrollmentRepository enrollmentRepository,
        UserRepository userRepository,
        LearningResourceRepository resourceRepository
    ) {
        this.enrollmentRepository = enrollmentRepository;
        this.userRepository = userRepository;
        this.resourceRepository = resourceRepository;
    }

    /**
     * Check if a user is enrolled in a learning resource.
     *
     * @param userId  the ID of the user
     * @param resourceId  the ID of the learning resource
     * @return  whether the user is enrolled in the resource
     */
    public boolean isEnrolled(Long userId, Long resourceId) {
        return enrollmentRepository.existsByUserIdAndResourceId(userId, resourceId);
    }

    /**
     * Enroll a user in a learning resource.
     *
     * @param userId  the ID of the user
     * @param resourceId  the ID of the learning resource
     * @throws EntityNotFoundException  if the user or resource does not exist
     */
    @Transactional
    public void enroll(Long userId, Long resourceId) {
        if (isEnrolled(userId, resourceId)) {
            return;
        }
        User user = userRepository.findById(userId)
            .orElseThrow(() -> new EntityNotFoundException("User not found"));
        LearningResource resource = resourceRepository.findById(resourceId)
            .orElseThrow(() -> new EntityNotFoundException("Resource not found"));

        Enrollment enrollment = Enrollment.builder()
            .user(user)
            .resource(resource)
            .enrolledAt(LocalDateTime.now())
            .build();

        enrollmentRepository.save(enrollment);
    }
}
