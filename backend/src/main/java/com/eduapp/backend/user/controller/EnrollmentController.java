package com.eduapp.backend.user.controller;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.eduapp.backend.user.entity.User;
import com.eduapp.backend.user.service.EnrollmentService;
import com.eduapp.backend.user.service.UserService;



@RestController
@RequestMapping("/api/enrollments")
public class EnrollmentController {
    private final EnrollmentService enrollmentService;
    private final UserService userService; // Or inject principal/context

    public EnrollmentController(EnrollmentService enrollmentService, UserService userService) {
        this.enrollmentService = enrollmentService;
        this.userService = userService;
    }

    // GET /api/enrollments/check?resourceId=123
    @GetMapping("/check")
    public ResponseEntity<Boolean> isEnrolled(
        @RequestParam Long resourceId,
        Authentication authentication
    ) {
        User user = (User) authentication.getPrincipal();
        boolean enrolled = enrollmentService.isEnrolled(user.getId(), resourceId);
        return ResponseEntity.ok(enrolled);
    }


    // POST /api/enrollments/enroll
    @PostMapping("/enroll")
    public ResponseEntity<Void> enroll(
        @RequestBody Map<String, Long> payload,
        Authentication authentication
    ) {
        Long resourceId = payload.get("resourceId");
        User user = (User) authentication.getPrincipal();
        enrollmentService.enroll(user.getId(), resourceId);
        return ResponseEntity.ok().build();
    }

    
}
