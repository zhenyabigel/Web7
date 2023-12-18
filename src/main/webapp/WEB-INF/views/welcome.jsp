<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #f8f8f8;
            border-bottom: 1px solid #ddd;
            padding: 10px;
        }

        .menu ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        .menu ul li {
            display: inline;
            margin-right: 10px;
        }

        .menu ul li a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        h4 {
            margin-top: 0;
        }

        .layer1 table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .layer1 table th, .layer1 table td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .layer2 {
            margin-top: 40px;
        }

        .layer2 form {
            margin-top: 20px;
        }

        .layer2 input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
        }

        .layer2 input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
        }

        .error-message {
            color: red;
        }
    </style>
</head>
<body>
<nav role="navigation" class="navbar navbar-default">
    <div>
        <nav class="menu">
            <ul>
                <li><a href="${pageContext.request.contextPath}/controller?command=login_page">Login</a></li>
                <li><a href="${pageContext.servletContext.contextPath}/controller?command=sign_out">Logout</a></li>
                <li style="float:right;">
            </ul>
        </nav>
    </div>
</nav>
<div class="container">
    <h4>Добрый день, ${username}</h4>
    <div class="layer1">
        <h2>Список вашей группы</h2>
        <p></p>
        <table>
            <tr>
                <th>Имя</th>
                <th>Телефон</th>
                <th>Email</th>
            </tr>
            <c:forEach items="${group}" var="person">
                <tr>
                    <td>${person.name}</td>
                    <td>${person.phone}</td>
                    <td>${person.email}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="layer2">
        <div class="container">
            <section id="content">
                <p class="error-message"><font color="red">${errorMessage}</font></p>
                <form class="login-form" method="POST"
                      action="${pageContext.servletContext.contextPath}/controller?command=add_new_person">
                    <h3>Добавить новый контакт</h3>
                    <div><input name="nname" type="text" placeholder="Введите имя" required=""/></div>
                    <div><input name="nphone" type="text" placeholder="Введите телефон" required=""/></div>
                    <div><input name="nemail" type="text" placeholder="Введите email" required=""/></div>
                    <div><input class="button-main-page" value="Добавить" type="submit"/></div>
                </form>
            </section>
        </div>
    </div>
</div>
</body>
</html>