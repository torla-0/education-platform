package com.eduapp.backend.content.resource.section.repository;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eduapp.backend.content.resource.section.entity.Section;
import com.eduapp.backend.content.resource.section.entity.SectionNote;
import com.eduapp.backend.user.entity.User;

public interface SectionNoteRepository extends JpaRepository<SectionNote, Long> {
    Optional<SectionNote> findBySectionIdAndUserId(Long sectionId, Long userId);
    void deleteBySectionAndUser(Section section, User user);
}