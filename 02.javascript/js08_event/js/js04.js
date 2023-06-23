const orderList = document.querySelector('#orderlist');
const orderButton = document.querySelector('#order');
const product = document.querySelector('.container > h2'); //상품목록

orderButton.addEventListener('click', () => {
  let orderProduct = document.createElement ("p");
  let textProduct = document.createTextNode(product.innerText);

    orderProduct.appendChild(textProduct);//상품명 
    orderList.appendChild(orderProduct);
}, {once: true});