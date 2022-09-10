package servlet;

import manager.EventManager;
import manager.UserManager;
import model.Event;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/users/add")
public class AddUserServlet extends HttpServlet {

    private final EventManager eventManager = new EventManager();
    private final UserManager userManager = new UserManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Event> all = eventManager.getAll();
        request.setAttribute("events", all);
        request.getRequestDispatcher("/WEB-INF/addUsers.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        int eventId = Integer.parseInt(request.getParameter("eventId"));

        User user = User.builder()
                .name(name)
                .surname(surname)
                .email(email)
                .event(eventManager.getById(eventId))
                .build();

        userManager.add(user);
        response.sendRedirect("/users");
    }
}
