package controllers.mealPlannerSY;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import java.io.IOException;

public class createAccountController {

    private Stage stage;
    private Scene scene;


    public createAccountController() {

    }

    @FXML
    private Button createAccountButton;
    @FXML
    private TextField createEmail;
    @FXML
    private TextField createPassword;
    @FXML
    private TextField createName;
    @FXML
    private TextField createAddy;

    @FXML
    public void setCreateAccountButton(ActionEvent event) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader();

        String email = createEmail.getText();
        Boolean emailCheck = false;


        if (email.indexOf("@") != -1 && (email.substring(email.indexOf("@") + 1, email.indexOf("@") + 2).matches("^[a-zA-Z0-9]*$")
                && email.substring(email.indexOf("@") - 1, email.indexOf("@")).matches("^[a-zA-Z0-9]*$"))){
                emailCheck = true;

        }
        if ()







        //fxmlLoader = MealPlannerApplication.class.getResource("/controllers.mealPlannerSY.fxml/Wireframe4.fxml");
        Scene scene = new Scene(fxmlLoader.load());
        // stage = getCurrentStage(event);
        stage.setScene(scene);
        stage.show();
    }








}
