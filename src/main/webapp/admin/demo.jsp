<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shree Krishna Cafe</title>
</head>
<body>
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe1", "root", "");
		Statement s = con.createStatement();
		String item_name = request.getParameter("item_name");
		int item_price = Integer.parseInt(request.getParameter("item_price"));
		int i = s.executeUpdate("insert into menu(item_name,price) values ('" + item_name + "'," + item_price + ")");
		if (i > 0) {
	%>
	<script>
		alert('Item inserted Successfully...........');
		window.location = 'menu_data.jsp';
	</script>
	<%
	} else {
	%>
	<script>
		alert("Item can't inserted Successfully...........");
		window.location = 'menu_data.jsp';
	</script>
	<%
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	%>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Item</title>
</head>
<body>
    <%
    String item_name = request.getParameter("item_name");
    int item_price = Integer.parseInt(request.getParameter("item_price"));

    // Handle file upload
    Part filePart = request.getPart("item_image");
    String fileName = filePart.getSubmittedFileName();
    String filePath = "images/" + fileName; // Directory to store the image

    // Save the image to the server directory
    File file = new File(application.getRealPath(filePath));
    try (InputStream inputStream = filePart.getInputStream();
         FileOutputStream outputStream = new FileOutputStream(file)) {
        byte[] buffer = new byte[1024];
        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
    } catch (IOException e) {
        e.printStackTrace();
    }

    // Insert item details into the database
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe1", "root", "");
        String query = "INSERT INTO menu (item_name, price, image_path) VALUES (?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, item_name);
        ps.setInt(2, item_price);
        ps.setString(3, filePath);
        int i = ps.executeUpdate();

        if (i > 0) {
    %>
            <script>
                alert('Item inserted Successfully...........');
                window.location = 'menu_data.jsp';
            </script>
    <%
        } else {
    %>
            <script>
                alert("Item can't be inserted Successfully...........");
                window.location = 'menu_data.jsp';
            </script>
    <%
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    %>
</body>
</html>
