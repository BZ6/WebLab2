package shots;

import java.util.LinkedList;

public class Model {
    private int size = 0;
    private final static LinkedList<Shot> shots = new LinkedList<>();

    public void setShot(Shot shot){
        shots.addFirst(shot);
        size++;
    }

    public int size() {
        return size;
    }

    public LinkedList<Shot> array() {
        return shots;
    }
}
