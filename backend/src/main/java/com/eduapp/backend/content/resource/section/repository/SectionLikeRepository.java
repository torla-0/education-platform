package com.eduapp.backend.content.resource.section.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.eduapp.backend.content.resource.section.entity.Section;
import com.eduapp.backend.content.resource.section.entity.SectionLike;
import com.eduapp.backend.user.entity.User;

public interface SectionLikeRepository extends JpaRepository<SectionLike, Long> {
    boolean existsBySectionAndUser(Section section, User user);
    int countBySection(Section section);
    void deleteBySectionAndUser(Section section, User user);
}