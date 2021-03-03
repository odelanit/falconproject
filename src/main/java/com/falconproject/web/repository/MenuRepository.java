package com.falconproject.web.repository;

import com.falconproject.web.models.Menu;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MenuRepository extends JpaRepository<Menu, Integer> {
    Menu findByMenuName(String menuName);

    List<Menu> findByMenuEnabled(String enabled);
}
