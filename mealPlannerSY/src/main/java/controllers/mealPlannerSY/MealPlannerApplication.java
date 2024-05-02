
package controllers.mealPlannerSY;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.scene.layout.Pane;

public class MealPlannerApplication extends Application {
    @Override
    public void start(Stage stage) throws Exception {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader();
            System.out.println(getClass().getResource("/controllers.mealPlannerSY.fxml/loginScreen.fxml"));
            fxmlLoader.setLocation(getClass().getResource("/controllers.mealPlannerSY.fxml/loginScreen.fxml"));
            Scene scene = new Scene(fxmlLoader.load(), 700, 400);
            stage.setScene(scene);
            stage.show();
        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        launch(args);
    }
}