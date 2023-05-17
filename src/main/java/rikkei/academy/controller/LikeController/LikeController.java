package rikkei.academy.controller.LikeController;

import rikkei.academy.model.Like;
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

@WebServlet(value = "/like")
public class LikeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "like":
                likeVideo(request, response);
                break;
            case "unlike":
                unlikeVideo(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    }

    //! Like
    private void likeVideo(HttpServletRequest request, HttpServletResponse response) {
        int video_id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userLogin");
        Video video = Service.getInstance().getVideoService().findById(video_id);
        Like like = new Like(user, video);
        Service.getInstance().getLikeService().save(like);
        try {
            response.sendRedirect("/user?action=detail&id=" + video_id);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //! Unlike
    private void unlikeVideo(HttpServletRequest request, HttpServletResponse response) {
        int video_id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userLogin");
        Service.getInstance().getLikeService().deleteByVideoIdAndUserId(video_id, user.getUser_id());
        try {
            response.sendRedirect("/user?action=detail&id=" + video_id);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
