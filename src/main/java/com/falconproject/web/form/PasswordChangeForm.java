package com.falconproject.web.form;

import com.falconproject.web.models.User;

public class PasswordChangeForm {
    User user;
    String newPassword;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}
