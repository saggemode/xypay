package com.xypay.xypay.domain;

import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;
import java.util.UUID;

@Data
@Entity
@Table(name = "gl_accounts")
public class GLAccount {
    
    @Id
    @GeneratedValue
    private UUID id;
    
    private String code;
    
    private String name;
    
    private String type;
    
    private BigDecimal balance;
}