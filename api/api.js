
var app = require("express").Router();
const DBPool = require('./crowdfunding_db.js')

// fundraisers
app.get('/api/getFundraisersList', (req, res) => {
    let searchSql = 'SELECT * from `FUNDRAISER`'
    DBPool.query(searchSql, [], (results) => {
        let result = results.results
        res.send(result);
    })
});
//fundraisers ACTIVE ---page
app.get("/api/getFundraisersListActive", (req, res) => {
    let param = req.query
    let searchSql = 'SELECT * from `FUNDRAISER` WHERE ACTIVE = ?'
    DBPool.query(searchSql, [param.active], (results) => {
        let result = results.results
        res.send(result);
    })
});
//fundraisers by  Criteria
app.get("/api/getFundraisersListByCriteria", (req, res) => {
    let param = req.query
    let searchSql
    if(param.CATEGORY_ID == 'All'){
        searchSql = 'SELECT * from `FUNDRAISER`'
    }else {
        searchSql = 'SELECT * from `FUNDRAISER` WHERE CITY = ? AND CATEGORY_ID = ? AND ACTIVE = ?'
    }
    DBPool.query(searchSql, [param.CITY,param.CATEGORY_ID,param.ACTIVE], (results) => {
        let result = results.results
        res.send(result);
    })
});
//fundraisers details by FUNDRAISER_ID
app.get("/api/getFundraisersListByFUNDRAISERID", (req, res) => {
    let param = req.query
    let searchSql = 'SELECT * from `fundraiser` WHERE FUNDRAISER_ID = ?'
    DBPool.query(searchSql, [param.FUNDRAISER_ID], (results) => {
        let result = results.results
        res.send(result);
    })
});
//all categories
app.get("/api/getCategoriesList", (req, res) => {
    let searchSql = 'SELECT * from `category`'
    DBPool.query(searchSql, [], (results) => {
        let result = results.results
        res.send(result);
    })
});
//the list of donations
app.get("/api/getDonations", (req, res) => {
    let searchSql = 'SELECT * from `donation` order by DATE DESC'
    DBPool.query(searchSql, [], (results) => {
        let result = results.results
        res.send(result);
    })
});
//the list of donations by ByFUNDRAISERID
app.get("/api/getDonationsByFUNDRAISERID", (req, res) => {
    let param = req.query
    console.log(param);
    
    let searchSql = 'SELECT * from `donation` WHERE FUNDRAISER_ID = ? order by DATE DESC'
    DBPool.query(searchSql, [param.FUNDRAISER_ID], (results) => {
        let result = results.results
        res.send(result);
    })
});
//add donations
app.post("/api/addDonations", (req, res) => {
    let param = req.body
    var addSql =
        'INSERT INTO `donation`(`DONATION_ID`,`DATE`,`AMOUNT`,`GIVER`,`FUNDRAISER_ID`) VALUES(?,?,?,?,?)';
    var addSqlParams = [new Date().getTime(), param.DATE, param.AMOUNT, param.name, param.FUNDRAISER_ID];
    DBPool.query(addSql, addSqlParams, (results) => {
        res.send({
            res: 'success！'
        });
    })
});
// test cpanel
app.get("/api/", (req, res) => {
    let searchSql = 'SELECT * from `category`'
    DBPool.query(searchSql, [], (results) => {
        let result = results.results
        res.send(result);
    })
});
// delete fundraiser
app.delete('/api/deleteFundraiser', (req, res) => {
    let param = req.query
	DBPool.query('delete from fundraiser where FUNDRAISER_ID = ?', [param.FUNDRAISER_ID], (results) => {
		let result = results.results
		res.send({
            res: 'delete success！'
        })
	})
});
// add fundraiser
app.post('/api/addFundraiser', (req, res) => {
    let param = req.body
    var addSql =
        'INSERT INTO `fundraiser`(`FUNDRAISER_ID`,`ORGANIZER`,`CAPTION`,`TARGET_FUNDING`,`CURRENT_FUNDING`,`CITY`,`ACTIVE`,`CATEGORY_ID`) VALUES(?,?,?,?,?,?,?,?)';
    var addSqlParams = [ param.FUNDRAISER_ID, param.ORGANIZER, param.CAPTION, param.TARGET_FUNDING, param.CURRENT_FUNDING, param.CITY, param.ACTIVE, param.CATEGORY_ID];
    DBPool.query(addSql, addSqlParams, (results) => {
        res.send({
            res: 'success！'
        });
    })
});
// update fundraiser
app.put('/api/updateFundraiser', (req, res) => {
    let param = req.body
	DBPool.query('UPDATE fundraiser SET ? WHERE FUNDRAISER_ID = ?', [param, param.FUNDRAISER_ID], (results) => {
		let result = results.results
		res.send({
            res: 'success！'
        })
	})
});


module.exports = app;