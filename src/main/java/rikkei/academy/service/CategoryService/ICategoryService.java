package rikkei.academy.service.CategoryService;

import rikkei.academy.model.Category;
import rikkei.academy.service.IGeneric;

public interface ICategoryService extends IGeneric<Category> {
    Category findByName(String name);
}
