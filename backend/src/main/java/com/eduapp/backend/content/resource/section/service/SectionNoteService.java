package com.eduapp.backend.content.resource.section.service;

import org.springframework.stereotype.Service;

import com.eduapp.backend.content.resource.section.dto.SectionNoteDto;
import com.eduapp.backend.content.resource.section.entity.Section;
import com.eduapp.backend.content.resource.section.entity.SectionNote;
import com.eduapp.backend.content.resource.section.repository.SectionNoteRepository;
import com.eduapp.backend.content.resource.section.repository.SectionRepository;
import com.eduapp.backend.user.entity.User;

@Service
public class SectionNoteService {

    private final SectionNoteRepository noteRepository;
    private final SectionRepository sectionRepository;

    public SectionNoteService(SectionNoteRepository noteRepository, SectionRepository sectionRepository) {
        this.noteRepository = noteRepository;
        this.sectionRepository = sectionRepository;
    }

    public SectionNoteDto getUserNote(Long sectionId, User user) {
        Section section = sectionRepository.findById(sectionId)
                .orElseThrow(() -> new IllegalArgumentException("Section not found"));
        return noteRepository.findBySectionAndUser(section, user)
                .map(note -> SectionNoteDto.builder()
                        .noteContent(note.getNoteContent())
                        .lastModified(note.getLastModified())
                        .build())
                .orElse(SectionNoteDto.builder()
                        .noteContent("")
                        .lastModified(null)
                        .build());
    }

    public SectionNoteDto saveUserNote(Long sectionId, User user, String noteContent) {
        Section section = sectionRepository.findById(sectionId)
                .orElseThrow(() -> new IllegalArgumentException("Section not found"));

        SectionNote note = noteRepository.findBySectionAndUser(section, user)
                .orElseGet(() -> {
                    SectionNote n = new SectionNote();
                    n.setUser(user);
                    n.setSection(section);
                    return n;
                });
        note.setNoteContent(noteContent);
        note.setLastModified(java.time.LocalDateTime.now());

        noteRepository.save(note);

        return SectionNoteDto.builder()
                .noteContent(note.getNoteContent())
                .lastModified(note.getLastModified())
                .build();
    }
}
