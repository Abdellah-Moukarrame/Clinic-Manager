package com.example.clinic_manager.service;

import com.example.clinic_manager.model.Department;

import java.util.List;
import java.util.Optional;

public interface DepartementService {
    void createDepartment(Department department);

    Optional<Department> getDepartmentById(Long id);

    List<Department> getAllDepartments();

    void updateDepartment(Department department);

    void deleteDepartment(Long id);
}
