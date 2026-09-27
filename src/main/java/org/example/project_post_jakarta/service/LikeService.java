package org.example.project_post_jakarta.service;

import org.example.project_post_jakarta.dao.LikeDao;
import org.example.project_post_jakarta.entity.Like;
import org.example.project_post_jakarta.entity.Post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LikeService {

    LikeDao likeDao = LikeDao.getInstance();


    static LikeService likeService;

    private LikeService(){};

    public static LikeService getInstance() {
        if (likeService == null) {
            return new LikeService();
        }

        return likeService;
    }





    public void persist(int user_id, int post_id){
        Like build = Like.builder().user_id(user_id).post_id(post_id).build();
        likeDao.save(build);
    }


    public void remove(int user_id, int post_id) {
        likeDao.remove(user_id, post_id);
    }


    public boolean exists(Integer user_id, int post_id){
        boolean exists = likeDao.exists(user_id, post_id);

        return exists;
    }



    public LikeResult toggleLike(int user_id, int post_id) {
        boolean alreadyLiked = likeDao.exists(user_id, post_id);

        if ( alreadyLiked ) {
            likeDao.remove(user_id, post_id);
        } else {
            persist(user_id, post_id);
        }


        long likeCount = likeDao.likeCountByPostId(post_id);

        return new LikeResult(!alreadyLiked, likeCount);
    }


    public Map<Integer, LikeResult> getResForPosts(List<Post> postList, Integer user_id) {

        Map<Integer, LikeResult> results = new HashMap<>();

        for (Post post : postList) {
            int id = post.getId();
            long likeCount = likeDao.likeCountByPostId(id);
            boolean liked = user_id != null && likeDao.exists(user_id, id);

            results.put(id, new LikeResult(liked, likeCount));
        }

        return results;
    }


    public long likeCountByPostId(int post_id) {
        return likeDao.likeCountByPostId(post_id);
    }




}
