package com.example.clinic_manager.service;

import com.example.clinic_manager.model.Specialty;

import java.util.List;
import java.util.Optional;

public interface SpecialityService {
    void createSpecialty(Specialty specialty);

    Optional<Specialty> getSpecialtyById(Long id);

    List<Specialty> getAllSpecialties();

    void updateSpecialty(Specialty specialty);

    void deleteSpecialty(Long id);
}
