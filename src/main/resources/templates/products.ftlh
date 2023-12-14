<!DOCTYPE html>
<html>
<head>
    <title>Книжный магазин</title>
    <style>

    </style>
</head>
<body>
<h1 style="font-family: 'Marck Script', cursive; display: flex;align-items: center;justify-content: center;">
    Книжный магазин</h1>
<div style="display:flex;font-family: 'Marck Script', cursive;align-items: center;justify-content: center;">
    <#if user.email??>
        <h2>Имя пользователя: ${user.name}</h2>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" style="font-family: 'Marck Script', cursive; margin-left: 10px;">Выйти</button>
        </form>
    <#else>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit"><a style="font-family: 'Marck Script', cursive;" href="/login">Войти</a></button>
    </#if>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit"><a style="font-family: 'Marck Script', cursive;" href="/basket">Корзина</a></button>
    <#if user.isAdmin()>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit"><a style="font-family: 'Marck Script', cursive;" href="/admin">Панель админа</a></button>
    </#if>
</div>
<br>
<div style="
    display: flex;
    align-items: center;
    justify-content: center;
    border: 5px solid rgb(204, 153, 255);
    padding: 5px 5px 5px 50px;
    border-radius: 50px;
    background-color: rgb(250, 215, 245);">
    <div style="flex: 1 1 auto; margin: 0 10%;">
        <form action="/" method="get">
            Поиск товара по названию: <input type="text" name="title"><br>
            <input type="submit" value="Поиск"/>
        </form>
        <#list products as product>
            <div style="display: flex; flex-direction: row">
                id: ${product.id} название: ${product.title} описание: ${product.description} цена: ${product.price}руб.
                вес: ${product.weight}кг наличие: ${product.being}шт | <a href="/product/${product.id}">Подробнее</a> |
                <form class="formButton"
                      action="/basket/add?productName=${product.title}&productDescription=${product.description}&productPrice=${product.price}&productWeight=${product.weight}&productBeing=${product.being}"
                      method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button class="btnAdd" type="submit">Добавить в корзину</button>
                </form>
            </div>
        </#list>
    </div>
</div>
</body>
</html>