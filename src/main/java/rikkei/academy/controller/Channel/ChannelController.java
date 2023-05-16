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
    public void showFormCreateChannel(HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/form-channel/create-channel.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void actionCreateChannel(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userLogin");
        String name = request.getParameter("channel_name");
        String avatar = request.getParameter("avatar");
        Channel channel = new Channel(name,avatar,user);
        user.setChannel(channel);
        Service.getInstance().getChannelService().save(channel);
        try {
            response.sendRedirect("/index.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
