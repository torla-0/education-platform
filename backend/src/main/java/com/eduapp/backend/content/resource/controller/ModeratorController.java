package com.eduapp.backend.content.resource.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/moderator")
@PreAuthorize("hasRole('MODERATOR')")
public class ModeratorController {

    
    
}
