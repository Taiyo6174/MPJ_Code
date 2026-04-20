<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Registration System</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', sans-serif; background: #f0f4f8; min-height: 100vh; }
        nav {
            background: #1a237e;
            padding: 0 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 60px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.3);
        }
        nav .brand { color: white; font-size: 18px; font-weight: 600; letter-spacing: 0.5px; }
        nav .nav-links a {
            color: #c5cae9; text-decoration: none; margin-left: 24px;
            font-size: 14px; transition: color 0.2s;
        }
        nav .nav-links a:hover { color: white; }
        .hero {
            background: linear-gradient(135deg, #1a237e 0%, #283593 50%, #3949ab 100%);
            color: white;
            text-align: center;
            padding: 80px 20px 60px;
        }
        .hero h1 { font-size: 36px; font-weight: 700; margin-bottom: 14px; }
        .hero p  { font-size: 16px; color: #c5cae9; margin-bottom: 36px; max-width: 500px; margin-left: auto; margin-right: auto; }
        .hero-btns { display: flex; gap: 16px; justify-content: center; flex-wrap: wrap; }
        .btn-primary {
            background: white; color: #1a237e;
            padding: 12px 30px; border-radius: 6px;
            text-decoration: none; font-weight: 600; font-size: 14px;
            transition: transform 0.15s, box-shadow 0.15s;
        }
        .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 6px 20px rgba(0,0,0,0.2); }
        .btn-outline {
            background: transparent; color: white;
            border: 2px solid rgba(255,255,255,0.6);
            padding: 12px 30px; border-radius: 6px;
            text-decoration: none; font-weight: 600; font-size: 14px;
            transition: background 0.2s;
        }
        .btn-outline:hover { background: rgba(255,255,255,0.1); }
        .cards-section { max-width: 960px; margin: 60px auto; padding: 0 24px; }
        .section-title { text-align: center; font-size: 22px; font-weight: 600; color: #1a237e; margin-bottom: 36px; }
        .cards { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 24px; }
        .card {
            background: white; border-radius: 12px;
            padding: 28px 24px; text-align: center;
            border: 1px solid #e8eaf6;
            box-shadow: 0 2px 12px rgba(0,0,0,0.06);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .card:hover { transform: translateY(-4px); box-shadow: 0 8px 24px rgba(0,0,0,0.1); }
        .card-icon {
            width: 56px; height: 56px; border-radius: 50%;
            margin: 0 auto 16px;
            display: flex; align-items: center; justify-content: center;
            font-size: 24px;
        }
        .icon-blue   { background: #e8eaf6; }
        .icon-green  { background: #e8f5e9; }
        .icon-orange { background: #fff3e0; }
        .card h3 { font-size: 15px; font-weight: 600; color: #1a237e; margin-bottom: 8px; }
        .card p  { font-size: 13px; color: #666; line-height: 1.6; }
        .card a  {
            display: inline-block; margin-top: 16px;
            padding: 8px 20px; background: #1a237e; color: white;
            border-radius: 5px; text-decoration: none; font-size: 13px; font-weight: 500;
            transition: background 0.2s;
        }
        .card a:hover { background: #283593; }
        footer {
            text-align: center; padding: 24px;
            color: #888; font-size: 13px;
            border-top: 1px solid #e0e0e0; margin-top: 40px;
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

<div class="hero">
    <h1>Employee Registration System</h1>
    <p>Manage your workforce efficiently with JSP, Servlet and MySQL database connectivity.</p>
    <div class="hero-btns">
        <a href="register.jsp" class="btn-primary">+ Register Employee</a>
        <a href="EmployeeServlet?action=list" class="btn-outline">View All Employees</a>
    </div>
</div>

<div class="cards-section">
    <div class="section-title">What You Can Do</div>
    <div class="cards">

        <div class="card">
            <div class="card-icon icon-blue">&#128221;</div>
            <h3>Register Employee</h3>
            <p>Add new employees with their personal and professional details to the database.</p>
            <a href="register.jsp">Register Now</a>
        </div>

        <div class="card">
            <div class="card-icon icon-green">&#128203;</div>
            <h3>View All Employees</h3>
            <p>Browse the complete list of registered employees with all their information.</p>
            <a href="EmployeeServlet?action=list">View List</a>
        </div>

        <div class="card">
            <div class="card-icon icon-orange">&#128197;</div>
            <h3>Manage Records</h3>
            <p>Update or delete existing employee records to keep your data accurate.</p>
            <a href="EmployeeServlet?action=list">Manage</a>
        </div>

    </div>
</div>

<footer>
    &copy; 2024 Employee Registration System &mdash; JSP + Servlet + JDBC | MPJ Assignment 5
</footer>

</body>
</html>
