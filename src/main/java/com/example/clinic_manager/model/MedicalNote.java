package com.example.clinic_manager.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "medical_notes")
public class MedicalNote {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(
            name = "appointment_id",
            nullable = false,
            unique = true
    )
    private Appointment appointment;

    @ManyToOne
    @JoinColumn(name = "doctor_id", nullable = false)
    private Doctor doctor;

    private String diagnostic;

    @Column(columnDefinition = "TEXT")
    private String content;

    private LocalDateTime noteDate;

    private boolean readOnly = false;

    public MedicalNote() {
    }

    public Long getId() {
        return id;
    }

    public Appointment getAppointment() {
        return appointment;
    }

    public void setAppointment(Appointment appointment) {
        this.appointment = appointment;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public String getDiagnostic() {
        return diagnostic;
    }

    public void setDiagnostic(String diagnostic) {
        this.diagnostic = diagnostic;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getNoteDate() {
        return noteDate;
    }

    public void setNoteDate(LocalDateTime noteDate) {
        this.noteDate = noteDate;
    }

    public boolean isReadOnly() {
        return readOnly;
    }

    public void setReadOnly(boolean readOnly) {
        this.readOnly = readOnly;
    }
}
