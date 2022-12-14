package servlet;

import manager.EventManager;

import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(urlPatterns = "/events/remove")
public class RemoveEventServlet extends HttpServlet {

    private final EventManager eventManager = new EventManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int eventId = Integer.parseInt(request.getParameter("eventId"));
        eventManager.removeEventById(eventId);
        response.sendRedirect("/events");
    }

}
