package com.example.webapp;

import java.util.HashMap;

// Il me reste à faire en sorte de metre l'objet dans la bdd a coté du role user
public class Rights {
    private HashMap<String,Boolean> rights = new HashMap<>();;

    public Rights(int role){
        if(role != 2){
            rights.put("addChamp",true);  //ajouter un personnage
            rights.put("deleteChamp",true);   //supprimer un personnage
            rights.put("addUser",true);  //ajoouter un utilisateur depuis le site
            rights.put("deleteUser",true);   //supprimer un utilsateur depuis la site
            rights.put("changeId",true); //pouvoir modifier ou non ses identifiants
        }
        else{
            rights.put("addChamp",false);  //ajouter un personnage
            rights.put("deleteChamp",false);   //supprimer un personnage
            rights.put("addUser",false);  //ajoouter un utilisateur depuis le site
            rights.put("deleteUser",false);   //supprimer un utilsateur depuis la site
            rights.put("changeId",true); //pouvoir modifier ou non ses identifiants
        }
    }

    public HashMap<String,Boolean> getRights(){
        return this.rights;
    }
}
