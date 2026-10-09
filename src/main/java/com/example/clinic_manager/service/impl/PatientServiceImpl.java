package com.example.clinic_manager.service.impl;

import com.example.clinic_manager.model.Patient;
import com.example.clinic_manager.service.PatientService;

import java.util.Optional;

public class PatientServiceImpl implements PatientService {
    @Override
    public Optional<Patient> findById(Long id) {
        return Optional.empty();
    }

    @Override
    public Optional<Patient> findByEmail(String email) {
        return Optional.empty();
    }

    @Override
    public void updateProfile(Patient patient) {

    }

    @Override
    public void updatePassword(Long patientId, String oldPassword, String newPassword) {

    }

    @Override
    public void setActive(Long patientId, boolean active) {

    }
}
