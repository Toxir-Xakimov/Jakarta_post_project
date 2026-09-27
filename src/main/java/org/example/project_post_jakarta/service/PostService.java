package org.example.project_post_jakarta.service;

import org.example.project_post_jakarta.dao.PostDao;
import org.example.project_post_jakarta.dto.PostDTO;
import org.example.project_post_jakarta.entity.Post;

import java.util.List;
import java.util.Optional;

public class PostService {

    PostDao postDao = PostDao.getInstance();


    private static PostService postService;

    private PostService(){}

    public static PostService getInstance() {
        if ( postService == null ) {
            return new PostService();
        }

        return postService;
    }



    public void save(PostDTO postDTO) {
        postDao.save(Post.builder().title(postDTO.title()).content(postDTO.content()).user_id(postDTO.user_id()).build());
    }

    public void remove(int id) {
        postDao.remove(id);
    }


    public Optional<Post> findById(int id) {
        return postDao.findById(id);
    }


    public List<Post> getGlobal() {
        return postDao.getGlobal();
    }


    public List<Post> getAll(int userId) {
        return postDao.getAll(userId);
    }

    public void update(int id, String title, String content) {
        Post post = findById(id).get();
        post.setTitle(title);
        post.setContent(content);
        postDao.edit(post);
    }


}
