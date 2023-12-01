package com.example.webapp;

import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Champions {

    public static JSONObject getRandomChampionByLane(DatabaseUtils db, String role) {
        try {
            String query = "SELECT * FROM champions WHERE role = '" + role + "' ORDER BY RAND() LIMIT 1";
            ResultSet resultSet = db.sendQuery(query);

            if (resultSet.next()) {
                JSONObject champion = new JSONObject();
                champion.put("Product_id",resultSet.getString("idChampions"));
                champion.put("name", resultSet.getString("name"));
                champion.put("image_url", resultSet.getString("image_url"));
                champion.put("role", resultSet.getString("role"));
                champion.put("description", resultSet.getString("description"));
                champion.put(("prix"), resultSet.getString("prix"));
                return champion;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
