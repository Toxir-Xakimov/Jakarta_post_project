package org.example.project_post_jakarta.service;

import org.example.project_post_jakarta.dao.UserDao;
import org.example.project_post_jakarta.dto.LoginDTO;
import org.example.project_post_jakarta.dto.LoginSuccessDTO;
import org.example.project_post_jakarta.dto.RegisterDTO;
import org.example.project_post_jakarta.entity.User;
import org.example.project_post_jakarta.enums.Role;
import org.example.project_post_jakarta.enums.Status;

import java.util.Optional;

public class AuthService {

    UserDao userDao = UserDao.getInstance();


    private static AuthService authService;

    private AuthService (){}

    public static AuthService getInstance() {
        if ( authService == null ) {
            return new AuthService();
        }

        return authService;
    }

    public boolean reg(RegisterDTO registerDTO) {
        Optional<User> byUsername = userDao.findByUsername(registerDTO.username());

        if (byUsername.isPresent()) return false;

        User user = User.builder()
                .FullName(registerDTO.fullname())
                .username(registerDTO.username())
                .password(registerDTO.password())
                .role(Role.USER)
                .status(Status.ACTIVE)
                .build();
        userDao.save(user);
        return true;
    }



    public LoginSuccessDTO login(LoginDTO loginDTO) {
        Optional<User> byUsername = userDao.findByUsername(loginDTO.username());

        if (byUsername.isEmpty()) return null;
        User user = byUsername.get();
        if ( !user.getPassword().equals(loginDTO.password()) ) return null;

        return new LoginSuccessDTO(user.getId(), user.getRole());
    }



}
