const express = require('express');
const cors = require('cors');
const { dbConnection } = require('../db/db');
// const dbConnection = require('../db/db');


class Server {
    constructor() {
        this.app = express();
        this.port = process.env.PORT;


        this.middlewares();

        this.routes();

        // this.dbConnection();

    }

    async dbConnection() {
        await dbConnection();
    }


    middlewares() {
        this.app.use(cors());
        this.app.use(express.json());
    }


    routes() {
        this.app.use('/', require('../routes/principal'))
            .use('/api/usuarios', require('../routes/User'))
            .use('/api/autores', require('../routes/autor'))
            .use('/api/libros', require('../routes/libros'))
            .use('/api', require('../routes/login'));
    }

    listen() {
        this.app.listen(this.port, () => {
            console.log(`Servidor corriendo en el puerto ${this.port}`);
        })
    }
}

module.exports = Server;