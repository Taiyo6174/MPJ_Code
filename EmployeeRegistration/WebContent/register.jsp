<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Employee</title>
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
        .container { max-width: 780px; margin: 40px auto; padding: 0 20px; }
        .page-header {
            display: flex; align-items: center; gap: 12px;
            margin-bottom: 24px;
        }
        .page-header h2 { font-size: 20px; font-weight: 600; color: #1a237e; }
        .breadcrumb { font-size: 13px; color: #888; margin-bottom: 6px; }
        .breadcrumb a { color: #3949ab; text-decoration: none; }
        .card {
            background: white; border-radius: 12px;
            padding: 32px 36px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.08);
            border: 1px solid #e8eaf6;
        }
        .error-msg {
            background: #ffebee; color: #c62828;
            border-left: 4px solid #ef5350;
            padding: 12px 16px; border-radius: 6px;
            margin-bottom: 24px; font-size: 13px;
        }
        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        .form-group { display: flex; flex-direction: column; }
        label {
            font-size: 12px; font-weight: 600; color: #555;
            text-transform: uppercase; letter-spacing: 0.5px;
            margin-bottom: 6px;
        }
        input[type="text"], input[type="email"], input[type="tel"],
        input[type="number"], input[type="date"], select {
            padding: 10px 13px;
            border: 1.5px solid #c5cae9;
            border-radius: 7px;
            font-size: 14px; color: #333;
            background: #fafbff;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s;
            font-family: 'Segoe UI', sans-serif;
        }
        input:focus, select:focus {
            border-color: #3949ab;
            box-shadow: 0 0 0 3px rgba(57,73,171,0.1);
            background: white;
        }
        .form-actions { margin-top: 28px; display: flex; gap: 12px; }
        .btn-submit {
            padding: 11px 28px; background: #2e7d32; color: white;
            border: none; border-radius: 7px; font-size: 14px;
            font-weight: 600; cursor: pointer;
            font-family: 'Segoe UI', sans-serif;
            transition: background 0.2s;
        }
        .btn-submit:hover { background: #1b5e20; }
        .btn-cancel {
            padding: 11px 24px; background: #eceff1; color: #546e7a;
            border: none; border-radius: 7px; font-size: 14px;
            font-weight: 500; cursor: pointer;
            text-decoration: none; display: inline-flex; align-items: center;
            font-family: 'Segoe UI', sans-serif;
        }
        .btn-cancel:hover { background: #cfd8dc; }
        @media (max-width: 600px) { .form-grid { grid-template-columns: 1fr; } }
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
    <div class="breadcrumb"><a href="index.jsp">Home</a> &rsaquo; Register Employee</div>
    <div class="page-header">
        <h2>&#128221; Register New Employee</h2>
    </div>

    <div class="card">

        <% String error = (String) request.getAttribute("error");
           if (error != null) { %>
        <div class="error-msg">&#9888; <%= error %></div>
        <% } %>

        <form action="EmployeeServlet" method="post">
            <input type="hidden" name="action" value="register">

            <div class="form-grid">

                <div class="form-group">
                    <label for="firstName">First Name *</label>
                    <input type="text" id="firstName" name="firstName"
                           placeholder="e.g. Ravi" required maxlength="50">
                </div>

                <div class="form-group">
                    <label for="lastName">Last Name *</label>
                    <input type="text" id="lastName" name="lastName"
                           placeholder="e.g. Kumar" required maxlength="50">
                </div>

                <div class="form-group">
                    <label for="email">Email Address *</label>
                    <input type="email" id="email" name="email"
                           placeholder="e.g. ravi@company.com" required>
                </div>

                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone"
                           placeholder="e.g. 9876543210" maxlength="15">
                </div>

                <div class="form-group">
                    <label for="department">Department *</label>
                    <select id="department" name="department" required>
                        <option value="">-- Select Department --</option>
                        <option value="Engineering">Engineering</option>
                        <option value="Human Resources">Human Resources</option>
                        <option value="Marketing">Marketing</option>
                        <option value="Finance">Finance</option>
                        <option value="Sales">Sales</option>
                        <option value="Operations">Operations</option>
                        <option value="IT">IT</option>
                        <option value="Administration">Administration</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="designation">Designation *</label>
                    <input type="text" id="designation" name="designation"
                           placeholder="e.g. Software Engineer" required maxlength="100">
                </div>

                <div class="form-group">
                    <label for="salary">Salary (&#8377;) *</label>
                    <input type="number" id="salary" name="salary"
                           placeholder="e.g. 50000" min="0" step="0.01" required>
                </div>

                <div class="form-group">
                    <label for="joiningDate">Joining Date *</label>
                    <input type="date" id="joiningDate" name="joiningDate" required>
                </div>

            </div>

            <div class="form-actions">
                <button type="submit" class="btn-submit">&#10003; Register Employee</button>
                <a href="index.jsp" class="btn-cancel">Cancel</a>
            </div>

        </form>
    </div>
</div>

</body>
</html>
