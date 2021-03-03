package com.falconproject.web.form;

import com.falconproject.web.models.TimePeriod;
import com.falconproject.web.models.User;

public class TimeAllocateForm {
    User user;

    TimePeriod timePeriod;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public TimePeriod getTimePeriod() {
        return timePeriod;
    }

    public void setTimePeriod(TimePeriod timePeriod) {
        this.timePeriod = timePeriod;
    }
}
