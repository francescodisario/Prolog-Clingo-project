package sample;

import javafx.animation.PauseTransition;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Pos;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.control.ToggleButton;
import javafx.scene.input.MouseButton;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.GridPane;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import javafx.util.Duration;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;

public class Controller {

    @FXML
    Button conferma;

    @FXML
    Button simula;

    @FXML
    Button anima;

    @FXML
    TextField posX;

    @FXML
    TextField posY;

    @FXML
    TextField righe;

    @FXML
    TextField colonne;

    @FXML
    GridPane grid;

    boolean alreadyGenerated = false;

    private MyToggleButton[][] matrice;

    private String[][] matriceRisultato;

    private GridPane labirinto;

    private int x;
    private int y;

    private int numColonne;
    private int numRighe;
    private String[] azioni;

    private boolean ostacolo = false;

    @FXML
    private void initialize() {

    }

    @FXML
    private void generaTabella() {

        grid.getChildren().remove(labirinto);

        x = Integer.parseInt(posX.getText()) - 1;
        y = Integer.parseInt(posY.getText()) - 1;

        numRighe = Integer.parseInt(righe.getText());
        numColonne = Integer.parseInt(colonne.getText());

        labirinto = new GridPane();

        matrice = new MyToggleButton[numRighe][numColonne];
        matriceRisultato = new String[numRighe][numColonne];

        for (int i = 0; i < numRighe; i++) {
            for (int j = 0; j < numColonne; j++) {
                matrice[i][j] = new MyToggleButton(i, j);
                matrice[i][j].setMaxSize(15, 15);
                matrice[i][j].setMinSize(15, 15);
                setListener(matrice[i][j]);
                if (i == x && j == y) {
                    matrice[i][j].setStyle("-fx-background-color: #549ccb");
                    matriceRisultato[i][j] = "start";
                }
            }
        }

        for (int i = 0; i < numRighe; i++) {
            for (int j = 0; j < numColonne; j++) {
                labirinto.addRow(i, matrice[i][j]);
            }
        }

        labirinto.setAlignment(Pos.CENTER);
        grid.add(labirinto, 0, 2, 1, 1);

    }

