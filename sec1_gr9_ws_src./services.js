/* ITCS212 - Web Programming Project
 * TBSP - Table Spoon
 * Section: 1   Group: 9
 * 6388009 Rungpilin, 6388013 Jomchai, 6388122 Warisa, 6388123 Kornkanok 
 */

const path = require('path')
const express = require('express')
const cors = require('cors')
const app = express()
const router = express.Router()
const dotenv = require('dotenv')
const mysql = require('mysql2')
const { get } = require('http')
const jwt = require('jsonwebtoken')
//const SECRET = "secret"
const port = 5503

app.use(cors())
app.use(router)
router.use(express.json())
router.use(express.urlencoded({ extended: true }))
app.use(express.static('public'))

/* Connection to MySQL */
const dbconn = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "warisa30218",
    database: 'Tablespoon',
});

/* Connect to DB */
dbconn.connect(function (err) {
    if (err) throw err;
    console.log(`Database Connected!`);
});

// send external css file
router.get('/css/webcomponent.css', (req, res) => {
    res.sendFile(path.join(__dirname+ '/../sec1_gr9.src/css/webcomponent.css'));
});

// send js file of search page
router.get('/search-api.js', (req, res) =>{
    res.sendFile(path.join(__dirname + '/../sec1_gr9.src/search-api.js'))
})

// assign path / to be welcome page
router.get('/', (req, res) =>{
    res.sendFile(path.join(__dirname + '/../sec1_gr9.src/1_welcome.html'));
});

// assign path /regis to be register page
router.get('/regis', (req, res) =>{
    res.sendFile(path.join(__dirname + '/../sec1_gr9.src/3_register.html'));
});

// assign path /done-regis to be done-regis page
router.get('/done-regis', (req, res) =>{
    res.sendFile(path.join(__dirname + '/../sec1_gr9.src/4_done_regis.html'));
});

// assign path /home to be home page
router.get('/home', (req, res) =>{
    res.sendFile(path.join(__dirname + '/../sec1_gr9.src/5_homePage.html'));
});

// assign path /search to be search page
router.get('/search', (req, res) =>{
    res.sendFile(path.join(__dirname + '/../sec1_gr9.src/6_search.html'));
});

// assign path /aboutus to be about us page
router.get('/aboutus', (req, res) =>{
    res.sendFile(path.join(__dirname + '/../sec1_gr9.src/7_aboutUs.html'));
});

/*To check if the user already login 
then go to the home page */
const ifLogin = (req, res, next) => {
    try {
      const jwtToken = req.get("Cookie").split("token=")[1].trim();
      const user = jwt.verify(jwtToken, "SECRETKEY");
      console.log(user);
      return res.redirect("/home");
    } catch (error) {
      next();
    }
  };

  // assign path /login to be log in page and checking with the ifLogin() function
router.get("/login", ifLogin, (req, res) => {
    return res.sendFile(path.join(__dirname + '/../sec1_gr9.src/2_login.html'));
});

//Authentication process do login
var role;
router.post("/post/login", (req, res, next) => {
    var username = req.body.username;
    var password = req.body.password;
    if (!username || !password) //text box of username or password is empty
      return res.send({
        data: {
          err: true,
          msg: "Please fill in the blank",
        },
      });
    
    // step to verify the input parameters with the database
      var sql = "SELECT password, role FROM logs";
        sql += ' WHERE username=\'' +username+ '\'';
      
    dbconn.query(sql, (error, results) => {
        if (error) throw error;

        if (results.length == 0)
          return res.send({
            data: { error: true, msg: "This username does not exits" },
          });
        else {
            if (password.localeCompare(results[0].password) != 0) //comparing password 
            //if password doesn't match
              return res.send({
                data: {
                  err: true,
                  msg: "Password is incorrect",
                  loginStatus: false,
                  username: username,
                },
              });
            //else = password is match
            role = results[0].role;
            const jwtToken = jwt.sign(
              { username: username, loginStatus: true, role: role },
              "SECRETKEY",
              { expiresIn: "1h"}
            );
            res.setHeader("Set-Cookie", "token=" + jwtToken);
            console.log(`---${username} enter ${role} mode---`);
            res.send({
              data: {
                err: false, //show go to home page button and bring user to home page after click
                msg: "Now you can visit <button onclick=\"location.href='/home';\"> Home Page </button>",
              },
            });
        }
        }
    );
  });

//request to log out
router.get("/logout", (req, res) => {
    console.log("---log out---");
    res.clearCookie("token"); //clear all tokens
    return res.redirect("/"); //force to go back to welcome page
  });

  //get the authorize value to get the role of currrent user
