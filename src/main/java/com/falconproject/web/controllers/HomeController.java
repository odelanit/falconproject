package com.falconproject.web.controllers;

import com.falconproject.web.form.PasswordChangeForm;
import com.falconproject.web.form.TimeAllocateForm;
import com.falconproject.web.models.Menu;
import com.falconproject.web.models.TimePeriod;
import com.falconproject.web.models.User;
import com.falconproject.web.models.UserGroup;
import com.falconproject.web.repository.MenuRepository;
import com.falconproject.web.repository.TimePeriodRepository;
import com.falconproject.web.repository.UserGroupRepository;
import com.falconproject.web.repository.UserRepository;
import com.falconproject.web.validator.UserGroupValidator;
import com.falconproject.web.validator.UserValidator;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.awt.*;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    UserRepository userRepository;

    @Autowired
    TimePeriodRepository timePeriodRepository;

    @Autowired
    MenuRepository menuRepository;

    @Autowired
    UserGroupRepository userGroupRepository;

    @Autowired
    UserValidator userValidator;

    @Autowired
    UserGroupValidator userGroupValidator;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @ModelAttribute("userList")
    List<User> userList() {
        return userRepository.findByEnabled(true);
    }

    @ModelAttribute("timePeriodList")
    List<TimePeriod> timePeriodList() {
        return timePeriodRepository.findAll();
    }

    @ModelAttribute("menuList")
    List<Menu> menuList() {
        return menuRepository.findByMenuEnabled("true");
    }

    @ModelAttribute("groupList")
    List<UserGroup> groupList() {
        return userGroupRepository.findAll();
    }

    @ModelAttribute("passwordChangeForm")
    PasswordChangeForm passwordChangeForm() {
        return new PasswordChangeForm();
    }

    @ModelAttribute("userForm")
    User userForm() {
        return new User();
    }

    @ModelAttribute("timeAllocateForm")
    TimeAllocateForm timeAllocateForm() {
        return new TimeAllocateForm();
    }

    @GetMapping("/logout")
    public String logout() {
        return "logout";
    }

    @GetMapping("/userRegistration")
    public String userRegistration() {
        return "userRegistration";
    }

    @GetMapping("/group")
    public String group(Model model) { ;
        UserGroup userGroup = new UserGroup();
        model.addAttribute("userGroup", userGroup);
        return "group";
    }

    @PostMapping("/registerUser")
    public String registerUser(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "redirect:/userRegistration";
        }
        userForm.setPassword(bCryptPasswordEncoder.encode(userForm.getPassword()));
        userRepository.save(userForm);

        userForm.setPassword("");
        userForm.setUsername("");
        userForm.setUserFullName("");

        return "redirect:/userRegistration";
    }

    @PostMapping("/change_password")
    public String changePassword(@ModelAttribute("passwordChangeForm") PasswordChangeForm form) {
        User user = form.getUser();
        user.setPassword(bCryptPasswordEncoder.encode(form.getNewPassword()));
        userRepository.save(user);
        return "redirect:/userRegistration";
    }

    @PostMapping("/timePeriod")
    public String timePeriod(@ModelAttribute("timeAllocateForm") TimeAllocateForm form) {
        User user = form.getUser();
        user.setTimePeriod(form.getTimePeriod().getTimeVal());
        userRepository.save(user);
        return "redirect:/userRegistration";
    }

    @GetMapping("/user_group_permissions")
    public String userGroupPermissions(Model model, HttpServletRequest request) {
        String userId = request.getParameter("userid");
        User user = userRepository.findById(Integer.parseInt(userId)).get();
        model.addAttribute("userForm", user);
        model.addAttribute("userId", userId);
        return "userPermissions";
    }

    @PostMapping("/assignGroup")
    public String assignGroup(@ModelAttribute("userForm") User userForm, HttpServletRequest request) {
        String userId = request.getParameter("userId");
        User user = userRepository.findById(userForm.getUserId()).get();
        user.setGroups(userForm.getGroups());
        userRepository.save(user);
        return "redirect:/user_group_permissions?userid=" + userId;
    }

    @PostMapping("/createGroup")
    public String createGroup(@ModelAttribute("userGroup") UserGroup userGroup, BindingResult bindingResult, Model model) {
        userGroupValidator.validate(userGroup, bindingResult);
        if (bindingResult.hasErrors()) {
            return "redirect:/group";
        }
        userGroupRepository.save(userGroup);

        userGroup = new UserGroup();
        model.addAttribute("userGroup", userGroup);

        return "redirect:/group";
    }

    @GetMapping("/groupEdit")
    public String groupEdit(Model model, HttpServletRequest request) {
        String groupId = request.getParameter("groupId");

        UserGroup userGroup = userGroupRepository.findById(Integer.parseInt(groupId)).get();
        List<Menu> menuList = menuRepository.findByMenuEnabled("true");
        for (Menu menuItem : menuList) {
            boolean checked = ArrayUtils.contains(userGroup.getMenuSet().toArray(new Menu[0]), menuItem);
            menuItem.setChecked(checked);
        }

        model.addAttribute("menuItems", menuList);
        model.addAttribute("groupId", groupId);
        model.addAttribute("userGroup", userGroup);
        return "groupEdit";
    }

    @GetMapping("/userDeletion")
    public String userDeletion(HttpServletRequest req) {
        String userid = req.getParameter("userid");
        userRepository.deleteById(Integer.parseInt(userid));
        return "redirect:/userRegistration";
    }

    @GetMapping("/groupDeletion")
    public String groupDeletion(HttpServletRequest request) {
        String groupId = request.getParameter("groupId");
        userGroupRepository.deleteById(Integer.parseInt(groupId));
        return "redirect:/group";
    }

    @PostMapping("/editGroup")
    public String editGroup(@ModelAttribute("userGroup") UserGroup userGroup, HttpServletRequest req) {
        String groupId = req.getParameter("groupId");
        userGroupRepository.save(userGroup);
        return "redirect:/groupEdit?groupId=" + groupId;
    }
}
