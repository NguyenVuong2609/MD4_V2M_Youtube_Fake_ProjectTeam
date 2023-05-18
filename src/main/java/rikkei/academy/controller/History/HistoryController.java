package rikkei.academy.controller.History;

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

@WebServlet(value = "/history")
public class HistoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "show":
                showListVideoFromHistory(request,response);
                break;
        };

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
//    private void showHistory(HttpServletRequest request, HttpServletResponse response) {
//
//    }
    private void showListVideoFromHistory(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userLogin");
        if(user!=null){
            List<Video> videoList = Service.getInstance().getHistoryService().findListVideoInHistory(user.getUser_id());
            request.setAttribute("videoList",videoList);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/pages/history.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }


}
