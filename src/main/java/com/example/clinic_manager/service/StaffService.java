package com.example.clinic_manager.service;

import com.example.clinic_manager.model.Staff;

import java.util.List;
import java.util.Optional;

public interface StaffService {
    void createStaff(Staff staff);

    Optional<Staff> getStaffById(Long id);

    List<Staff> getAllStaff();

    void updateStaff(Staff staff);

    void deleteStaff(Long id);
}
