package com.example.clinic_manager.model;

import com.example.clinic_manager.model.enums.Role;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "admins")
public class Admin extends User {

    private String firstName;
    private String lastName;
    private String phone;

    @Override
    public Role getRole() {
        return Role.ADMIN;
    }

    public Admin() {
    }

    public Admin(
            String email,
            String password,
            boolean active,
            String firstName,
            String lastName,
            String phone
    ) {
        super(email, password, active);

        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}