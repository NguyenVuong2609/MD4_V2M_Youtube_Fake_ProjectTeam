package rikkei.academy.service.LikeService;

import rikkei.academy.model.Like;
import rikkei.academy.service.IGeneric;

public interface ILikeService  {
void save(Like like);
void deleteById(int id);
}
