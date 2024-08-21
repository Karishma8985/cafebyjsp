import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/AddItemServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10, // 10MB
                 maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AddItemServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    public static final String UPLOAD_DIR = "itemimage";
    public String dbFileName = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    	String itemName = request.getParameter("item_name");
        String description = request.getParameter("description");
        int itemPrice = Integer.parseInt(request.getParameter("item_price"));

        // Handle file upload
        Part part = request.getPart("item_image"); // upload image
        String fileName = extractFileName(part);

        // Save the image to the server directory
        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdir();
        }
        String savePath = uploadPath + File.separator + fileName;
        part.write(savePath);

        dbFileName = UPLOAD_DIR + File.separator + fileName;

        // Insert item details into the database
        String query = "INSERT INTO menu (item_name, description, price, image, image_path) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "");
             PreparedStatement ps = con.prepareStatement(query)) {
            
            // Set parameters
            ps.setString(1, itemName);
            ps.setString(2, description);
            ps.setInt(3, itemPrice);
            ps.setString(4, dbFileName);
            ps.setString(5, savePath);

            // Execute update
            int result = ps.executeUpdate();
            if (result > 0) {
                response.sendRedirect("admin/menu_data.jsp");
            } else {
                response.sendRedirect("error.jsp"); // Redirect to an error page or show an error message
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database operation failed");
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
