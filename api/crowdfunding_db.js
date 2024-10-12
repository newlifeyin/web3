class DBPool {
	constructor() {
		//Assuming the database connection pool is initialized here, the specific code is not provided
		this.mysql = require("mysql");
		this.config = {
			host: 'localhost', 
			port: 3306, 
			user: 'root', //Username for connecting to the database
			password: 'admin', //Password for connecting to the database
			database: 'crowdFunding4', //Database Name
			connectionLimit: 10, 
			multipleStatements: false, 
			waitForConnections: true, 
		};
		this.pool = this.mysql.createPool(this.config);
	}
	query(sql, params, callBack) {
		this.pool.getConnection((err, connection) => {
			if (err) {
				throw err;
			}
			connection.query(sql, params, (err, results, fields) => {
				connection.release();
				if (err) {
					throw err;
				}
				callBack && callBack({ results, fields });
			});
		});
	}

	queryAsync(sql, params) {
		const self = this;//Return a Promise object for asynchronous operations
		return new Promise((resolve, reject) => {
			this.pool.getConnection((err, connection) => {
				if (err) {
					//If an error occurs while obtaining the connection, reject the Promise and pass in an error message
					reject(err);
					return;
				}
				connection.query(sql, params, (err, results, fields) => {
					connection.release();
					if (err) {
						reject(err);
						return;
					}
					//If the query is successful, parse the Promise and return the result and field information
					resolve({
						results,
						fields,
					});
				});
			});
		});
	}
}

//Export an instance of DBPool for use by other modules
module.exports = new DBPool();