var authorize = function() {
    try {
        const token = req.get("Cookie").split("token=")[1].trim();
        const user = jwt.verify(token, "SECRETKEY");
        if (user.loginStatus == true) {
          if (user.role == "admin") {
            return res.send({error: false, message: 'Hello Admin :)'});
          } else {
            return res.status(400).send({ error: true, message: 'You\'re not admin!' });
          }
        }
      } catch (error) {
          return res.status(400).send({ error: true, message: 'You havn\'t login yet' });
        //return res.redirect("/login"); //haven't login yet
      }
};

//  [User] no criteria search
router.get('/search/all/:query', function(req, res){
    let query = req.params.query;
    console.log(`searh all: ${query}`);
    var sql = "SELECT * FROM musics";
    sql += ' WHERE Name LIKE \'%'+ query +'%\' OR Artist LIKE \'%'+ query +'%\'';
    
    if(!query){
        return res.status(400).send({ error: true, message: 'type something to search ' });
    }
    dbconn.query(sql, function(error, results){
        if(error) throw error;
        return res.send({ status: 'success', data: results, message: 'Results retrieved'});
    });
});

// [User] criteria search - search song name
router.get('/search/name/:query', function(req, res){
    let query = req.params.query;
    console.log(`searh song name: ${query}`);
    var sql = "SELECT * FROM musics";
    sql += ' WHERE Name LIKE \'%'+ query +'%\' ';
        
    if(!query){
        return res.status(400).send({ error: true, message: 'type something to search ' });
    }
    dbconn.query(sql, function(error, results){
        if(error) throw error;
        return res.send({ status: 'success', data: results, message: 'Results retrieved'});
    });
});

//[User] criteria search - search artist
router.get('/search/artist/:query', function(req, res){
    let query = req.params.query;
    console.log(`searh artist: ${query}`);
    var sql = "SELECT * FROM musics";
    sql += ' WHERE Artist LIKE \'%'+ query +'%\' ';
    
    if(!query){
        return res.status(400).send({ error: true, message: 'type something to search ' });
    }
    dbconn.query(sql, function(error, results){
        if(error) throw error;
        return res.send({status: 'success', data: results, message: 'Results retrieved'});
    });
});

//[User] criteria search - search genre
router.get('/search/genre/:query', function(req, res){
    let query = req.params.query;
    console.log(`searh genre: ${query}`);
    var sql = "SELECT * FROM musics";
    sql += ' WHERE Genre LIKE \'%'+ query +'%\' ';
    
    if(!query){
        return res.status(400).send({ error: true, message: 'type something to search ' });
    }
    dbconn.query(sql, function(error, results){
        if(error) throw error;
        return res.send({ status: 'success', data: results, message: 'Results retrieved'});
    });
});

/* 
    Testing Search Song by ID
    method: get
    URL: http://localhost:5503/admin/search/song/musicid
    body: raw JSON

    {
        "musicID": 1
    }
    ----------------------------------
    {
        "musicID": 32
    }
*/
//[admin] search song by ID
router.get('/admin/search/song/musicid', (req, res) => {
    if(role == 'admin'){
        let query = req.body.musicID;
        console.log(query);
        var sql = "SELECT * FROM musics WHERE musicID = " + query;
        dbconn.query(sql, function(error, results){
            if (error) throw error;
            return res.send({ status: 'success', data: results, message: 'Results retrieved'});
        });
    }else return res.send("you're not admin!");
});

/* 
    Testing Search Song by Name
    method: get
    URL: http://localhost:5503/admin/search/song/name
    body: raw JSON

    {
        "name": "Girl"
    }
    ----------------------------------
    {
        "name": "Wonder"
    }
*/
//[admin] search song name
router.get('/admin/search/song/name', (req,res) =>{
    if(role == 'admin'){
        let songname = '%' + req.body.name + '%' // LIKE %songname%
        console.log(songname);
        dbconn.query('SELECT * FROM musics WHERE Name LIKE ?', songname, function(error, results){
        if(error) throw error;
        if(results.length == 0){ // There is no song in the playlist 
            return res.status(400).send({ error: true, message: `Sorry, we cannot find ${req.body.name} in our website.` })
        }
        return res.send({ error: false, data: results, message: `${req.body.name} is retrieved.`})
        });
    }else return res.send("you're not admin!");
});

