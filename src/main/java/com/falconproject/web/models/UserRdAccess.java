package com.falconproject.web.models;

import javax.persistence.*;

@Entity
@Table(name = "user_rd_access")
public class UserRdAccess {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "rd_id")
    private RestrictedData restrictedData;

    String accessFlag;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public RestrictedData getRestrictedData() {
        return restrictedData;
    }

    public void setRestrictedData(RestrictedData restrictedData) {
        this.restrictedData = restrictedData;
    }

    public String getAccessFlag() {
        return accessFlag;
    }

    public void setAccessFlag(String accessFlag) {
        this.accessFlag = accessFlag;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
