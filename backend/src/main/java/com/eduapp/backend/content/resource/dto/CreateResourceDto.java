package com.eduapp.backend.content.resource.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CreateResourceDto {

    private String title;
    private String description;
    private String url;
    private String[] tags;

}
