
package com.eduapp.backend.content.resource.section.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor
@Builder
public class SectionCommentDto {
    private Long id;
    private Long userId;
    private String userFirstName;
    private String userLastName;
    private String content;
    private LocalDateTime createdAt;
}
