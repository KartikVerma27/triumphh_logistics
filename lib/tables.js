const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
const port = 3000;
app.use(cors());

const db = mysql.createConnection({
    host: 'triumphhlogistics-rds-instance-1.c9bkciincv3l.ap-southeast-2.rds.amazonaws.com',
    port: 3306,
    user: 'admin',
    password: 'g%pwPf?Z)5xj7Xu',
    database: 'triumphhlogistics',
    authSwitchHandler: (data, cb) => {
      if (data.pluginName === 'mysql_native_password') {
        cb(null, Buffer.from('caching_sha2_password'));
      }
    }
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
  } else {
    console.log('Connected to MySQL database');
  }
});

app.use(bodyParser.json());

app.post('/signup', (req, res) => {
  console.log('Received POST request to /signup');
  console.log(req.body);
  const { Name, email_address, phone_number, password } = req.body;

  // Insert the user details into the database
  const insertUserQuery = `INSERT INTO users (Name, email_address, phone_number, password) VALUES (?, ?, ?, ?)`;
  db.query(insertUserQuery, [Name, email_address, phone_number, password], (err, result) => {
    if (err) {
      console.error('Error inserting user details:', err);
      res.status(500).json({ message: 'Error inserting user details' });
      return;
    }
    console.log(req.body);
    console.log('User details saved successfully');
    res.status(200).json({ message: 'User details saved successfully' });
  });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});


