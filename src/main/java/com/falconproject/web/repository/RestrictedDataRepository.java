package com.falconproject.web.repository;

import com.falconproject.web.models.RestrictedData;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RestrictedDataRepository extends JpaRepository<RestrictedData, Integer> {
}
