package sample;

import javafx.fxml.FXML;
import javafx.scene.control.TextArea;


public class ControllerProlog {

    @FXML
    TextArea testo;


    public void setTesto(String testo) {
        this.testo.setText(testo);
    }


}
