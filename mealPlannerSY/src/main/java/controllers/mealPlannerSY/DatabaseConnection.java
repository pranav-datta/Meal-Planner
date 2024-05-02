package controllers.mealPlannerSY;

import java.sql.*;


public class DatabaseConnection {

    public Connection databaseLink;

    public Connection getConnection() {
        String databaseName = "Meal_Planner";
        String databaseUser = "root";
        String databasePassword = "tahini$ky271";
        String url = "jdbc:mysql://" + "127.0.0.1/" + databaseName;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            databaseLink = DriverManager.getConnection(url, databaseUser, databasePassword);
            System.out.println(databaseLink);
            System.out.println("success");
        }
        catch (Exception e){
            e.printStackTrace();
            System.out.println("failed!!!");
        }
        return databaseLink;

    }

    public ResultSet executeQuery(String query) throws SQLException {
        databaseLink = getConnection();
        Statement statement = databaseLink.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        return resultSet;
    }






}
