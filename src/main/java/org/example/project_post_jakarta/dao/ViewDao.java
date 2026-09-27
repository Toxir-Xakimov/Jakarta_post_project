package org.example.project_post_jakarta.dao;


import org.example.project_post_jakarta.entity.View;

import java.util.List;

public class ViewDao extends BaseDao {

    private static ViewDao viewDao;

    private ViewDao (){}

    public static ViewDao getInstance(){
        if (viewDao == null) {
            return new ViewDao();
        }

        return viewDao;
    }




    public void save(View view) {
        begin();
        em().persist(view);
        commit();
    }


    public boolean exists(int user_id, int post_id) {
        List<View> alreadyViewed = em().createQuery("select v from View v where v.user_id = ?1 and v.post_id = ?2", View.class).setParameter(1, user_id).setParameter(2, post_id).getResultList();

        return (!alreadyViewed.isEmpty());
    }


    public long getPostViewCountByPostId(int post_id) {
         long viewCount = (long) em().createQuery("select count(v) from View v " + " where v.post_id = ?1").setParameter(1, post_id).getSingleResult();
        return viewCount;
    }




}
