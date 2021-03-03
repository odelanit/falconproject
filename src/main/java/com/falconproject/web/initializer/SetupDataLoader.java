package com.falconproject.web.initializer;

import com.falconproject.web.models.*;
import com.falconproject.web.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@Component
public class SetupDataLoader implements ApplicationListener<ContextRefreshedEvent> {
    boolean alreadySetup = false;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MenuRepository menuRepository;

    @Autowired
    private UserGroupRepository userGroupRepository;

    @Autowired
    private TimePeriodRepository timePeriodRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
        if (alreadySetup) return;

        Role adminRole = createRoleIfNotFound("admin");
        Optional<User> optionalAdmin = userRepository.findByUsername("admin");
        if (!optionalAdmin.isPresent()) {
            User user = new User();
            user.setUsername("admin");
            user.setPassword(passwordEncoder.encode("123456"));
            user.setEnabled(true);

            Set<Role> set = new HashSet<>();
            set.add(adminRole);
            user.setRoles(set);

            userRepository.save(user);
        }

        Optional<User> optionalUser = userRepository.findByUsername("user");
        Role userRole = createRoleIfNotFound("user");
        if (!optionalUser.isPresent()) {
            User user = new User();
            user.setUsername("user");
            user.setPassword(passwordEncoder.encode("123456"));
            user.setEnabled(true);

            Set<Role> set = new HashSet<>();
            set.add(userRole);
            user.setRoles(set);

            userRepository.save(user);
        }

        createUserGroup("Admin", "Admin");

        createMenu("Users", "userRegistration", "true");
        createMenu("Groups", "group", "true");
        createMenu("Logout", "logout", "gen");
        createMenu("Change Password", "change_password", "gen");
        createMenu("Time Period", "timePeriod", "gen");
        createMenu("Permission", "user_group_permissions", "gen");
        createMenu("Restrivted Access", "assignRestrictedAccess", "gen");
        createMenu("Register User", "registerUser", "gen");
        createMenu("Assign Group", "assignGroup", "gen");
        createMenu("Create Group", "createGroup", "gen");
        createMenu("Group Edit", "groupEdit", "gen");
        createMenu("User Deletion", "userDeletion", "gen");
        createMenu("Group Deletion", "groupDeletion", "gen");
        createMenu("Edit Group", "editGroup", "gen");
        createMenu("Service Call", "/serviceCall", "true");

        createTimePeriod(0);
        createTimePeriod(30);
        createTimePeriod(45);
        createTimePeriod(60);
        createTimePeriod(90);
        createTimePeriod(120);
        createTimePeriod(240);
        createTimePeriod(360);
        createTimePeriod(2);

        alreadySetup = true;
    }

    @Transactional
    Role createRoleIfNotFound(String name) {
        Role role = roleRepository.findByName(name);
        if (role == null) {
            role = new Role();
            role.setName(name);
            roleRepository.save(role);
        }
        return role;
    }

    @Transactional
    void createMenu(String name, String url, String enabled) {
        Menu menu = menuRepository.findByMenuName(name);
        if (menu == null) {
            menu = new Menu();
            menu.setMenuName(name);
            menu.setMenuUrl(url);
            menu.setMenuEnabled(enabled);
            menuRepository.save(menu);
        }
    }

    @Transactional
    void createUserGroup(String name, String description) {
        UserGroup userGroup = userGroupRepository.findByGroupName(name);
        if (userGroup == null) {
            userGroup = new UserGroup();
            userGroup.setGroupId(2);
            userGroup.setGroupName(name);
            userGroup.setGroupDescription(description);
            userGroupRepository.save(userGroup);
        }
    }

    @Transactional
    void createTimePeriod(int minutes) {
        TimePeriod timePeriod = timePeriodRepository.findByTimeVal(minutes);
        if (timePeriod == null) {
            timePeriod = new TimePeriod();
            timePeriod.setTimeVal(minutes);
            timePeriodRepository.save(timePeriod);
        }
    }
}
