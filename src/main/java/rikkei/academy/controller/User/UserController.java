package rikkei.academy.controller.User;

import rikkei.academy.model.*;
import rikkei.academy.service.Service;

import java.io.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(value = "/user")
public class UserController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "register":
                showFormRegister(request, response);
                break;
            case "login":
                showFormLogin(request, response);
                break;
            case "trending":
                showTrending(request, response);
                break;
            case "history":
                showHistory(request, response);
                break;
            case "logout":
                logOut(request, response);
                break;
            case "detail":
                showDetail(request, response);
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
            case "register":
                actionRegister(request, response);
                break;
            case "login":
                actionLogin(request, response);
                break;
        }
    }

    //! Hiển thị form đăng ký
    private void showFormRegister(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/form-login/register.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //! Đăng ký
    private void actionRegister(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = "user";
        Set<String> strRole = new HashSet<>();
        strRole.add(role);
        Set<Role> roleSet = new HashSet<>();
        strRole.forEach(role1 -> {
            switch (role1) {
                case "admin":
                    roleSet.add(Service.getInstance().getRoleService().findByName(RoleName.ADMIN));
                    break;
                default:
                    roleSet.add(Service.getInstance().getRoleService().findByName(RoleName.USER));
            }
        });
        if (Service.getInstance().getUserService().existedByUsername(username)) {
            request.setAttribute("validate", "This username is existed");
            request.setAttribute("name", name);
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("password", password);
        } else if (Service.getInstance().getUserService().existedByEmail(email)) {
            request.setAttribute("validate", "This email is existed");
            request.setAttribute("name", name);
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("password", password);
        } else {
            User user = new User(name, username, email, password, roleSet);
            Service.getInstance().getUserService().save(user);
            request.setAttribute("validate", "Successful");
            try {
                response.sendRedirect("/user?action=login");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }


    //! Hiển thị form đăng nhập
    private void showFormLogin(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/form-login/login.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //! Hiển thị page Trending
    private void showTrending(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/pages/trending.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //! Hiển thị page History
    private void showHistory(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/pages/history.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showDetail(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userLogin");
        boolean checkLike = false;
        int id = Integer.parseInt(request.getParameter("id"));
        if (user != null) {
            checkLike = Service.getInstance().getLikeService().checkLike(id, user.getUser_id());
        }
        Service.getInstance().getVideoService().updateViewById(id);
        Video video = Service.getInstance().getVideoService().findById(id);
        Channel channel = Service.getInstance().getVideoService().findChannelById(id);
        List<Playlist> listPlaylist = Service.getInstance().getPlaylistService().findAll();
        video.setChannel(channel);
        List<Video> videoList = new ArrayList<>();
        List<Comment> commentList = Service.getInstance().getCommentService().findListCommentByVideoId(id);
        List<Playlist> listHavingVideo;
        List<Playlist> listNotHavingVideo;
        videoList.add(video);
        request.setAttribute("commentList", commentList);
        request.setAttribute("checkLike", checkLike);
        request.setAttribute("videoDetail",videoList);
        request.setAttribute("listPlaylist", listPlaylist);
        if(user!=null){
            listHavingVideo = Service.getInstance().getPlaylistService().showListHavingVideo(id,user.getUser_id());
            listNotHavingVideo = Service.getInstance().getPlaylistService().showListNotHavingVideo(id,user.getUser_id());
            request.setAttribute("listHavingVideo",listHavingVideo);
            request.setAttribute("listNotHavingVideo",listNotHavingVideo);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/pages/detail.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void checkExistVideo (HttpServletRequest request, HttpServletResponse response){

    }

//    private void listPlaylist (HttpServletRequest request, HttpServletResponse response) {
//        List<Playlist> listPlaylist = Service.getInstance().getPlaylistService().findAll();
//        request.setAttribute("listPlaylist", listPlaylist);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/pages/detail.jsp");
//        try {
//            dispatcher.forward(request,response);
//        } catch (ServletException e) {
//            throw new RuntimeException(e);
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
//    }

    //! Đăng nhập
    private void actionLogin(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = Service.getInstance().getUserService().userLogin(username, password);
        if (user != null) {
            HttpSession session = request.getSession();
            int channelId = Service.getInstance().getChannelService().findChannelByUserId(user.getUser_id());
            Channel channel = Service.getInstance().getChannelService().findById(channelId);
            user.setChannel(channel);
            session.setAttribute("userLogin", user);
            try {
                response.sendRedirect("/");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            request.setAttribute("validate", "Login failed! Please try again!");
            showFormLogin(request, response);
        }
    }

    //! Log out
    private void logOut(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false); //? Check sự tồn tại của session --> nếu không có trả về null
        if (session.getAttribute("userLogin") != null) {
            session.removeAttribute("userLogin");
            session.invalidate(); //? Xóa các thuộc tính bên trong session
            try {
                response.sendRedirect("/");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    //! Check channel exist
    private int findChannelByUserId(User user) {
        return Service.getInstance().getChannelService().findChannelByUserId(user.getUser_id());
    }


}

