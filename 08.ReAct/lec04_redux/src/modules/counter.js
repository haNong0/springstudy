// Redux코드를 작성
// 1) 액션타입, 액션생성함수, 리듀서코드를 작성
// 2) 가장 일반적인 방법은 actions, constants, reducers폴더를 별도 관리
// 3) 이 세가지를 파일하나에 작성하는 방식을 Ducks패턴이라고 한다. 

// 1. 액션타입
const INCREASE = 'counter/INCREASE';
const DECREASE = 'counter/DECREASE';

// 2. 액션생성함수
export const increase = () => ({type: INCREASE});
export const decrease = () => ({type: DECREASE});

// 3. 초기상태
const initialState = {
  number: 0,
}

// 4. 리듀서함수
function counter(state = initialState, action) {
  switch(action.type) {
    case INCREASE:
      return {number: state.number + 1}
    case DECREASE:
      return {number: state.number -1}
    default:
      return state;
  }
}

export default counter;