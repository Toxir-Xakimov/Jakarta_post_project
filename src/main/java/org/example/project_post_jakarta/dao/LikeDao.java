package org.example.project_post_jakarta.dao;

import org.example.project_post_jakarta.entity.Like;
import org.example.project_post_jakarta.entity.User;

import java.util.List;
import java.util.Optional;

public class LikeDao extends BaseDao{

    private static LikeDao likeDao;

    private LikeDao(){};

    public static LikeDao getInstance(){
        if ( likeDao == null ) {
            return new LikeDao();
        }

        return likeDao;
    }



    public void save(Like like) {
        begin();
        em().persist(like);
        commit();
    }


    public void remove(int user_id, int post_id) {
        begin();
        Like like = em().createQuery("from Like l where l.user_id = ?1 and l.post_id = ?2", Like.class)
                .setParameter(1, user_id).setParameter(2, post_id).getSingleResult();
        em().remove(like);
        commit();
    }



    public boolean exists(Integer user_id, int post_id){
        List<Like> likes = em().createQuery("from Like l where l.user_id = ?1 and l.post_id = ?2", Like.class)
                .setParameter(1, user_id).setParameter(2, post_id).getResultList();
        return (!likes.isEmpty());
    }

    public long likeCountByPostId(int postId) {
        return em().createQuery("select count(like) from Like like "
        + "where like.post_id = ?1", Long.class).setParameter(1, postId).getSingleResult();
    }
}
