const sql = require('mssql');


const sqlConfig = {
    user: process.env.USER_NAME,
    password: process.env.PASSWORD_DB,
    database: process.env.DATABASE_NAME,
    server: process.env.SERVER_NAME,
    trustServerCertificate: true,
    requestTimeout: 240000,
    pool: {
        max: 10,
        min: 0,
        idleTimeoutMillis: 3000
    }
}

const dbConnection = async () => {
    try {
        let pool = await sql.connect(sqlConfig);
        
        return pool;
    } catch (error) {
        console.log('Err: ', error);
    }
}

module.exports = { dbConnection }