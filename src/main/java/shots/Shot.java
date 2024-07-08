package shots;

import java.math.BigDecimal;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class Shot {
    private final BigDecimal x;
    private final BigDecimal y;
    private final BigDecimal r;
    private final boolean inArea;
    private String requestTime;
    private String executionDuration;

    public Shot(BigDecimal x, BigDecimal y, BigDecimal r) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.inArea = checkHit();
    }

    public boolean checkHit() {
        boolean area1_hit = x.compareTo(BigDecimal.ZERO) <= 0 && y.compareTo(BigDecimal.ZERO) <= 0 &&
                x.compareTo(r.divide(BigDecimal.valueOf(2)).negate()) >= 0 && y.compareTo(r.negate()) >= 0;
        boolean area2_hit = x.compareTo(BigDecimal.ZERO) <= 0 && y.compareTo(BigDecimal.ZERO) >= 0 &&
                x.multiply(x).add(y.multiply(y)).compareTo(r.multiply(r).divide(BigDecimal.valueOf(4))) <= 0;
        boolean area3_hit = x.compareTo(BigDecimal.ZERO) >= 0 && y.compareTo(BigDecimal.ZERO) <= 0 &&
                y.compareTo((x.add(r.negate())).divide(BigDecimal.valueOf(2))) > 0;
        return area1_hit || area2_hit || area3_hit;
    }

    public BigDecimal getX() {
        return x;
    }

    public BigDecimal getY() {
        return y;
    }

    public BigDecimal getR() {
        return r;
    }

    public boolean isInArea() {
        return inArea;
    }

    public String getRequestTime() {
        return requestTime;
    }

    public String getExecutionDuration() {
        return executionDuration;
    }

    public void setRequestTime(LocalTime time) {
        this.requestTime = time.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
    }

    public void setExecutionDuration(long nanoseconds) {
        this.executionDuration = String.format("%.2f", nanoseconds / 1000000.0) + "ms";
    }
}
