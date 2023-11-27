package com.example.webapp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserList {
        private static List<String> userList = new ArrayList<>();

        public UserList() throws SQLException {
            DatabaseUtils databaseUtils = DatabaseUtils.getInstance();
            String query = "SELECT * FROM "+databaseUtils.getDatabase()+".user";
            ResultSet resultSet = null;
            resultSet = databaseUtils.sendQuery(query);
            while(resultSet.next()){
                userList.add(resultSet.getString("email"));
            }
        }
        public List<String> getUserList() throws SQLException {
            return userList;
        }
}
