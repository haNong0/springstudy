

const express = require('express'); 
const app = express();
// expess(4.18.x기준) 에서 req.body의    데이터를    가져오려면 boaty 

// 샘픞코드 : https://expressjs.com/en/api.html#req.body
app.use(express.json()); // for parsing application/json
app.use(express.urlencoded({ extended: true })); // for parshing 
let id = 2;
const todoList = [{ 
id: 1,
text: "오늘의    할일 1", 
done: false
}];
app.get('/', function (req, res) { 
res.send('Hello World')
});
app.get('/api/todo', (req, res) => { 
res.json(todoList);
});
app.post('/api/todo', (req, res) => { 
const {text, done } = req.body; 
todoList.push({
id: id++, 
text, 
done,
});
return res.send("post success!!") 
});
app.listen(3000, () => {
console.log('Server Start!!!'); 
})