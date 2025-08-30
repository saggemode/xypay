package com.xypay.xypay.domain;

import jakarta.persistence.*;

@Entity
public class WorkflowDefinition {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Lob
    private String configJson;

    private String owner;

    // Getters and setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getConfigJson() { return configJson; }
    public void setConfigJson(String configJson) { this.configJson = configJson; }
    public String getOwner() { return owner; }
    public void setOwner(String owner) { this.owner = owner; }
}
