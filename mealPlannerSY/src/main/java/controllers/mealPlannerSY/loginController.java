package controllers.mealPlannerSY;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Hyperlink;
import javafx.scene.control.PasswordField;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import javafx.scene.Scene;
import java.io.IOException;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;

public class loginController extends DatabaseConnection {

    private Stage stage;
    private Scene scene;

    public loginController() {

    }

    @FXML
    private Button loginButton;
    @FXML
    private TextField email;
    @FXML
    private PasswordField password;

    @FXML
    private Hyperlink clickHereLink;


    @FXML
    public void userLogin(ActionEvent event) throws Exception {
        FXMLLoader fxmlLoader = new FXMLLoader();
        String currEmail = email.getText();
        String currPass = password.getText();
        Boolean correctLogin = false;
        String userQuery = "SELECT Email, Password FROM USER WHERE Email = '" + currEmail + "' AND Password = '" + currPass + "'";
        ResultSet result = executeQuery(userQuery);
        while(result.next()) {
            String queryEmail = result.getString("Email");
            String queryPass = result.getString("Password");
            if(queryEmail != null && queryPass != null) {
                correctLogin = true;
            }
        }
        //case 1: login successful
        if(correctLogin) {
            stage = (Stage) loginButton.getScene().getWindow();
            fxmlLoader.setLocation(getClass().getResource("/controllers.mealPlannerSY.fxml/Wireframe3.fxml"));
            Scene scene = new Scene(fxmlLoader.load(), 500, 500);
            stage.setScene(scene);
            stage.show();
        }
        //case 2: login unsuccessful
        else {
            System.out.println("fuck ya life");
        }


    }

    @FXML
    public void createAccountButton(ActionEvent actionEvent) throws Exception{
        FXMLLoader fxmlLoader = new FXMLLoader();

        stage = (Stage) loginButton.getScene().getWindow();
        fxmlLoader.setLocation(getClass().getResource("/controllers.mealPlannerSY.fxml/Wireframe2.fxml"));
        Scene scene = new Scene(fxmlLoader.load(), 500, 500);
        stage.setScene(scene);
        stage.show();


    }
}
