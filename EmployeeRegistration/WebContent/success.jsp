<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
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
        .container {
            max-width: 520px; margin: 80px auto;
            padding: 0 20px; text-align: center;
        }
        .success-card {
            background: white; border-radius: 16px;
            padding: 48px 40px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.1);
            border: 1px solid #e8eaf6;
        }
        .checkmark {
            width: 80px; height: 80px; border-radius: 50%;
            background: #e8f5e9;
            display: flex; align-items: center; justify-content: center;
            margin: 0 auto 24px;
            font-size: 38px;
        }
        h2 { font-size: 24px; font-weight: 700; color: #2e7d32; margin-bottom: 12px; }
        .emp-name {
            font-size: 18px; font-weight: 600; color: #1a237e;
            background: #e8eaf6; padding: 8px 20px;
            border-radius: 6px; display: inline-block;
            margin-bottom: 16px;
        }
        p { font-size: 14px; color: #666; line-height: 1.6; margin-bottom: 32px; }
        .btn-group { display: flex; gap: 14px; justify-content: center; flex-wrap: wrap; }
        .btn-primary {
            padding: 11px 24px; background: #1a237e; color: white;
            border-radius: 7px; text-decoration: none;
            font-size: 14px; font-weight: 600;
            transition: background 0.2s;
        }
        .btn-primary:hover { background: #283593; }
        .btn-secondary {
            padding: 11px 24px; background: #eceff1; color: #546e7a;
            border-radius: 7px; text-decoration: none;
            font-size: 14px; font-weight: 500;
            transition: background 0.2s;
        }
        .btn-secondary:hover { background: #cfd8dc; }
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
    <div class="success-card">
        <div class="checkmark">&#9989;</div>
        <h2>Registration Successful!</h2>
        <% String name = (String) request.getAttribute("employeeName");
           if (name != null && !name.isEmpty()) { %>
        <div class="emp-name"><%= name %></div>
        <% } %>
        <p>The employee has been successfully registered and saved to the database.</p>
        <div class="btn-group">
            <a href="register.jsp" class="btn-primary">+ Register Another</a>
            <a href="EmployeeServlet?action=list" class="btn-secondary">View All Employees</a>
        </div>
    </div>
</div>

</body>
</html>
