package com.eduapp.backend.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eduapp.backend.user.entity.Enrollment;

public interface EnrollmentRepository extends JpaRepository<Enrollment, Long> {
    boolean existsByUserIdAndResourceId(Long userId, Long resourceId);
}
