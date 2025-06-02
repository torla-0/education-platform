package com.eduapp.backend.content.resource.section.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eduapp.backend.content.resource.section.dto.SectionBookmarkDto;
import com.eduapp.backend.content.resource.section.entity.Section;
import com.eduapp.backend.content.resource.section.entity.SectionBookmark;
import com.eduapp.backend.content.resource.section.repository.SectionBookmarkRepository;
import com.eduapp.backend.content.resource.section.repository.SectionRepository;
import com.eduapp.backend.user.entity.User;

@Service
public class SectionBookmarkService {

    private final SectionBookmarkRepository bookmarkRepository;
    private final SectionRepository sectionRepository;

    public SectionBookmarkService(SectionBookmarkRepository bookmarkRepository, SectionRepository sectionRepository) {
        this.bookmarkRepository = bookmarkRepository;
        this.sectionRepository = sectionRepository;
    }

    public SectionBookmarkDto getBookmarkStatus(Long sectionId, User user) {
        Section section = sectionRepository.findById(sectionId)
                .orElseThrow(() -> new IllegalArgumentException("Section not found"));
        boolean bookmarked = bookmarkRepository.existsBySectionAndUser(section, user);
        return SectionBookmarkDto.builder()
                .bookmarked(bookmarked)
                .build();
    }

    @Transactional
    public void toggleBookmark(Long sectionId, User user) {
        Section section = sectionRepository.findById(sectionId)
                .orElseThrow(() -> new IllegalArgumentException("Section not found"));

        if (bookmarkRepository.existsBySectionAndUser(section, user)) {
            bookmarkRepository.deleteBySectionAndUser(section, user);
        } else {
            SectionBookmark bookmark = new SectionBookmark();
            bookmark.setUser(user);
            bookmark.setSection(section);
            bookmarkRepository.save(bookmark);
        }
    }
}
