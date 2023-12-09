package com.example.webapp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class Rights {
    // classe qui représente les droits, met à jours la bdd quand appellée et est "permanant" tant qu'on utilise le site (singleton)
    private static Rights rights = null;;
    private static HashMap<String,String> collection;

    public Rights(String idUser) throws SQLException {
        collection = new HashMap<>();
        DatabaseUtils db = DatabaseUtils.getInstance();
        String query = "SELECT * FROM "+db.getDatabase() +".permissions WHERE id_user = "+idUser;
        ResultSet rs = null;
        rs = db.sendQuery(query);
        if(rs.next()){
            collection.put("add",rs.getString("add"));  //ajouter un personnage
            collection.put("remove",rs.getString("remove"));   //supprimer un personnage
            collection.put("edit",rs.getString("edit"));  //modifier les droits d'un client
            collection.put("promote",rs.getString("promote"));   //promouvoir client en admin
            collection.put("id_user",rs.getString("id_user")); //identifiant du user
        }
    }

    public void setRights(String right,String value) throws SQLException {
        collection.put(right,value);
        DatabaseUtils db = DatabaseUtils.getInstance();
        String query = "UPDATE "+db.getDatabase() +".permissions SET "+right+" = "+value+" WHERE id_user = "+collection.get("id_user");
        ResultSet rs = null;
        rs = db.sendQuery(query);
    }

    public void setRights(HashMap<String,String> map) throws SQLException {
        for(Map.Entry<String,String> mapEntry : map.entrySet()){
            this.setRights(mapEntry.getKey(), mapEntry.getValue());
        }
    }

    public HashMap<String, String> getCollection(){
        return collection;
    }

    public static Rights getInstance(String idUser) throws SQLException {
        if (rights == null) {
            return new Rights(idUser);
        }
        System.out.println("Roles créés");
        return rights;
    }

    public void affichage(){
        System.out.println("id : "+collection.get("id_user"));
        System.out.println("ajouter : "+collection.get("add"));
        System.out.println("supprimer : "+collection.get("remove"));
        System.out.println("edit : "+collection.get("edit"));
        System.out.println("promote : "+collection.get("promote"));
    }
}
