package com.fastcampus.ch4.domain;

public class PersonDto {
    private String name;
    private String title;
    private String email;
    private String experience;
    private String education;
    private String certificates;


    public PersonDto(String name, String title, String email, String experience, String education, String certificates) {
        this.name = name;
        this.title = title;
        this.email = email;
        this.experience = experience;
        this.education = education;
        this.certificates = certificates;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getCertificates() {
        return certificates;
    }

    public void setCertificates(String certificates) {
        this.certificates = certificates;
    }

    @Override
    public String toString() {
        return "PersonDto{" +
                "name='" + name + '\'' +
                ", title='" + title + '\'' +
                ", experience='" + experience + '\'' +
                ", education='" + education + '\'' +
                ", certificates='" + certificates + '\'' +
                '}';
    }
}
