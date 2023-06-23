const title = document.querySelector('#title');
const author =document.querySelector('#author');
const save =document.querySelector('#save');
const booklist =document.querySelector('#booklist');

save.addEventListener('click', (e) => {
  e.preventDefault();

  const item = document.querySelector('li');
  item.innerHTML = `${title.value}-${author.value} 
  <span class="del">삭제</span>`; 
  booklist.appendChild(item);

  title.value = "";
  author.value = "";
  const delButtons = document.querySelectorAll(".delBtn");

  for(let delbutton in delButtons) {
  delbtn.addEventListener ('click', removeItem);
  }
});
  function removeItem () {
    let list = this.parentNode;
    list.parentNode.removeChild(list);
  }