/* 
    Testing Insert Song
    method: post
    URL: http://localhost:5503/admin/insert/song
    body: raw JSON

    {
        "musics": {

            "musicID" : 158,
            "Name" : "จี่หอย",
            "Genre": "Tpop",
            "Artist": "พี สะเดิด",
            "Pic" : "https://s.isanook.com/jo/0/rp/r/w300/ya0xa0m1w0/aHR0cDovL2ltYWdlLmpvb3guY29tL0pPT1hjb3Zlci8wL2EzMzYzZjc0N2QxOGQ5YTYvNjQwLmpwZw==.jpg",
            "Duration": "3.54"
        }
    }
    ----------------------------------
    {
        "musics": {
            "musicID" : "159",
            "Name" : "ผีเสื้อราตรี",
            "Genre": "Tpop",
            "Artist": "แคทรียา อิงลิช",
            "Pic" : "https://s.isanook.com/jo/0/rp/r/w300/ya0xa0m1w0/aHR0cDovL2ltYWdlLmpvb3guY29tL0pPT1hjb3Zlci8wLzBkNDQ1ZjQyNDYyYjlkZTEvNjQwLmpwZw==.jpg",
            "Duration": "3.35"
        }
    }
*/
//[admin] insert song 
router.post('/admin/insert/song', function (req, res) { 
    let musicInfo = req.body.musics;
    if(role == 'admin'){
    dbconn.query("INSERT INTO musics SET ?", musicInfo, function (error, results) {
        if (error) throw error;
        return res.send({error: false, data: results.affectedRows, message: 'New user has been at musics successfully.'});
    });
    }else return res.send("you're not admin!");
});

/* 
    Testing Update Song
    method: put
    URL: http://localhost:5503/admin/update/song
    body: raw JSON

   {
        "musics": 
        {
            "musicID" : "158",
            "Name" : "รักแรก",
            "Genre": "Tpop",
            "Artist": "พี สะเดิด",
            "Pic" : "https://s.isanook.com/jo/0/rp/r/w300/ya0xa0m1w0/aHR0cDovL2ltYWdlLmpvb3guY29tL0pPT1hjb3Zlci8wL2EzMzYzZjc0N2QxOGQ5YTYvNjQwLmpwZw==.jpg",
            "Duration": "3.54"
        }
    }
    ----------------------------------
    {
        "musics": 
        {
            "musicID" : "159",
            "Name" : "ฟ้า",
            "Genre": "Tpop",
            "Artist": "แคทรียา อิงลิช",
            "Pic" : "https://s.isanook.com/jo/0/rp/r/w300/ya0xa0m1w0/aHR0cDovL2ltYWdlLmpvb3guY29tL0pPT1hjb3Zlci8wLzBkNDQ1ZjQyNDYyYjlkZTEvNjQwLmpwZw==.jpg",
            "Duration": "3.35"
        }
    }
*/
//[admin] update song
router.put('/admin/update/song', (req,res) =>{
    if(role == 'admin'){
        const musics = req.body.musics;
        dbconn.query("UPDATE musics SET ? WHERE musicID = ?", [musics, musics.musicID], 
        function(error, results){
            if (error) throw error;
            return res.send({error: false, data: results.affectedRows, message: 'Product has been updated succesfully.'})
        });
    }else return res.send("you're not admin!");
});

/* 
    Testing Delete Song
    method: delete
    URL: http://localhost:5503/admin/delete/song
    body: raw JSON

    {
        "musicID" : "158" 
    }
    ----------------------------------   
    {
        "musicID" : "159" 
    }
*/
//[admin] delete song
router.delete('/admin/delete/song',  (req,res)  => {
    if(role == 'admin'){
        let musicID = req.body.musicID // music id table in the database
        if(!musicID){
            return res.status(400).send({error: true,message: 'Please provide a music ID.'})       
        }
        dbconn.query('DELETE FROM musics WHERE musicID = ?', musicID, function (error,results){
            if(error) throw error
            return res.send({error: false, data: results.affectedRows, message: 'music has been deleted successfully.'}) //** */
        });
    }else return res.send("you're not admin!");   
});

/* 
    Testing Search User by user ID
    method: get
    URL: http://localhost:5503/admin/search/user/musicid
    body: raw JSON

    {
        "userID": 3
    }
    ----------------------------------   
    {
        "userID": 4
    }

 */
//[admin] search user by ID
router.get('/admin/search/user/userid', (req, res) => {
    if(role == 'admin'){
        let query = req.body.userID;
        console.log(query);
        var sql = "SELECT * FROM users WHERE userID = " + query;
        dbconn.query(sql, function(error, results){
            if (error) throw error;
            return res.send({ status: 'success', data: results, message: 'Results retrieved'});
        });
    }else return res.send("you're not admin!");
});

