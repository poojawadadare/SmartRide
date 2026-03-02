import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Admin_user_management")
public class Admin_user_management extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        Database db = new Database();
        db.Connectdb();

        String event = req.getParameter("submit");
        String user_id = req.getParameter("user_id");

        try {

            if (event.equals("Cancel")) {

                if (user_id == null || user_id.trim().equals("")) {
                    out.println("<script>alert('User ID is Empty'); location='Admin_user_list.jsp';</script>");
                    return;
                }

                String sql = "DELETE FROM user_signup WHERE user_id='" + user_id + "'";
                db.delete(sql);

                out.println("<script>alert('User Deleted Successfully'); location='Admin_user_list.jsp';</script>");
            }

        } catch (Exception ex) {
            out.println("<script>alert('Error: " + ex + "'); location='Admin_user_list.jsp';</script>");
        }
    }
}
