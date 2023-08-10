import React from 'react';

const TodoItem = ({ todo, onToggle, onRemove}) => {
  return (
    <div>
      <input type="checkbox" />
      <span>예제 텍스트</span>
      <button>삭제</button>
    </div>
  );
};

const Todos = ({
  input,  // 입력텍스트
  todos,  // TodoItem들디 저장된 객체
  onChangeInput,
  OnInsert,
  onToggle,
  onRemove,
}) => {
  
  const onSubmit = (e) => {
    e.preventDefalut();
  }

  return (
    <div>
      <form onSubmit={onSubmit}>
        <input type="text" />{'  '}
        <button type="submit">할일 등록</button>
        <br />
      </form>
      <div>
        <TodoItem />
        <TodoItem />
        <TodoItem />
        <TodoItem />
      </div>
    </div>
  );
}
export default Todos;