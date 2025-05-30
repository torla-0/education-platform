package com.eduapp.backend.content.resource.section.mapper;


import com.eduapp.backend.content.resource.section.dto.SectionCommentDto;
import com.eduapp.backend.content.resource.section.entity.SectionComment;
import org.springframework.stereotype.Component;

@Component
public class SectionCommentMapper {
    public SectionCommentDto toDto(SectionComment comment) {
        return SectionCommentDto.builder()
            .id(comment.getId())
            .userId(comment.getUser().getId())
            .userFirstName(comment.getUser().getFirstName())
            .userLastName(comment.getUser().getLastName())
            .content(comment.getContent())
            .createdAt(comment.getCreatedAt())
            .build();
    }
}