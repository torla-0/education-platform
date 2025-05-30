package com.eduapp.backend.content.resource.section.service;

import com.eduapp.backend.content.resource.section.dto.SectionLikeDto;
import com.eduapp.backend.content.resource.section.entity.Section;
import com.eduapp.backend.content.resource.section.entity.SectionLike;
import com.eduapp.backend.content.resource.section.repository.SectionLikeRepository;
import com.eduapp.backend.content.resource.section.repository.SectionRepository;
import com.eduapp.backend.user.entity.User;
import org.springframework.stereotype.Service;

@Service
public class SectionLikeService {

    private final SectionLikeRepository likeRepository;
    private final SectionRepository sectionRepository;

    public SectionLikeService(SectionLikeRepository likeRepository, SectionRepository sectionRepository) {
        this.likeRepository = likeRepository;
        this.sectionRepository = sectionRepository;
    }

    public SectionLikeDto getLikeStatus(Long sectionId, User user) {
        Section section = sectionRepository.findById(sectionId)
                .orElseThrow(() -> new IllegalArgumentException("Section not found"));
        boolean liked = likeRepository.existsBySectionAndUser(section, user);
        int count = likeRepository.countBySection(section);
        return SectionLikeDto.builder()
                .liked(liked)
                .likeCount(count)
                .build();
    }

    public void toggleLike(Long sectionId, User user) {
        Section section = sectionRepository.findById(sectionId)
                .orElseThrow(() -> new IllegalArgumentException("Section not found"));

        if (likeRepository.existsBySectionAndUser(section, user)) {
            likeRepository.deleteBySectionAndUser(section, user);
        } else {
            SectionLike like = new SectionLike();
            like.setUser(user);
            like.setSection(section);
            likeRepository.save(like);
        }
    }
}