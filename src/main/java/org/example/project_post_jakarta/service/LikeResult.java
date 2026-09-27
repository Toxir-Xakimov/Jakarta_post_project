package org.example.project_post_jakarta.service;


public class LikeResult {
    private final boolean liked;
    private final long likeCount;

    public LikeResult(boolean liked, long likeCount) {
        this.liked = liked;
        this.likeCount = likeCount;
    }

    public boolean isLiked() {
        return liked;
    }

    public long getLikeCount() {
        return likeCount;
    }
}

