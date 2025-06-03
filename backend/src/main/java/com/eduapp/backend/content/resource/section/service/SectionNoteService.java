package com.eduapp.backend.content.resource.section.service;

import org.springframework.stereotype.Service;

import com.eduapp.backend.content.resource.section.dto.CreateSectionNoteDto;
import com.eduapp.backend.content.resource.section.dto.SectionNoteDto;
import com.eduapp.backend.content.resource.section.entity.Section;
import com.eduapp.backend.content.resource.section.entity.SectionNote;
import com.eduapp.backend.content.resource.section.mapper.SectionNoteMapper;
import com.eduapp.backend.content.resource.section.repository.SectionNoteRepository;
import com.eduapp.backend.content.resource.section.repository.SectionRepository;
import com.eduapp.backend.user.entity.User;


@Service
public class SectionNoteService {

    private final SectionNoteRepository noteRepository;
    private final SectionRepository sectionRepository;
    private final SectionNoteMapper mapper;

    public SectionNoteService(
            SectionNoteRepository noteRepository,
            SectionRepository sectionRepository,
            SectionNoteMapper mapper
) {
        this.noteRepository = noteRepository;
        this.sectionRepository = sectionRepository;
        this.mapper = mapper;
    }

    public SectionNoteDto getUserNote(Long sectionId, User user) {
        return noteRepository.findBySectionIdAndUserId(sectionId, user.getId())
                .map(mapper::toDto)
                .orElse(SectionNoteDto.builder().id(null).content("").build());
    }

    public SectionNoteDto saveUserNote(Long sectionId, User user, CreateSectionNoteDto dto) {
        Section section = sectionRepository.findById(sectionId)
                .orElseThrow(() -> new IllegalArgumentException("Section not found"));

        SectionNote note = noteRepository.findBySectionIdAndUserId(sectionId, user.getId())
                .orElseGet(() -> mapper.toEntity(dto, section, user));

        note.setNoteContent(dto.getContent());
        System.out.println("CreateSectionNoteDto content: " + dto.getContent());

        SectionNote saved = noteRepository.save(note);
        return mapper.toDto(saved);
    }
}