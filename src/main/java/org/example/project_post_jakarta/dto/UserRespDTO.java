package org.example.project_post_jakarta.dto;

import org.example.project_post_jakarta.enums.Role;
import org.example.project_post_jakarta.enums.Status;

public record UserRespDTO(String fullname, String username, Role role, Status status) {
}
