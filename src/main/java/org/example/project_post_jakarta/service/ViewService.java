package org.example.project_post_jakarta.service;

import org.example.project_post_jakarta.dao.ViewDao;
import org.example.project_post_jakarta.entity.Post;
import org.example.project_post_jakarta.entity.View;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ViewService {

    ViewDao viewDao = ViewDao.getInstance();

    private static ViewService viewService;

    private ViewService() {}

    public static ViewService getInstance(){
        if ( viewService == null ) {
            return new ViewService();
        }

        return viewService;
    }

    public void save(int user_id, int post_id) {
        if ( exists(user_id, post_id) ) {
            return;
        }

            viewDao.save(View.builder().user_id(user_id).post_id(post_id).build());
    }


    public boolean exists(int user_id, int post_id) {
        return viewDao.exists(user_id, post_id);
    }


    public long getPostViewCountByPostId(int post_id) {
        return viewDao.getPostViewCountByPostId(post_id);
    }



    public Map<Integer, Long> getPostViews(List<Post> list) {
        Map<Integer, Long> result = new HashMap<>();

        for (Post post : list) {
            int postId = post.getId();

            result.put(postId, viewDao.getPostViewCountByPostId(postId));
        }

        return result;
    }



}
