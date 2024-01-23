const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
const port = 3000;
app.use(cors());

const db = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'root',
    database: 'triumphhlogistics',
// The following commented code snippet is for use in cloud hosting not when hosted on localhost
//    authSwitchHandler: (data, cb) => {
//      if (data.pluginName === 'mysql_native_password') {
//        cb(null, Buffer.from('caching_sha2_password'));
//      }
//    }
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
  } else {
    console.log('Connected to MySQL database');
  }
});

app.use(bodyParser.json());
// Function to verify credentials
function verifyCredentials(table, email, password, callback) {
    const query = `SELECT * FROM ?? WHERE email_address = ? AND password = ?`;
    db.query(query, [table, email, password], (err, result) => {
        if (err || result.length === 0) {
            callback(false); // Credentials are not valid
        } else {
            callback(true); // Credentials are valid
        }
    });
}

// Endpoint for signing in
app.post('/signin', (req, res) => {
    const { userType, email_address, password } = req.body;
    console.log(req.body);

    // Check if userType, email_address, and password are provided
    if (!userType || !email_address || !password) {
        return res.status(400).json({ message: 'Missing required fields' });
    }

    const tableMap = { 'user': 'users', 'admin': 'admin', 'driver': 'driver' };
    const table = tableMap[userType.toLowerCase()];

    if (!table) {
        return res.status(400).json({ message: 'Invalid user type' });
    }
    console.log('running');
    verifyCredentials(table, email_address, password, isValid => {
        if (isValid) {
        console.log('done');
            res.status(200).json({ message: 'Login successful', userType });
        } else {
            res.status(401).json({ message: 'Incorrect username or password' });
        }
    });
});
//Endpoint for signing up
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


