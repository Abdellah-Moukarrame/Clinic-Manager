package com.example.clinic_manager.service;

import com.example.clinic_manager.model.Patient;

import java.util.Optional;

public interface PatientService {
    Optional<Patient> findById(Long id);

    Optional<Patient> findByEmail(String email);

    void updateProfile(Patient patient);

    void updatePassword(Long patientId, String oldPassword, String newPassword);

    void setActive(Long patientId, boolean active);
}
