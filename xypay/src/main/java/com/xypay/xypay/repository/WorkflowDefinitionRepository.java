package com.xypay.xypay.repository;

import com.xypay.xypay.domain.WorkflowDefinition;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface WorkflowDefinitionRepository extends JpaRepository<WorkflowDefinition, Long> {
    List<WorkflowDefinition> findByOwner(String owner);
}
