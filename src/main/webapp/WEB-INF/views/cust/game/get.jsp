<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <mata charset="UTF-8" />
    <title>구구단</title>
    <script
      crossorigin
      src="https://unpkg.com/react@16/umd/react.development.js"
    ></script>
    <script
      crossorigin
      src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"
    ></script>
    <script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
  </head>
  <body>
    <div id="root"></div>
    <!--결과:<div id="root"><button>Like</button></>div>-->
    <script type="text/babel">
      // class Gugudan extends Recat.ComponentP{
      // }

      const GuGuDan = () => {
        const[first,setFirst] = React.useState(Math.ceil(Math.random()*9));
        const[second,setSecond] = React.useState(Math.ceil(Math.random()*9));
        const[value,setValue] = React.useState('');
        const[result,setResult] = React.useState('');

        return <div>{first}{second}{value}{result}</div>;
      };
    </script>
    <script type="text/babel">
      //위의 만들어논 컴포넌트를 화면에다가 그리겠다.
      ReactDOM.render(<GuGuDan />, document.querySelector("#root"));
    </script>
  </body>
</html>