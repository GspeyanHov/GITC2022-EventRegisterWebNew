package servlet;

import manager.EventManager;
import model.Event;
import model.EventType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;


@WebServlet(urlPatterns = "/events/edit")
public class EditEventServlet extends HttpServlet {


    private final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    private final EventManager eventManager = new EventManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int eventId = Integer.parseInt(request.getParameter("eventId"));
        Event event = eventManager.getById(eventId);
        request.setAttribute("events",event);
        request.getRequestDispatcher("/WEB-INF/eventEdit.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int eventId = Integer.parseInt(request.getParameter("eventId"));
        String name = request.getParameter("name");
        String place = request.getParameter("place");
        boolean isOnline = Boolean.parseBoolean(request.getParameter("isOnline"));
        EventType eventType = EventType.valueOf(request.getParameter("eventType"));
        double price = Double.parseDouble(request.getParameter("price"));
        String eventDateStr = request.getParameter("eventDate");
        try {
              Event  event = Event.builder()
                    .id(eventId)
                    .name(name)
                    .place(place)
                    .isOnline(isOnline)
                    .eventType(eventType)
                    .price(price)
                    .eventDate(sdf.parse(eventDateStr))
                    .build();

            eventManager.edit(event);
            response.sendRedirect("/events");

        } catch (ParseException e) {
            e.printStackTrace();
        }
    }
}
