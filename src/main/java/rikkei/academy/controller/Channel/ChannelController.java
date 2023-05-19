package rikkei.academy.controller.Channel;

import rikkei.academy.model.Channel;
import rikkei.academy.model.User;
import rikkei.academy.service.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/channel")
public class ChannelController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "create":
                showFormCreateChannel(request,response);
                break;
            case "add":
                actionSubscribe(request,response);
                break;
            case "remove":
                actionRemoveSubscribe(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "create":
                actionCreateChannel(request,response);
                break;
        }
    }

    //! Tạo kênh mới
    private void showFormCreateChannel(HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/form-channel/create-channel.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionCreateChannel(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userLogin");
        String name = request.getParameter("channel_name");
        String avatar = request.getParameter("avatar");
        Channel channel = new Channel(name,avatar,user);
        user.setChannel(channel);
        Service.getInstance().getChannelService().save(channel);
        try {
            response.sendRedirect("/");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void actionSubscribe(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userLogin");
        int video_id = Integer.parseInt(request.getParameter("id"));
        int channel_id = Integer.parseInt(request.getParameter("idc"));
        Channel channel = Service.getInstance().getChannelService().findById(channel_id);
        channel.getFollowerList().add(user);
        Service.getInstance().getChannelService().addSubscriber(channel_id, user.getUser_id());
        try {
            response.sendRedirect("/user?action=detail&id=" + video_id);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void actionRemoveSubscribe (HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userLogin");
        int video_id = Integer.parseInt(request.getParameter("id"));
        int channel_id = Integer.parseInt(request.getParameter("idc"));
        Channel channel = Service.getInstance().getChannelService().findById(channel_id);
        channel.getFollowerList().remove(user);
        Service.getInstance().getChannelService().unSubscribe(channel_id, user.getUser_id());
        try {
            response.sendRedirect("/user?action=detail&id=" + video_id);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
