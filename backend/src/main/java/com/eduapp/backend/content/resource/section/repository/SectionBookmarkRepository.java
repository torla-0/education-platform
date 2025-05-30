package com.eduapp.backend.content.resource.section.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eduapp.backend.content.resource.section.entity.Section;
import com.eduapp.backend.content.resource.section.entity.SectionBookmark;
import com.eduapp.backend.user.entity.User;

public interface SectionBookmarkRepository extends JpaRepository<SectionBookmark, Long> {

    boolean existsBySectionAndUser(Section section, User user);
    void deleteBySectionAndUser(Section section, User user);
    
}
