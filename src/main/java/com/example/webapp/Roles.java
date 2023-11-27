package com.example.webapp;

import java.util.HashMap;

// Il me reste à faire en sorte de metre l'objet dans la bdd a coté du role user
public class Roles {
    private HashMap<String,Boolean> roles = new HashMap<>();;

    public Roles(int role){

    }

    //exemple basiques de droits, à modifier
    public void setAdminRoles(int userId){
        if(userId != 2){
            roles.put("addChamp",true);  //ajouter un personnage
            roles.put("deleteChamp",true);   //supprimer un personnage
            roles.put("addUser",true);  //ajoouter un utilisateur depuis le site
            roles.put("deleteUser",true);   //supprimer un utilsateur depuis la site
            roles.put("changeId",true); //pouvoir modifier ou non ses identifiants
        }

    }

    public void setUserRoles(int userId){
        if(userId == 1){
            roles.put("addChamp",false);  //ajouter un personnage
            roles.put("deleteChamp",false);   //supprimer un personnage
            roles.put("addUser",false);  //ajoouter un utilisateur depuis le site
            roles.put("deleteUser",false);   //supprimer un utilsateur depuis la site
            roles.put("changeId",true); //pouvoir modifier ou non ses identifiants
        }

    }

}
