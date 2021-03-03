package com.falconproject.web.models;

import javax.persistence.*;

@Entity
@Table(name = "restricted_data")
public class RestrictedData {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer rdId;

    private String rdName;

    public Integer getRdId() {
        return rdId;
    }

    public void setRdId(Integer rdId) {
        this.rdId = rdId;
    }

    public String getRdName() {
        return rdName;
    }

    public void setRdName(String rdName) {
        this.rdName = rdName;
    }
}
