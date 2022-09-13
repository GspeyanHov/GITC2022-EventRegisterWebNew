package servlet;

import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet(urlPatterns = "/getImage")
public class GetImageServlet extends HttpServlet {

    private static final String IMG_PATH = "C:\\Users\\SmartS\\Java2022ultimate\\EventRegisterWeb\\profileImages\\";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String profilePic = request.getParameter("profilePic");
        String filePath = IMG_PATH + profilePic;
        File imageFile = new File(filePath);
        if (imageFile.exists()) {
            try (FileInputStream fileInputStream = new FileInputStream(imageFile)) {
                response.setContentType("image/jpeg");
                response.setContentLength((int) imageFile.length());

                OutputStream outputStream = response.getOutputStream();
                byte[] buffer = new byte[4096];
                int readBytes = -1;
                while ((readBytes = fileInputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, readBytes);
                }
            } catch (IOException e){
                e.printStackTrace();
            }
        }
    }


}
