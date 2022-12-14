package servlet;

import manager.UserManager;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/users/remove")
public class RemoveUserServlet extends HttpServlet {

    private final UserManager userManager = new UserManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws  IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        userManager.removeUserById(userId);
        response.sendRedirect("/users");
    }

}
