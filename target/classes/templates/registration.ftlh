<!DOCTYPE html>
<html>
<head>
    <title>Вход</title>
    <style>
        .product {
            display: flex;
            flex-direction: row;

        }

        .main {
            color: darksalmon;
            font-size: 20px;
        }
    </style>
</head>
<body>
<h1 style="font-family: 'Marck Script', cursive; display: flex;align-items: center;justify-content: center;">Регистрация</h1>
<div style="
    display: flex;
    align-items: center;
    justify-content: center;
    border: 5px solid rgb(210, 144, 96);
    padding: 5px 5px 5px 50px;
    border-radius: 50px;
    background-color: rgb(250, 235, 215);">
    <form action="/registration" method="post">
        Имя пользователя: <input type="text" name="name"><br><br>
        Электронная почта: <input type="email" name="email"><br><br>
        Телефон: <input type="text" name="phoneNumber"><br><br>
        Пароль: <input type="password" name="password"><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Зарегистрироваться">
    </form>
    <#if errorMessage??>
        <h2>${errorMessage}</h2>
    </#if>
</div>
</body>
</html>