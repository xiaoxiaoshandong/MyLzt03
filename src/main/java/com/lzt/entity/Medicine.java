package com.lzt.entity;

public class Medicine {
    private Integer id;

    private String medicineName;

    private String medicineNumb;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName == null ? null : medicineName.trim();
    }

    public String getMedicineNumb() {
        return medicineNumb;
    }

    public void setMedicineNumb(String medicineNumb) {
        this.medicineNumb = medicineNumb == null ? null : medicineNumb.trim();
    }
}