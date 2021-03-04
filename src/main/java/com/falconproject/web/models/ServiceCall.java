package com.falconproject.web.models;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "service_calls")
public class ServiceCall {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int integerField;

    private String stringField;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateField;

    @ManyToMany(cascade = CascadeType.REMOVE, fetch = FetchType.EAGER)
    @JoinTable(name = "service_call_file", joinColumns = @JoinColumn(name = "service_call_id"), inverseJoinColumns = @JoinColumn(name = "file_id"))
    private Set<FileDB> files;

    @Column(columnDefinition = "TEXT")
    private String editorField;

    @Column(columnDefinition = "TEXT")
    private String secondEditor;

    private String username;

    @CreationTimestamp
    @Column(updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    private LocalDateTime updatedAt;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getIntegerField() {
        return integerField;
    }

    public void setIntegerField(int integerField) {
        this.integerField = integerField;
    }

    public String getStringField() {
        return stringField;
    }

    public void setStringField(String stringField) {
        this.stringField = stringField;
    }

    public Date getDateField() {
        return dateField;
    }

    public void setDateField(Date dateField) {
        this.dateField = dateField;
    }

    public Set<FileDB> getFiles() {
        return files;
    }

    public void setFiles(Set<FileDB> files) {
        this.files = files;
    }

    public String getEditorField() {
        return editorField;
    }

    public void setEditorField(String editorField) {
        this.editorField = editorField;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public void removeFileDB(FileDB fileDB) {
        files.remove(fileDB);
        fileDB.getPosts().remove(this);
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSecondEditor() {
        return secondEditor;
    }

    public void setSecondEditor(String secondEditor) {
        this.secondEditor = secondEditor;
    }
}
