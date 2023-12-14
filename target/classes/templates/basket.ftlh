<!DOCTYPE html>
<html>
<head>
    <title>Корзина</title>
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
    Корзина</h1>
<div style="
    display: flex;
    align-items: center;
    justify-content: center;
    border: 5px solid rgb(210, 144, 96);
    padding: 5px 5px 5px 50px;
    border-radius: 50px;
    background-color: rgb(250, 235, 215);">
    <div style="display: flex; flex-direction: column">
    <#list basket as product>
        <div class="product">
            <p>id: ${product.id}    название: ${product.title}   описание: ${product.description}   цена: ${product.price}руб.  вес: ${product.weight}кг наличие: ${product.being}шт</p> |
            <form class="formButton" action="/basket/delete/${product.id}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit">Удалить из корзины</button>
            </form>
        </div>
    <#else>
        <p>Корзина пуста</p>
    </#list>
    </div>
</div>
<div style="display: flex; flex-direction:column; align-items: center; justify-content: center">
    <form class="formButton" action="/basket/deleteAll" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit">Оформить заказ</button>
    </form>
    <a class="main" href="/">Главная</a>
</div>
</body>
</html>