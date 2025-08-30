package com.xypay.xypay.service;

import com.xypay.xypay.domain.Branch;
import com.xypay.xypay.repository.BranchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class BranchService {
    @Autowired
    private BranchRepository branchRepository;
    public Branch createBranch(String name, String code, String address) {
        Branch branch = new Branch();
        branch.setName(name);
        branch.setCode(code);
        branch.setAddress(address);
        branch.setActive(true);
        return branchRepository.save(branch);
    }
    public Branch getBranch(Long id) {
        return branchRepository.findById(id).orElse(null);
    }
    public List<Branch> listBranches() {
        return branchRepository.findAll();
    }
    public void setActive(Long id, boolean active) {
        Branch branch = getBranch(id);
        if (branch != null) {
            branch.setActive(active);
            branchRepository.save(branch);
        }
    }
}