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
            color: plum;
            font-size: 20px;
        }
    </style>
</head>
<body>
<h1 style="font-family: 'Marck Script', cursive; display: flex;align-items: center;justify-content: center;">
    Авторизация</h1>
<div style="
    display: flex;
    align-items: center;
    justify-content: center;
    border: 5px solid rgb(204, 153, 255);
    padding: 5px 5px 5px 50px;
    border-radius: 50px;
    background-color: rgb(250, 215, 245);">
    <form action="/login" method="post">
        Электронная почта: <input type="email" name="username"><br><br>
        Пароль: <input type="password" name="password"><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Вход">
    </form>
    <a href="/registration">Зарегистрироваться</a>
</body>
</html>