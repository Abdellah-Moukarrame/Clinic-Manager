package com.example.clinic_manager.service;

import com.example.clinic_manager.model.Doctor;

import java.util.List;
import java.util.Optional;

public interface DoctorService {
    void createDoctor(Doctor doctor);

    Optional<Doctor> getDoctorById(Long id);

    List<Doctor> getAllDoctors();

    void updateDoctor(Doctor doctor);

    void deleteDoctor(Long id);
}
