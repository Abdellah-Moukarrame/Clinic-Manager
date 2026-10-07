package com.example.clinic_manager.service;

import com.example.clinic_manager.model.Patient;

import java.util.Optional;

public interface PatientService {
   public Optional<Patient> findById( long id) ;
   public Optional<Patient> findByEmail (String email);
   public void updateProfile();
   public void updatePassword();

    void setActive(Long patientId, boolean active);
}
