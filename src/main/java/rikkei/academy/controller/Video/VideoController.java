package rikkei.academy.controller.Video;

import rikkei.academy.model.Category;
import rikkei.academy.model.Channel;
import rikkei.academy.model.User;
import rikkei.academy.model.Video;
import rikkei.academy.service.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/video")
public class VideoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                showFormCreateVideo(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                actionCreateVideo(request, response);
                break;
        }
    }

    private void showFormCreateVideo(HttpServletRequest request, HttpServletResponse response) {
        List<Category> categoryList = Service.getInstance().getCategoryService().findAll();
        request.setAttribute("categoryList", categoryList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/upload/upload-video-form.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionCreateVideo(HttpServletRequest request, HttpServletResponse response) {
        String video_name = request.getParameter("videoName");
        String category_name = request.getParameter("category");
        String video_avatar = request.getParameter("avatar");
        String video_link = request.getParameter("videoLink");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userLogin");
        int channelId = Service.getInstance().getChannelService().findChannelByUserId(user.getUser_id());
        Channel channel = Service.getInstance().getChannelService().findById(channelId);
        Category category = Service.getInstance().getCategoryService().findByName(category_name);
        Video video = new Video(video_name, video_link, video_avatar, channel, category);
        Service.getInstance().getVideoService().save(video);
        try {
            response.sendRedirect("/");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
