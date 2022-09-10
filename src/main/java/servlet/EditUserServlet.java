package servlet;

import manager.EventManager;
import manager.UserManager;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(urlPatterns = "/users/edit")
public class EditUserServlet extends HttpServlet {

    private final UserManager userManager = new UserManager();
    private final EventManager eventManager = new EventManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        User user = userManager.getById(userId);
        request.setAttribute("events",eventManager.getAll());
        request.setAttribute("users",user);
        request.getRequestDispatcher("/WEB-INF/userEdit.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        int eventId = Integer.parseInt(request.getParameter("eventId"));

        User user = User.builder()
                .id(userId)
                .name(name)
                .surname(surname)
                .email(email)
                .event(eventManager.getById(eventId))
                .build();

        userManager.edit(user);
        response.sendRedirect("/users");
    }
}
