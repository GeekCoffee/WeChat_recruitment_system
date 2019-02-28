package com.geektech.entity;


public class ChengdeRegister {

    private int userid;   // 用户ID

    private String name;    // 姓名

    private String sex;   // 性别

    private int age;   //年龄

    private String phone;   // 电话

    private String speciality;   // 技能

    private String position;  // 期待职位

    private String salary;   // 期待工资

    private String treatment;  // 期待待遇

    private String experience;   // 曾经经历

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getTreatment() {
        return treatment;
    }

    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    @Override
    public String toString() {
        return "ChengdeRegister{" +
                "userid=" + userid +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", phone='" + phone + '\'' +
                ", speciality='" + speciality + '\'' +
                ", position='" + position + '\'' +
                ", salary='" + salary + '\'' +
                ", treatment='" + treatment + '\'' +
                ", experience='" + experience + '\'' +
                '}';
    }
}