    @FXML
    public void salvaProlog() {
        StringBuilder kb = ottieniKB();
        salvaSuFile(kb);
        try {
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("prolog.fxml"));
            Parent root1 = fxmlLoader.load();
            ControllerProlog controllerProlog = fxmlLoader.getController();
            controllerProlog.setTesto(kb.toString());
            Stage stage = new Stage();
            stage.setHeight(640);
            stage.setHeight(480);
            stage.setTitle("Prolog");
            stage.setScene(new Scene(root1));
            stage.show();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    private StringBuilder ottieniKB() {
        StringBuilder kb = new StringBuilder();
        kb.append("num_righe(").append(numRighe).append(").\n");
        kb.append("num_colonne(").append(numColonne).append(").\n\n");
        kb.append("iniziale(pos(").append(x + 1).append(",").append(y + 1).append(")).\n\n");


        for (int i = 0; i < matriceRisultato.length; i++) {
            for (int j = 0; j < matriceRisultato[i].length; j++) {
                if (matriceRisultato[i][j] != null && matriceRisultato[i][j].equals("goal")) {
                    kb.append("finale(pos(").append(i + 1).append(",").append(j + 1).append(")).\n");
                }
            }
        }
        kb.append("\n");
        for (int i = 0; i < matriceRisultato.length; i++) {
            for (int j = 0; j < matriceRisultato[i].length; j++) {
                if (matriceRisultato[i][j] != null && matriceRisultato[i][j].equals("obstacle")) {
                    kb.append("occupata(pos(").append(i + 1).append(",").append(j + 1).append(")).\n");
                }
            }
        }

        return kb;
    }

    @FXML
    public void trovaSoluzione() {
        System.out.println("Simula");
        StringBuilder kb = ottieniKB();
        salvaSuFile(kb);
        Runtime rt = Runtime.getRuntime();
        String line = null;
        String risposta = null;
        try {
            Process pr = rt.exec("swipl -s esegui.pl -g esegui(S) -t halt");
            BufferedReader input = new BufferedReader(new InputStreamReader(pr.getInputStream()));
            try {
                while ((line = input.readLine()) != null) {
                    System.out.println(line);
                    risposta = line;
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (risposta != null) {
            muoviRobot(risposta);
        }
    }

    private void muoviRobot(String risposta) {
        String tmp = risposta.substring(1, risposta.length() - 1);
        String[] azioniInv = tmp.split(",");
        azioni = new String[azioniInv.length];
        for (int i = azioniInv.length - 1, j = 0; i >= 0; i--, j++) {
            azioni[j] = azioniInv[i];
        }
        int rX = x + 1;
        int rY = y + 1;
        for (int i = 0; i < azioni.length - 1; i++) {
            switch (azioni[i]) {
                case "est":
                    rY += 1;
                    matrice[rX - 1][rY - 1].setStyle("-fx-background-color: #eeed28");
                    break;
                case "ovest":
                    rY -= 1;
                    matrice[rX - 1][rY - 1].setStyle("-fx-background-color: #eeed28");
                    break;
                case "sud":
                    rX += 1;
                    matrice[rX - 1][rY - 1].setStyle("-fx-background-color: #eeed28");
                    break;
                case "nord":
                    rX -= 1;
                    matrice[rX - 1][rY - 1].setStyle("-fx-background-color: #eeed28");
                    break;
            }
        }
        System.out.println("finale: " + rX + "," + rY);
    }

    @FXML
    public void animaRobot() throws InterruptedException {
        int rX = x + 1;
        int rY = y + 1;

        int millisec = 20;

        for (int i = 0; i < azioni.length; i++, millisec += 20) {

            switch (azioni[i]) {
                case "est":
                    rY += 1;
                    break;
                case "ovest":
                    rY -= 1;
                    break;
                case "sud":
                    rX += 1;
                    break;
                case "nord":
                    rX -= 1;
                    break;
            }
//            matrice[rX - 1][rY - 1].setStyle("-fx-background-color: #549ccb");


            PauseTransition pause = new PauseTransition(
                    Duration.millis(millisec));
            int finalRX = rX;
            int finalRY = rY;
            pause.setOnFinished(event -> {
                matrice[finalRX - 1][finalRY - 1].setStyle("-fx-background-color: #549ccb");
            });
            pause.play();

        }
    }

    private void salvaSuFile(StringBuilder kb) {
        File file = new File("labirinto.pl");
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            FileWriter fileWriter = new FileWriter(file);
            fileWriter.write(kb.toString());
            fileWriter.close();
            System.out.println("File salvato");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void setListener(MyToggleButton myToggleButton) {
        myToggleButton.setOnMouseClicked(mouseEvent -> {
            if (myToggleButton.getX() == x && myToggleButton.getY() == y) {
                return;
            }
            if (mouseEvent.getButton() == MouseButton.PRIMARY) {
                if (myToggleButton.getState().equals("empty")) {
                    myToggleButton.setState("goal");
                    myToggleButton.setStyle("-fx-background-color: #31ae4f");
                    matriceRisultato[myToggleButton.getX()][myToggleButton.getY()] = "goal";
                } else {
                    myToggleButton.setState("empty");
                    myToggleButton.setStyle("-fx-background-color: #fff");
                    matriceRisultato[myToggleButton.getX()][myToggleButton.getY()] = null;
                }
            } else if (mouseEvent.getButton() == MouseButton.SECONDARY) {

                if (myToggleButton.getState().equals("empty")) {
                    ostacolo = true;
                    myToggleButton.setState("obstacle");
                    myToggleButton.setStyle("-fx-background-color: #c62b27");
                    matriceRisultato[myToggleButton.getX()][myToggleButton.getY()] = "obstacle";
                } else {
                    if(!ostacolo) {
                        myToggleButton.setState("empty");
                        myToggleButton.setStyle("-fx-background-color: #fff");
                        matriceRisultato[myToggleButton.getX()][myToggleButton.getY()] = null;
                    }
                    ostacolo = false;

                }
            }
        });

        myToggleButton.setOnMouseEntered(mouseEvent -> {

            if (myToggleButton.getX() == x && myToggleButton.getY() == y) {
                return;
            }
            if (ostacolo) {
                if (myToggleButton.getState().equals("empty")) {
                    myToggleButton.setState("obstacle");
                    myToggleButton.setStyle("-fx-background-color: #c62b27");
                    matriceRisultato[myToggleButton.getX()][myToggleButton.getY()] = "obstacle";
                }
            }
        });
    }
}
