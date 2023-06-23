//li querySelectorALL: 배열로 리턴, removeChild()
const li_lists= document.querySelector('li'); //모든 li태그 선택

for(let li of li_lists) {
  li.addEventListener('click', function() {
    this.parentNode.removeChild(this);
  })
}
