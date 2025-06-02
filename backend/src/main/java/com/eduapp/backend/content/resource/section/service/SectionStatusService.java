package com.eduapp.backend.content.resource.section.service;

import org.springframework.stereotype.Service;

import com.eduapp.backend.content.resource.section.dto.SectionBookmarkDto;
import com.eduapp.backend.content.resource.section.dto.SectionLikeDto;
import com.eduapp.backend.content.resource.section.dto.SectionStatusDto;
import com.eduapp.backend.user.entity.User;

@Service
public class SectionStatusService {

    private final SectionLikeService likeService;
    private final SectionBookmarkService bookmarkService;

    public SectionStatusService(SectionLikeService likeService, SectionBookmarkService bookmarkService) {
        this.likeService = likeService;
        this.bookmarkService = bookmarkService;
    }

    public SectionStatusDto getStatus(Long sectionId, User user) {
        SectionLikeDto likeDto = likeService.getLikeStatus(sectionId, user);
        SectionBookmarkDto bookmarkDto = bookmarkService.getBookmarkStatus(sectionId, user);

        return new SectionStatusDto(
            likeDto.isLiked(),
            likeDto.getLikeCount(),
            bookmarkDto.isBookmarked()
        );
    }
}
