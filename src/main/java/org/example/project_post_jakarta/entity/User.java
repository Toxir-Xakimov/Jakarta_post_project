package org.example.project_post_jakarta.entity;

import jakarta.persistence.*;
import lombok.*;
import org.example.project_post_jakarta.enums.Role;
import org.example.project_post_jakarta.enums.Status;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
@Entity
@Table(name = "authuser")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "full_name")
    private String FullName;

    @Column(unique = true)
    private String username;
    private String password;

    @Enumerated(EnumType.STRING)
    private Role role;
    @Enumerated(EnumType.STRING)
    private Status status;

}
