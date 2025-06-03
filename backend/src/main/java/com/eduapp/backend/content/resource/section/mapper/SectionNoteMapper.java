package com.eduapp.backend.content.resource.section.mapper;

import org.springframework.stereotype.Component;

import com.eduapp.backend.content.resource.section.dto.CreateSectionNoteDto;
import com.eduapp.backend.content.resource.section.dto.SectionNoteDto;
import com.eduapp.backend.content.resource.section.entity.Section;
import com.eduapp.backend.content.resource.section.entity.SectionNote;
import com.eduapp.backend.user.entity.User;

@Component
public class SectionNoteMapper {
    public SectionNoteDto toDto(SectionNote entity) {
        if (entity == null) return null;
        return SectionNoteDto.builder()
                .id(entity.getId())
                .content(entity.getNoteContent())
                .build();
    }

    public SectionNote toEntity(CreateSectionNoteDto dto, Section section, User user) {
        return SectionNote.builder()
                .noteContent(dto.getContent())
                .section(section)
                .user(user)
                .build();
    }

}
