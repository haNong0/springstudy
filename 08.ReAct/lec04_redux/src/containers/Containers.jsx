// Redux와 연동하려면 react-redux에서 제공하는 connect함수를 사용해야 한다.
// connect(mapStateToProps, mapDispatchToProps)(연동할 컴퍼넌트)
// ... mapStateToProps   : 리덕스 스토어의 상태를 컴퍼넌트의 props로 전달하기 위해 설정
// ... mapDispatchToProps : 액션생성함수를 컴퍼넌트의 props로 전달하기 위해 설정
// connect함수를 호출하면 다른 함수를 반환해 준다. 이 반환된 함수에 컴퍼넌트 파라미터로
// 전달하면 리덕스와 컴퍼넌트가 연동된다.
import React from 'react';
import Counter from '../components/Counter';
import { connect } from 'react-redux';
import { decrease, increase } from '../modules/counter';

const CounterContainer = ({number, increase, decrease}) => {
  return (
    <Counter number={number} onIncrease={increase} onDecrease={decrease} />
  );
};


// 1. 함수를 정의
// const mapStateToProps = (state) => ({
//   number: state.counter.number,
// })
// const mapDispatchToProps = dispatch => ({
//   increase: () => dispatch(increase()),
//   decrease: () => dispatch(decrease())
// })
// export default connect(mapStateToProps, mapDispatchToProps)(CounterContainer);

// 2. 익명함수
// export default connect(mapStateToProps, mapDispatchToProps)(CounterContainer);
