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

    public Point(int x, int y, int z) {
        this.x = x;
        this.y = y;
        this.z = z;
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
