package com.eduapp.backend.content.resource.section.entity;




import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import com.eduapp.backend.user.entity.User;

@Entity
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class SectionLike {
    @Id @GeneratedValue
    private Long id;
    @ManyToOne private User user;
    @ManyToOne private Section section;
}
