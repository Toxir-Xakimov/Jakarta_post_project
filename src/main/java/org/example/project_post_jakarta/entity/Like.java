package org.example.project_post_jakarta.entity;


import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "post_likes", uniqueConstraints = {
        @UniqueConstraint(name = "u_post_user_id", columnNames = {"post_id", "user_id"})
})
public class Like {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private int post_id;

    @Column(nullable = false)
    private int user_id;

    @CreationTimestamp
    @Column(columnDefinition = "timestamp default now()")
    private LocalDateTime created_at;

}
