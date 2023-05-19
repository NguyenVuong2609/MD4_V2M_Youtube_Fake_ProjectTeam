package rikkei.academy.controller.Playlist;

import rikkei.academy.model.Playlist;
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

@WebServlet(value = "/playlist")
public class PlaylistController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                showFormCreatePlaylist(request, response);
                break;
            case "add":
                actionAddPlaylist(request, response);
                break;
            case "delete":
                actionDeleteVideoFromPlaylist(request, response);
                break;
            case "show":
                showListPlaylist(request, response);
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
                actionCreatePlaylist(request, response);
                break;

        }
    }

    private void showFormCreatePlaylist(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/pages/create-playlist.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionCreatePlaylist(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userLogin");
        String playlist_name = request.getParameter("playlist_name");
        Playlist playlist = new Playlist(playlist_name, user);
        Service.getInstance().getPlaylistService().save(playlist);
        try {
            response.sendRedirect("/");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionAddPlaylist(HttpServletRequest request, HttpServletResponse response) {
        int video_id = Integer.parseInt(request.getParameter("id"));
        int playlist_id = Integer.parseInt(request.getParameter("idPL"));
        Video video = Service.getInstance().getVideoService().findById(video_id);
        Playlist playlist = Service.getInstance().getPlaylistService().findById(playlist_id);
        playlist.getVideoList().add(video);
        System.out.println(playlist.getVideoList());
        Service.getInstance().getPlaylistService().insertVideoList(playlist);
        request.setAttribute("validate", "success");
        try {
            response.sendRedirect("/user?action=detail&id=" + video.getVideo_id());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionDeleteVideoFromPlaylist(HttpServletRequest request, HttpServletResponse response) {
        int video_id = Integer.parseInt(request.getParameter("id"));
        int playlist_id = Integer.parseInt(request.getParameter("idPL"));
        Service.getInstance().getPlaylistService().deleteVideoFromPlaylist(video_id, playlist_id);
        try {
            response.sendRedirect("/user?action=detail&id=" + video_id);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showListPlaylist(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userLogin");
        if (user != null) {
            List<Playlist> listPlayList = Service.getInstance().getPlaylistService().showPlaylist(user.getUser_id());
            if (listPlayList != null) {
                request.setAttribute("listPlaylist", listPlayList);
            }
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/pages/playlist.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

}
