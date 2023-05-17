package rikkei.academy.service.LikeService;

import rikkei.academy.config.ConnectToMySQL;
import rikkei.academy.model.Like;

import java.sql.Connection;
import java.util.List;

public class LikeServiceIMPL implements ILikeService{
    private Connection connection = ConnectToMySQL.getConnection();
    private static final String INSERT_INTO_LIKE = "insert into like (like_id,user,video) values (?,?,?)";
    private static final String SELECT_ALL_LIKE = "SELECT * FROM like";

}
