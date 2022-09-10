package servlet;

import manager.UserManager;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/users")
public class UserServlet extends HttpServlet {

    private final UserManager userManager = new UserManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> all = userManager.getAll();
        request.setAttribute("users",all);
        request.getRequestDispatcher("/WEB-INF/users.jsp").forward(request,response);
    }
}
