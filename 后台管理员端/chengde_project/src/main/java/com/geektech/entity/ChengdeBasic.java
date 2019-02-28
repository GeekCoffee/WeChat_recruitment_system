package com.geektech.entity;

/**
 * Created by root on 2018/4/6.
 * *
 */
public class ChengdeBasic {

    private String root;

        private String password;

    public String getRoot() {
        return root;
    }

    public void setRoot(String root) {
        this.root = root;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "ChengdeBasic{" +
                "root='" + root + '\'' +
                ", password='" + password + '\'' +
                '}';
    }


}
