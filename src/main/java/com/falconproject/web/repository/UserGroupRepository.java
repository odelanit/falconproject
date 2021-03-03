package com.falconproject.web.repository;

import com.falconproject.web.models.UserGroup;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserGroupRepository extends JpaRepository<UserGroup, Integer> {
    UserGroup findByGroupName(String name);
}
