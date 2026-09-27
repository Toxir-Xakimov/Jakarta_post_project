package org.example.project_post_jakarta.dao;

import org.example.project_post_jakarta.entity.User;

import java.util.List;
import java.util.Optional;

public class UserDao extends BaseDao{

    private static UserDao userDao;

    private UserDao(){};

    public static UserDao getInstance(){
        if ( userDao == null ) {
            return new UserDao();
        }

        return userDao;
    }



    public void save(User user) {
        begin();
        em().persist(user);
        commit();
    }


    public void remove(int id) {
        begin();
        em().find(User.class, id);
        commit();
    }


    public Optional<User> findById(int id) {
        begin();
        User user = em().find(User.class, id);
        commit();

        return (user == null ? Optional.empty() : Optional.of(user));
    }


    public List<User> getAll(){
        return em().createQuery("from User ").getResultList();
    }


    public void edit(User user) {
        begin();
        em().merge(user);
        commit();
    }


    public Optional<User> findByUsername(String username) {
        begin();
        List<User> users = em().createQuery("from User u where u.username = ?1", User.class).setParameter(1, username).getResultList();

        commit();
        if ( users.isEmpty() ) return Optional.empty();

        return Optional.of(users.get(0));
    }


}
