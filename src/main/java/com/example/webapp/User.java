package com.example.webapp;

import java.util.HashMap;

public class User {
    private String name;
    private String firstname;
    private String email;
    private String password;
    private HashMap<String,Boolean> roles;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public HashMap<String, Boolean> getRole() {
        return roles;
    }

    public void setRole(String role,Boolean value) {
        if(roles.containsKey(role)) {
            roles.replace(role, roles.get(role), value);
        }
        else{ // à modifier car pas sur de vouloir ajouter de nouveaux roles, en cas d'erreur -> probleme
            roles.put(role,value);
        }
    }
}
