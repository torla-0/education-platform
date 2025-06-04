package com.eduapp.backend.content.resource.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UpdateResourceDto {

    private String title;
    private String url;
    private List<String> tags;
    private String updatedAt;
    private List<Long> sectionIds;
    private String status;
}
