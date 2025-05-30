package com.eduapp.backend.content.resource.section.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eduapp.backend.content.resource.section.entity.Section;
import com.eduapp.backend.content.resource.section.entity.SectionComment;
import com.eduapp.backend.user.entity.User;

public interface SectionCommentRepository extends JpaRepository<SectionComment, Long> {
    
    List<SectionComment> findBySection(Section section);
    List<SectionComment> findBySectionId(Long sectionId);
    List<SectionComment> findByUser(User user);
    
}
