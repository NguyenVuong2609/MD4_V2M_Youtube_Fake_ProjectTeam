package rikkei.academy.service.CommentService;

import rikkei.academy.model.Comment;

import java.util.List;

public interface ICommentService {
    void save(Comment comment);
    void deleteById(int id);
    List<Comment> findListCommentByVideoId(int id);
}
