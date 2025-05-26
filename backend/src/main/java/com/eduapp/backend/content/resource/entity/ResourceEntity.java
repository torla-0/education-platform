package com.eduapp.backend.content.resource.entity;


import java.time.Instant;
import java.util.List;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;

/**
 * JPA entity representing a Learning Resource created by a moderator.
 */
@Entity
@Table(name = "learning_resources")
public class ResourceEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private String url;

    @ElementCollection
    @CollectionTable(
        name = "resource_tags",
        joinColumns = @JoinColumn(name = "resource_id")
    )
    @Column(name = "tag")
    private List<String> tags;

    @Column(nullable = false)
    private String authorEmail;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private ResourceStatus status;

    @Column(nullable = false, updatable = false)
    private Instant createdAt;

    @Column(nullable = false)
    private Instant updatedAt;

    // Getters and setters 

    @PrePersist
    protected void onCreate() {
        createdAt = updatedAt = Instant.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = Instant.now();
    }
}

/**
 * Status of a learning resource (e.g., draft vs published).
 */
enum ResourceStatus {
    DRAFT,
    PUBLISHED
}
