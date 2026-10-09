package com.example.clinic_manager.service.impl;

import com.example.clinic_manager.model.Staff;
import com.example.clinic_manager.service.StaffService;

import java.util.List;
import java.util.Optional;

public class StaffServiceImpl implements StaffService {
    @Override
    public void createStaff(Staff staff) {

    }

    @Override
    public Optional<Staff> getStaffById(Long id) {
        return Optional.empty();
    }

    @Override
    public List<Staff> getAllStaff() {
        return List.of();
    }

    @Override
    public void updateStaff(Staff staff) {

    }

    @Override
    public void deleteStaff(Long id) {
        
    }
}
