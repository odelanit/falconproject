package com.falconproject.web.repository;

import com.falconproject.web.models.ServiceCall;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ServiceCallRepository extends JpaRepository<ServiceCall, Long> {
}
