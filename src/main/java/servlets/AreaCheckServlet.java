package servlets;

import com.google.gson.Gson;
import shots.Model;
import shots.Shot;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalTime;
import java.util.Map;

@WebServlet("/check")
public class AreaCheckServlet extends HttpServlet {
    public Model model;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        long startTime = System.nanoTime();
        LocalTime requestTime = LocalTime.now();

        response.setContentType("application/json");
        HttpSession session = request.getSession();
        if (session.getAttribute("model") == null) {
            model = new Model();
        } else {
            model = (Model)session.getAttribute("model");
        }

        String xString = request.getParameter("x");
        String yString = request.getParameter("y");
        String rString = request.getParameter("r");

        if (!checkDataValid(xString, yString, rString)) {
            response.setStatus(400);
            response.getWriter().write(new Gson().toJson(Map.of("error", "Invalid data format.")));
            return;
        }

        Shot shot = new Shot(new BigDecimal(xString), new BigDecimal(yString), new BigDecimal(rString));
        shot.setRequestTime(requestTime);
        shot.setExecutionDuration(System.nanoTime() - startTime);
        model.setShot(shot);
        session.setAttribute("model", model);
        response.getWriter().write(new Gson().toJson(shot));
    }

    private boolean checkDataValid(String xString, String yString, String rString) {
        try {
            Double.parseDouble(xString);
            Double.parseDouble(yString);
            Double.parseDouble(rString);
            return true;
        } catch (NumberFormatException error) {
            return false;
        }
    }
}
