package com.falconproject.web.repository;

import com.falconproject.web.models.ServiceCall;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ServiceCallRepository extends JpaRepository<ServiceCall, Long>, JpaSpecificationExecutor<ServiceCall> {
}
