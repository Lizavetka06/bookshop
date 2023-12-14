<!DOCTYPE html>
<html>
<head>
    <title>Зоомагазин</title>
    <style>

    </style>
</head>
<body>
<h1 style="
    font-family: 'Marck Script', cursive;
    display: flex;
    align-items: center;
    justify-content: center;
    ">Подробная информация о товаре</h1>
<div style="
    display: flex;
    align-items: center;
    justify-content: center;
    border: 5px solid rgb(210, 144, 96);
    padding: 5px 5px 5px 50px;
    border-radius: 50px;
    background-color: rgb(250, 235, 215);">
    <div style="display:flex; flex-direction:row;">
        <div>
            <b>Название товара: </b> ${product.title}<br>
            <b>Описание товара: </b> ${product.description}<br>
            <b>Цена товара: </b> ${product.price}<br>
            <b>Вес товара: </b> ${product.weight}<br>
            <b>Наличие товара: </b> ${product.being}<br><br>
<#--            <form action="/product/delete/${product.id}" method="post">-->
<#--                <input type="submit" value="Удалить товар из магазина"/>-->
<#--            </form>-->
        </div>
    </div>
</div>
<div style="display: flex; flex-direction:column; align-items: center; justify-content: center">
    <a class="main" href="/">Главная</a>
</div>
</body>
</html>