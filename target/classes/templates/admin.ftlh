<!DOCTYPE html>
<html>
<head>
    <title>Админ</title>
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
<h1 style="font-family: 'Marck Script', cursive; display: flex;align-items: center;justify-content: center;">
    Администрирование</h1>
<div style="
    display: flex;
    align-items: center;
    justify-content: center;
    border: 5px solid rgb(210, 144, 96);
    padding: 5px 5px 5px 50px;
    border-radius: 50px;
    background-color: rgb(250, 235, 215);">
    <div style="display: flex; flex-direction: column;">
        <table>
            <tr>
                <th scope="col">Email</th>
                <th scope="col">Номер телефона</th>
                <th scope="col">Активность</th>
                <th scope="col">Роли</th>
                <th scope="col">Бан</th>
            </tr>
            <#list users as user>
                <tr>
                    <th>${user.email}</th>
                    <th>${user.phoneNumber}</th>
                    <th><#if user.active>true<#else>false</#if></th>
                    <th><#list user.roles as role>${role}</#list></th>
                    <th>
                        <form action="/admin/user/ban/${user.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input type="submit" class="btn btn-light" value="Бан">
                        </form>
                    </th>
                </tr>
            <#else>
                <h3>Пользователей нет</h3>
            </#list>
        </table>
        <div style="display:flex; flex-direction: row;">
            <div style="flex: 1 1 auto; margin: 0 10%;">
                <h3>Добавить товар в магазин</h3>
                <form action="/product/create" method="post">
                    Название товара: <input type="text" name="title"/><br><br>
                    Описание товара: <input type="text" name="description"/><br><br>
                    Цена товара: <input type="text" name="price"/><br><br>
                    Вес товара: <input type="text" name="weight"/><br><br>
                    Наличие: <input type="text" name="being"/><br><br>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Добавить товар в магазин"/>
                    <button class="btnAdd" type="submit"><a class="basket" href="/basket">Корзина</a></button>
                </form>
                <h3>Обновить данные о товаре</h3>
                <form action="/product/update" method="post">
                    ID: <input type="text" name="id"/><br><br>
                    Название товара: <input type="text" name="title"/><br><br>
                    Описание товара: <input type="text" name="description"/><br><br>
                    Цена товара: <input type="text" name="price"/><br><br>
                    Вес товара: <input type="text" name="weight"/><br><br>
                    Наличие: <input type="text" name="being"/><br><br>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input class="btn" type="submit" value="Обновить"/>
                </form>
            </div>
        </div>
    </div>
</body>
</html>