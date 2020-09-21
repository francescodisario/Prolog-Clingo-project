package sample;

import javafx.beans.property.SimpleStringProperty;
import javafx.scene.Node;
import javafx.scene.control.ToggleButton;

public class MyToggleButton extends ToggleButton {

    private int x;
    private int y;
    private String state;
    private SimpleStringProperty prova;


    public MyToggleButton(int x, int y) {
        this.x = x;
        this.y = y;
        this.state = "empty";

    }

    public MyToggleButton(String s, int x, int y) {
        super(s);
        this.x = x;
        this.y = y;
    }

    public MyToggleButton(String s, Node node, int x, int y) {
        super(s, node);
        this.x = x;
        this.y = y;
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
