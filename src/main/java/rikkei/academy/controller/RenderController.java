package rikkei.academy.controller;

import rikkei.academy.model.Video;
import rikkei.academy.service.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "")
public class RenderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            default:
                listVideo(request,response);
//                pageGridVideoRecommend(request,response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    }

    //! Render video list
    private void listVideo(HttpServletRequest request, HttpServletResponse response){
        List<Video> videoList = Service.getInstance().getVideoService().findAll();
        request.setAttribute("videoList", videoList);
        List<Video> trendingList = Service.getInstance().getVideoService().showTrendingList();
        System.out.println(videoList);
        request.setAttribute("trendingList",trendingList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    //! Pagination
    private void pageGridVideoRecommend(HttpServletRequest request, HttpServletResponse response){
        int pageNumber = 1;
        if(request.getParameter("page")!=null){
            pageNumber = Integer.parseInt(request.getParameter("page"));
        }
        System.out.println("pageNumber --->"+pageNumber);
        int elementOfPage = 3;
        int start = (pageNumber-1)*elementOfPage;
        List<Video> videoList = Service.getInstance().getVideoService().findAll(start,elementOfPage);
        int totalElement = Service.getInstance().getVideoService().getNoOfRecords();
        int sumOfPage = (int) Math.ceil(totalElement / elementOfPage);
        request.setAttribute("videoList", videoList);
        request.setAttribute("sumOfPage", sumOfPage);
        request.setAttribute("pageNumber", pageNumber);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
