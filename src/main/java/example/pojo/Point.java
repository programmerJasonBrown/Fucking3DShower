package example.pojo;

/**
 * @program: my3DShower
 * @description:
 * @author: Chao Qian
 * @create: 2018-10-22 15:02
 **/
public class Point {

    // 单位 cm
    int x;
    int y;
    int z;
    String state;


    public Point(int x, int y, int z, String state) {
        this.x = x;
        this.y = y;
        this.z = z;
        this.state = state;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public int getZ() {
        return z;
    }

    public void setX(int x) {
        this.x = x;
    }

    public void setY(int y) {
        this.y = y;
    }

    public void setZ(int z) {
        this.z = z;
    }
}
