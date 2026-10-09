package com.example.clinic_manager.service.impl;

import com.example.clinic_manager.model.Department;
import com.example.clinic_manager.service.DepartementService;

import java.util.List;
import java.util.Optional;

public class DepartementServiceImpl implements DepartementService {
    @Override
    public void createDepartment(Department department) {

    }

    @Override
    public Optional<Department> getDepartmentById(Long id) {
        return Optional.empty();
    }

    @Override
    public List<Department> getAllDepartments() {
        return List.of();
    }

    @Override
    public void updateDepartment(Department department) {

    }

    @Override
    public void deleteDepartment(Long id) {

    }
}