/* 
    Testing Search User by Name
    method: get
    URL: http://localhost:5503/admin/search/user/name
    body: raw JSON

    {
        "fname" : "Kornkanok"
    }
    ----------------------------------
    {
        "fname" : "Jomchai"
    }
*/
// [admin] search user 
router.get('/admin/search/user/name', (req,res) => {
    if(role == 'admin'){
        var user_fname =  '%' + req.body.fname + '%'
            var user_lname = null 
            if(req.body.lname != null){ // If the last name is specified 
                user_lname = '%' + req.body.lname + '%' 
                dbconn.query('SELECT * FROM users WHERE fname LIKE ? AND lname LIKE ?', [user_fname, user_lname], function(error, results){ 
                    if(error) throw error;
                    let empty = results.length
                    if(empty == 0){ // There is no user in the store. 
                        return res.status(400).send({ error: true, message: `Sorry,  cannot find the user named ${req.body.fname} ${req.body.lname} in our system.` })
                    }
                    return res.send({ error: false, data: results, message: `An information about the user named ${req.body.fname} ${req.body.lname} is retrieved.`}) 
                })
            }
            else{
                dbconn.query('SELECT * FROM users WHERE fname LIKE ?', user_fname, function(error, results){
                if(error) throw error;
                let empty = results.length
                if(empty == 0){ // There is no user in the store. 
                    return res.status(400).send({ error: true, message: `Sorry,  cannot find the user named ${req.body.fname} in our system.` }) /** */
                }
                return res.send({ error: false, data: results, message: `An information about the user named ${req.body.fname} is retrieved.`}) /** */
                })
            }  
    }else return res.send("you're not admin!");
});

/* 
    Testing Insert New User
    method: post
    URL: http://localhost:5503/admin/insert/user
    body: raw JSON

    {
        "users" :
        {
            "userID" : "5",
            "fname" : "namtan",
            "Lname" : "namjai",
            "Address" : "234/45 gcondo salaya",
            "Age" : "19",
            "Preferences" : "hop",
            "Email" : "namjai07@gmail.com"
        }
    }
    ----------------------------------
    {
        "users" :
        {
            "userID" : "6",
            "fname" : "jija",
            "Lname" : "jongji",
            "Address" : "234/41 Hcondo salaya",
            "Age" : "20",
            "Preferences" : "hop",
            "Email" : "jija07@gmail.com"
        }
    }
*/
//[admin] insert new user
 router.post('/admin/insert/user', function(req,res) {
    let pInfo  = req.body.users;
    if(role == 'admin'){
        dbconn.query("INSERT INTO users (userID, fname, Lname, Address, Preferences, Email) VALUES (?,?,?,?,?,?) ", [req.body.userID,req.body.fname,req.body.Lname,req.body.Address,req.body.Preferences,req.body.Email],
        function (error, results){
        if(!pInfo){
            return res.status(400).send({error: true, message: 'Sorry, you cannot insert the specific id.'}) 
        }
        
        dbconn.query("INSERT INTO users SET ?", pInfo, (error, results) => {
            if(error) throw error
            return res.send({error: false, data: results.affectedRows, message: 'New user created successfully.'}) 
        });
    });
    }else return res.send("you're not admin!");
});

/* 
    Testing Update User
    method: put
    URL: http://localhost:5503/admin/update/user
    body: raw JSON

    {
        "data": 
        {
            "userID" : 5,
            "fname" : "fahsai",
            "Lname" : "jaja",
            "Address" : "234/45 Acondo salaya",
            "Age" : 19,
            "Preferences" : "hop",
            "Email" : "fahsai@gmail.com"
        } 
    }
    ----------------------------------
    {
        "data": 
        {
            "userID" : 6,
            "fname" : "toto",
            "Lname" : "salari",
            "Address" : "234/45 Lcondo salaya",
            "Age" : 23,
            "Preferences" : "hop",
            "Email" : "totolover@gmail.com"
        } 
    }
*/
//[admin] update user
router.put('/admin/update/user', (req,res) => {
    if(role == 'admin'){
        const users = req.body.data;
        if (!users) {
            return res.status(400).send({ error: true, message: 'Please provide information.' });
        }
        dbconn.query("UPDATE users SET ? WHERE userID = ?", [users, req.body.data.userID], 
        function(error, results) {
            if (error) throw error;
            return res.send({error: false, data: results.affectedRows, message: 'User has been updated succesfully.'});
        });
    }else return res.send("you're not admin!");
});

/* 
    Testing Search Song by Name
    method: delete
    URL: http://localhost:5503/admin/delete/user
    body: raw JSON

    {
        "userID" : "5" 
    }
    ----------------------------------
    {
        "userID" : "6" 
    }
*/
// [admin] delete user
router.delete('/admin/delete/user', (req,res) => {
    if(role == 'admin'){
        let userID = req.body.userID
        if (!userID) {
            return res.status(400).send({ error: true, message: 'Please provide userID' });
        }
        dbconn.query('DELETE FROM users WHERE userID = ?', userID, function (error, results){
            if (error) throw error;
        return res.send({ error: false, data: results.affectedRows, message: 'User has been deleted successfully.' }); //** */
        });
    }else return res.send("you're not admin!");
});

app.listen(port,()=>{
    console.log(`Listening on port ${port}`);
 })