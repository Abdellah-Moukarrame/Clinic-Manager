package com.example.clinic_manager.model;

import com.example.clinic_manager.model.enums.Gender;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "patients")
public class Patient extends User {

    @Column(nullable = false, unique = true)
    private String cin;

    private String firstName;
    private String lastName;

    private LocalDate birthDate;

    @Enumerated(EnumType.STRING)
    private Gender gender;

    private String address;
    private String phone;
    private String bloodGroup;

    @OneToMany(mappedBy = "patient")
    private List<Appointment> appointments = new ArrayList<>();

    public Patient() {
    }

    public String getCin() {
        return cin;
    }

    public void setCin(String cin) {
        this.cin = cin;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public List<Appointment> getAppointments() {
        return appointments;
    }
}