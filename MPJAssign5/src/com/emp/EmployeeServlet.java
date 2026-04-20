package com.emp;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final EmployeeDAO dao = new EmployeeDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {

            case "list":
                List<Employee> employees = dao.getAllEmployees();
                request.setAttribute("employees", employees);
                request.getRequestDispatcher("employeeList.jsp").forward(request, response);
                break;

            case "delete":
                int delId = Integer.parseInt(request.getParameter("id"));
                dao.deleteEmployee(delId);
                response.sendRedirect("EmployeeServlet?action=list");
                break;

            default:
                response.sendRedirect("index.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            Employee emp = new Employee();
            emp.setFirstName(request.getParameter("firstName").trim());
            emp.setLastName(request.getParameter("lastName").trim());
            emp.setEmail(request.getParameter("email").trim());
            emp.setPhone(request.getParameter("phone").trim());
            emp.setDepartment(request.getParameter("department").trim());
            emp.setDesignation(request.getParameter("designation").trim());
            emp.setSalary(Double.parseDouble(request.getParameter("salary")));
            emp.setJoiningDate(request.getParameter("joiningDate"));

            boolean success = dao.insertEmployee(emp);

            if (success) {
                request.setAttribute("employeeName", emp.getFirstName() + " " + emp.getLastName());
                request.getRequestDispatcher("success.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Registration failed. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        }
    }
}
