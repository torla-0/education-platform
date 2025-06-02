
package com.eduapp.backend.content.resource.section.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.eduapp.backend.content.resource.section.dto.CreateSectionCommentDto;
import com.eduapp.backend.content.resource.section.dto.SectionCommentDto;
import com.eduapp.backend.content.resource.section.entity.Section;
import com.eduapp.backend.content.resource.section.entity.SectionComment;
import com.eduapp.backend.content.resource.section.mapper.SectionCommentMapper;
import com.eduapp.backend.content.resource.section.repository.SectionCommentRepository;
import com.eduapp.backend.content.resource.section.repository.SectionRepository;
import com.eduapp.backend.user.entity.User;

@Service
public class SectionCommentService {

    private final SectionCommentRepository commentRepository;
    private final SectionRepository sectionRepository;
    private final SectionCommentMapper mapper;

    public SectionCommentService(
            SectionCommentRepository commentRepository,
            SectionRepository sectionRepository,
            SectionCommentMapper mapper
    ) {
        this.commentRepository = commentRepository;
        this.sectionRepository = sectionRepository;
        this.mapper = mapper;
    }

    public List<SectionCommentDto> getComments(Long sectionId) {
        return commentRepository.findBySectionId(sectionId).stream()
                .map(mapper::toDto)
                .collect(Collectors.toList());
    }

    public SectionCommentDto addComment(Long sectionId, User user, CreateSectionCommentDto dto) {
        Section section = sectionRepository.findById(sectionId)
                .orElseThrow(() -> new IllegalArgumentException("Section not found"));

        SectionComment comment = new SectionComment();
        comment.setUser(user);
        comment.setSection(section);
        comment.setContent(dto.getContent());
        comment.setCreatedAt(LocalDateTime.now());

        return mapper.toDto(commentRepository.save(comment));
    }

}
