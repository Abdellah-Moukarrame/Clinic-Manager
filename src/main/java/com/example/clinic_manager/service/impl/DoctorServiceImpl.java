package com.example.clinic_manager.service.impl;

import com.example.clinic_manager.model.Doctor;
import com.example.clinic_manager.service.DoctorService;

import java.util.List;
import java.util.Optional;

public class DoctorServiceImpl implements DoctorService {
    @Override
    public void createDoctor(Doctor doctor) {

    }

    @Override
    public Optional<Doctor> getDoctorById(Long id) {
        return Optional.empty();
    }

    @Override
    public List<Doctor> getAllDoctors() {
        return List.of();
    }

    @Override
    public void updateDoctor(Doctor doctor) {

    }

    @Override
    public void deleteDoctor(Long id) {

    }
}
