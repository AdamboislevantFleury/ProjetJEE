package com.example.webapp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Champions {
    private List<String> champList = new ArrayList<>();
    public Champions() throws SQLException {
        DatabaseUtils databaseUtils = DatabaseUtils.getInstance();
        String query = "SELECT * FROM "+databaseUtils.getDatabase()+".champions";
        ResultSet resultSet = null;
        resultSet = databaseUtils.sendQuery(query);
        while(resultSet.next()){
            champList.add(resultSet.getString("name"));
        }
    }

    public List<String> getChampList() throws SQLException {
        return new Champions().champList;
    }
}
