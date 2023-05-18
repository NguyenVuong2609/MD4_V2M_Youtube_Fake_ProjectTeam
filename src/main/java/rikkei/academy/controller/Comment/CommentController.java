package rikkei.academy.controller.Comment;

import rikkei.academy.model.Comment;
import rikkei.academy.model.User;
import rikkei.academy.model.Video;
import rikkei.academy.service.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/comment")
public class CommentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) action = "";

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "post":
                postComment(request,response);
                break;
        }
    }

    //! Post comment
    private void postComment(HttpServletRequest request, HttpServletResponse response){
        Comment comment = new Comment();
        int video_id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userLogin");
        Video video = Service.getInstance().getVideoService().findById(video_id);
        String comment_content = request.getParameter("content");
        comment.setUser(user);
        comment.setVideo(video);
        comment.setComment_content(comment_content);
        Service.getInstance().getCommentService().save(comment);
        try {
            response.sendRedirect("/user?action=detail&id=" + video_id);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
