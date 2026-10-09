package com.example.clinic_manager.service.impl;

import com.example.clinic_manager.model.Specialty;
import com.example.clinic_manager.service.SpecialityService;

import java.util.List;
import java.util.Optional;

public class SpecialityServiceImpl implements SpecialityService {
    @Override
    public void createSpecialty(Specialty specialty) {

    }

    @Override
    public Optional<Specialty> getSpecialtyById(Long id) {
        return Optional.empty();
    }

    @Override
    public List<Specialty> getAllSpecialties() {
        return List.of();
    }

    @Override
    public void updateSpecialty(Specialty specialty) {

    }

    @Override
    public void deleteSpecialty(Long id) {

    }
}
