package com.falconproject.web.models;

import javax.persistence.*;

@Entity
@Table(name = "time_period")
public class TimePeriod {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer timeId;

    int timeVal;

    public Integer getTimeId() {
        return timeId;
    }

    public void setTimeId(Integer timeId) {
        this.timeId = timeId;
    }

    public int getTimeVal() {
        return timeVal;
    }

    public void setTimeVal(int timeVal) {
        this.timeVal = timeVal;
    }
}
