// Root Reducer만들기
// createStore함수를 사용하여 store를 만들 때는 하나의 리듀서만 사용해야 한다. 
// 리듀서를 여러개(counter.js, todos.js...) 만들었기 때문에 하나로 합쳐야 한다.
// 리듀서를 하나로 합치기 위해서는 combineReducers함수를 이용하면 쉽게 처리할 수 있다.
import { combineReducers } from 'redux';
import counter from './counter';
import todos from './todos';

const rootReducer = combineReducers({
  counter,
  todos
});

export default rootReducer;