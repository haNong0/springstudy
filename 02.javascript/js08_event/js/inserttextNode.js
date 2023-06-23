let button = document.querySelector("button");

button.addEventListener('click', ()=> {
  alert('클릭되었습니다.')
  let testNode = document.createElement('p');
  let testTextNode = document.createTextNode("MongoDB");
  testNode.appendChild(testTextNode);
  let p = document.querySelectorAll('p')[2];
  document.body.insertBefore(testNode, p);
});