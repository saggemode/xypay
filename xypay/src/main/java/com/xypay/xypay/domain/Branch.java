package com.xypay.xypay.domain;

import jakarta.persistence.*;

@Entity
public class Branch {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String code;
    private String address;
    private boolean isActive = true;

    // Getters and setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public boolean isActive() { return isActive; }
    public void setActive(boolean active) { isActive = active; }
}
