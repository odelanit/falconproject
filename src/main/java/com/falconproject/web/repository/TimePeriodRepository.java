package com.falconproject.web.repository;

import com.falconproject.web.models.TimePeriod;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TimePeriodRepository extends JpaRepository<TimePeriod, Integer> {
    TimePeriod findByTimeVal(Integer val);
}
