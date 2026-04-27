const express = require('express');
const axios = require('axios');

const app = express();
app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => {
    res.send(`
        <h2>To-Do Form</h2>
        <form method="POST" action="/submit">
            Item Name: <input name="itemName"/><br/><br/>
            Item Description: <input name="itemDescription"/><br/><br/>
            <button type="submit">Submit</button>
        </form>
    `);
});

app.post('/submit', async (req, res) => {
    try {
        await axios.post('http://backend:5000/submittodoitem', req.body);
        res.send("✅ Data sent to Flask backend!");
    } catch (err) {
        res.send("❌ Error sending data");
    }
});

app.listen(3000, () => console.log("Frontend running on port 3000"));