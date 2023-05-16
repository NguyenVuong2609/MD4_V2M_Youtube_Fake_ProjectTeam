package rikkei.academy.controller.Category;

import rikkei.academy.config.ConnectToMySQL;
import rikkei.academy.model.Category;
import rikkei.academy.service.CategoryService.CategoryServiceIMPL;
import rikkei.academy.service.CategoryService.ICategoryService;

import java.io.*;
import java.sql.Connection;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(value = "/category")
public class CategoryController extends HttpServlet {
    private ICategoryService categoryService = new CategoryServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        System.out.println("---goi doGet");
        String action = req.getParameter("action");
        System.out.println("action" + action);
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                showFormCreate(req,resp);
                break;
            case "detail":
                showCategoryById(req,resp);
                break;
            case "edit":
                showFormEdit(req,resp);
            case "delete":
                actionDelete(req,resp);
            default:
                showListCategory(req,resp);
        }
        showListCategory(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        System.out.println("---goi doPost");
        String action = req.getParameter("action");
        System.out.println("action doPost----->" + action);
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                actionCreate(req,resp);
                break;
            case "edit":
                actionEdit(req,resp);
        }
    }
    // SHOW LIST R-CRUD
    public  void showListCategory(HttpServletRequest request,HttpServletResponse response){
        List<Category> categoryList = categoryService.findAll();
        request.setAttribute("categoryList",categoryList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/category/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    // SHOW FORM CREATE C -CRUD
    public  void showFormCreate(HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/category/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public void actionCreate(HttpServletRequest request, HttpServletResponse response){
        String name = request.getParameter("name");
        Category category = new Category(name);
        categoryService.save(category);
        request.setAttribute("validate","create sussses!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/category/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //detail theo id

    public void showCategoryById(HttpServletRequest request,HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("id----->"+ id);
        Category category = categoryService.findById(id);
        request.setAttribute("category",category);

        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/category/detail.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //EDIT U-CRUD
    public void showFormEdit(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Category category = categoryService.findById(id);
        request.setAttribute("category",category);
        RequestDispatcher dispatcher= request.getRequestDispatcher("WEB-INF/category/edit.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public void actionEdit(HttpServletRequest request, HttpServletResponse response){
        String name = request.getParameter("name");
        Category category = new Category(name);
        categoryService.save(category);
        showListCategory(request,response);
    }

    // DELETE
    public void actionDelete(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        categoryService.deleteById(id);
        showListCategory(request,response);
    }
}
