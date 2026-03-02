import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

@WebServlet("/User_profile")
public class User_profile extends HttpServlet {

    Connection cn = null;
    Statement st = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        Database db = new Database();
        String result = db.Connectdb();
        out.println(result);

        String event = req.getParameter("submit");

        String user_id = req.getParameter("user_id");
        String full_name = req.getParameter("full_name");
        String phone = req.getParameter("phone");
        String gender = req.getParameter("gender");
        String dob = req.getParameter("dob");
        String address = req.getParameter("address");
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        String pincode = req.getParameter("pincode");

        out.println(event);

        // ---------------- CREATE PROFILE ----------------
        if (event.equals("Create")) {
            if (full_name.equals("") || phone.equals("") || gender.equals("")) {
                out.println("<script>alert('Something is Empty'); location='User_profile.jsp';</script>");
            } else {
                try {
                    String sql =
                        "INSERT INTO user_profile (user_id, full_name, phone, gender, dob, address, city, state, pincode) " +
                        "VALUES ('" + user_id + "','" + full_name + "','" + phone + "','" + gender + "'," +
                        (dob.equals("") ? "NULL" : "'" + dob + "'") + "," +
                        "'" + address + "','" + city + "','" + state + "','" + pincode + "')";

                    String insert = db.Insert(sql);
                    out.println(insert);

                    //out.println("<script>alert('Profile Created'); location='User_profile.jsp';</script>");

                } catch (Exception ex) {
                    out.println(ex.toString());
                }
            }
        }

        // ---------------- UPDATE PROFILE ----------------
        if (event.equals("Update")) {
            if (full_name.equals("") || phone.equals("") || gender.equals("")) {
                out.println("<script>alert('Something is Empty'); location='User_profile.jsp';</script>");
            } else {
                try {
                    String sql =
                        "UPDATE user_profile SET " +
                        "full_name='" + full_name + "', " +
                        "phone='" + phone + "', " +
                        "gender='" + gender + "', " +
                        "dob=" + (dob.equals("") ? "NULL" : "'" + dob + "'") + ", " +
                        "address='" + address + "', " +
                        "city='" + city + "', " +
                        "state='" + state + "', " +
                        "pincode='" + pincode + "' " +
                        "WHERE user_id='" + user_id + "'";

                    String update = db.update(sql);
                    out.println(update);

                    out.println("<script>alert('Profile Updated'); location='User_profile.jsp';</script>");

                } catch (Exception ex) {
                    out.println(ex.toString());
                }
            }
        }

        // ---------------- DELETE PROFILE ----------------
        if (event.equals("Delete")) {
            if (user_id.equals("")) {
                out.println("<script>alert('Something is Empty'); location='User_profile.jsp';</script>");
            } else {
                try {
                    String sql = "DELETE FROM user_profile WHERE user_id='" + user_id + "'";
                    String delete = db.delete(sql);
                    out.println(delete);

                    out.println("<script>alert('Profile Deleted'); location='User_profile.jsp';</script>");

                } catch (Exception ex) {
                    out.println(ex.toString());
                }
            }
        }
    }
}
