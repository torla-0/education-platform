package com.eduapp.backend.content.resource.spec;

import org.springframework.data.jpa.domain.Specification;

import com.eduapp.backend.content.resource.entity.LearningResource;

import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.Predicate;

public class LearningResourceSpecification {
    public static Specification<LearningResource> publishedAndMatches(String search, String tag) {
        return (root, query, cb) -> {
            Predicate predicate = cb.equal(root.get("status"), "PUBLISHED");

            if (search != null && !search.isEmpty()) {
                Predicate searchPredicate = cb.or(
                    cb.like(cb.lower(root.get("title")), "%" + search.toLowerCase() + "%"),
                    cb.like(cb.lower(root.get("description")), "%" + search.toLowerCase() + "%")
                    // Add more fields as needed
                );
                predicate = cb.and(predicate, searchPredicate);
            }

            if (tag != null && !tag.equalsIgnoreCase("ALL")) {
                Join<Object, Object> tagsJoin = root.join("tags");
                predicate = cb.and(predicate, cb.equal(tagsJoin, tag));
            }

            return predicate;
        };
    }
}
