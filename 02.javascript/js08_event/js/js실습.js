const title = document.querySelector('#container');
const a = document.querySelector('#삽입');
const b = document.querySelector('#nickname');
const c = document.querySelector('#delbtn');
save.addEventListener('click', (e) =>{
  e.preventDefault();

  const item = document.createElement('li');
  item.innerHTML = `${삽입.value} - ${nickname.value}'
  
  delbtn.appendChild(item);

  container.value = "";
  삽입.value = "";
  const delButtons = document.querySelectorAll(".delBtn");
})