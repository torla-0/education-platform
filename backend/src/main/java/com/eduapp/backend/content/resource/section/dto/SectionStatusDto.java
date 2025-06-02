package com.eduapp.backend.content.resource.section.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @NoArgsConstructor  @Builder @AllArgsConstructor
public class SectionStatusDto {

    private boolean liked;
    private int likeCount;
    private boolean bookmarked;


    
}
