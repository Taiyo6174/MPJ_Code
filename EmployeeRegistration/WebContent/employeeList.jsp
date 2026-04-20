<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emp.Employee, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Employees</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', sans-serif; background: #f0f4f8; min-height: 100vh; }
        nav {
            background: #1a237e; padding: 0 40px;
            display: flex; align-items: center; justify-content: space-between;
            height: 60px; box-shadow: 0 2px 8px rgba(0,0,0,0.3);
        }
        nav .brand { color: white; font-size: 18px; font-weight: 600; }
        nav .nav-links a { color: #c5cae9; text-decoration: none; margin-left: 24px; font-size: 14px; }
        nav .nav-links a:hover { color: white; }
        .container { max-width: 1100px; margin: 40px auto; padding: 0 20px; }
        .breadcrumb { font-size: 13px; color: #888; margin-bottom: 6px; }
        .breadcrumb a { color: #3949ab; text-decoration: none; }
        .page-header {
            display: flex; align-items: center;
            justify-content: space-between; margin-bottom: 20px;
        }
        .page-header h2 { font-size: 20px; font-weight: 600; color: #1a237e; }
        .btn-register {
            padding: 10px 22px; background: #2e7d32; color: white;
            border-radius: 7px; text-decoration: none;
            font-size: 13px; font-weight: 600;
            transition: background 0.2s;
        }
        .btn-register:hover { background: #1b5e20; }
        .card {
            background: white; border-radius: 12px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.08);
            border: 1px solid #e8eaf6;
            overflow: hidden;
        }
        table { width: 100%; border-collapse: collapse; font-size: 13.5px; }
        thead tr { background: #1a237e; }
        thead th {
            padding: 13px 16px; text-align: left;
            color: white; font-weight: 500; font-size: 12.5px;
            letter-spacing: 0.3px;
        }
        tbody tr { border-bottom: 1px solid #f0f0f0; transition: background 0.15s; }
        tbody tr:last-child { border-bottom: none; }
        tbody tr:hover { background: #f5f7ff; }
        tbody td { padding: 12px 16px; color: #333; }
        .emp-name { font-weight: 600; color: #1a237e; }
        .dept-badge {
            display: inline-block; padding: 3px 10px;
            border-radius: 12px; font-size: 11.5px; font-weight: 500;
        }
        .dept-Engineering  { background: #e8eaf6; color: #3949ab; }
        .dept-HR           { background: #fce4ec; color: #c2185b; }
        .dept-Finance      { background: #e8f5e9; color: #2e7d32; }
        .dept-Marketing    { background: #fff3e0; color: #e65100; }
        .dept-IT           { background: #e3f2fd; color: #1565c0; }
        .dept-Sales        { background: #f3e5f5; color: #6a1b9a; }
        .dept-Operations   { background: #fbe9e7; color: #bf360c; }
        .dept-default      { background: #eceff1; color: #546e7a; }
        .btn-delete {
            padding: 5px 13px; background: #c62828; color: white;
            border: none; border-radius: 5px; font-size: 12px;
            cursor: pointer; font-family: 'Segoe UI', sans-serif;
            transition: background 0.2s;
        }
        .btn-delete:hover { background: #b71c1c; }
        .empty-state { text-align: center; padding: 60px 20px; color: #888; }
        .empty-state .icon { font-size: 48px; margin-bottom: 14px; }
        .empty-state p { margin-bottom: 20px; font-size: 15px; }
        .empty-state a {
            padding: 10px 24px; background: #1a237e; color: white;
            border-radius: 7px; text-decoration: none; font-size: 14px;
        }
        .count-bar {
            padding: 10px 16px; background: #f5f7ff;
            border-top: 1px solid #e8eaf6;
            font-size: 12.5px; color: #666;
        }
    </style>
</head>
<body>

<nav>
    <div class="brand">&#128203; Employee Registration System</div>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="register.jsp">Register</a>
        <a href="EmployeeServlet?action=list">View All</a>
    </div>
</nav>

<div class="container">
    <div class="breadcrumb"><a href="index.jsp">Home</a> &rsaquo; All Employees</div>
    <div class="page-header">
        <h2>&#128203; All Registered Employees</h2>
        <a href="register.jsp" class="btn-register">+ Register New Employee</a>
    </div>

    <div class="card">
        <%
            List<Employee> employees = (List<Employee>) request.getAttribute("employees");
            if (employees == null || employees.isEmpty()) {
        %>
        <div class="empty-state">
            <div class="icon">&#128100;</div>
            <p>No employees registered yet.</p>
            <a href="register.jsp">Register First Employee</a>
        </div>
        <% } else { %>
        <div style="overflow-x: auto;">
        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Department</th>
                    <th>Designation</th>
                    <th>Salary (&#8377;)</th>
                    <th>Joining Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <%
                int sno = 1;
                for (Employee emp : employees) {
                    String dept = emp.getDepartment();
                    String badgeClass = "dept-default";
                    if ("Engineering".equals(dept))   badgeClass = "dept-Engineering";
                    else if (dept.contains("Human"))  badgeClass = "dept-HR";
                    else if ("Finance".equals(dept))  badgeClass = "dept-Finance";
                    else if ("Marketing".equals(dept))badgeClass = "dept-Marketing";
                    else if ("IT".equals(dept))       badgeClass = "dept-IT";
                    else if ("Sales".equals(dept))    badgeClass = "dept-Sales";
                    else if ("Operations".equals(dept))badgeClass = "dept-Operations";
            %>
            <tr>
                <td><%= sno++ %></td>
                <td class="emp-name"><%= emp.getFirstName() %> <%= emp.getLastName() %></td>
                <td><%= emp.getEmail() %></td>
                <td><%= emp.getPhone() != null ? emp.getPhone() : "-" %></td>
                <td><span class="dept-badge <%= badgeClass %>"><%= dept %></span></td>
                <td><%= emp.getDesignation() %></td>
                <td>&#8377;<%= String.format("%,.0f", emp.getSalary()) %></td>
                <td><%= emp.getJoiningDate() %></td>
                <td>
                    <a href="EmployeeServlet?action=delete&id=<%= emp.getId() %>"
                       onclick="return confirm('Delete <%= emp.getFirstName() %> <%= emp.getLastName() %>?');">
                        <button class="btn-delete">&#128465; Delete</button>
                    </a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
        </div>
        <div class="count-bar">Total: <strong><%= employees.size() %></strong> employee(s) registered</div>
        <% } %>
    </div>
</div>

</body>
</html>
