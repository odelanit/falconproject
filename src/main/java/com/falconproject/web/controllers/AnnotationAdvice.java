package com.falconproject.web.controllers;

import com.falconproject.web.models.Menu;
import com.falconproject.web.models.User;
import com.falconproject.web.repository.MenuRepository;
import com.falconproject.web.service.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@ControllerAdvice(annotations = Controller.class)
public class AnnotationAdvice {
    @Autowired
    MenuRepository menuRepository;

    @ModelAttribute("menuItems")
    public List<Menu> menuItems(@AuthenticationPrincipal UserDetailsImpl userDetails) {
        if (userDetails != null) {
            User user = userDetails.getUser();
        }
        return menuRepository.findByMenuEnabled("true");
    }
}
