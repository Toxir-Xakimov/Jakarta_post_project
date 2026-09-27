package org.example.project_post_jakarta.dao;


import org.example.project_post_jakarta.entity.Post;

import java.util.List;
import java.util.Optional;

public final class PostDao extends BaseDao{

    private static PostDao postDao;

    private PostDao(){};

    public static PostDao getInstance(){
        if ( postDao == null ) {
            return new PostDao();
        }

        return postDao;
    }



    public void save(Post post) {
        begin();
        em().persist(post);
        commit();
    }


    public void remove(int id) {
        begin();
        Post post = em().find(Post.class, id);
        em().remove(post);
        commit();
    }


    public Optional<Post> findById(int id) {
        begin();
        Post post = em().find(Post.class, id);
        commit();

        return (post == null ? Optional.empty() : Optional.of(post));
    }


    public List<Post> getGlobal(){
        return em().createQuery("from Post", Post.class).getResultList();
    }


    public List<Post> getAll(int user_id) {
        begin();
        List<Post> resultList = em().createQuery("from Post p where p.user_id = ?1", Post.class).setParameter(1, user_id).getResultList();
        commit();
        em().clear();
        return resultList;
    }


    public void edit(Post post) {
        begin();
        em().merge(post);
        commit();
    }




}
