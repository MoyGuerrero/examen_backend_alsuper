const { response } = require("express");
const bcrypt = require('bcryptjs');

const { dbConnection } = require("../db/db");
const { generarJWT } = require("../helpers/jwt");


const login = async (req, res = response) => {
    try {
        const { User, Password } = req.body


        let pool = await dbConnection();

        const result = await pool.request()
            .input('Usuario', User)
            .execute('sp_login');

        if (!result.recordset.length) {
            return res.status(400).json({
                msg: 'Error no existe usuario.'
            });
        }
        const { id, Usuario, Pw, Activo } = result.recordset[0]

        const isValidPw = bcrypt.compareSync(Password, Pw);


        if (!isValidPw) {
            return res.status(400).json({
                msg: 'Contraseña invalida.'
            });
        }

        if (!Activo) {
            return res.status(400).json({
                msg: 'Usuario dado de baja.'
            });
        }

        const token = await generarJWT(id, Usuario);

        res.json({
            token
        });

    } catch (error) {
        res.status(500).json('Error: ' + error)
    }
}


const renovar_token = async (req, res = response) => {
    try {
        const User = req.Usuario;
        
        let pool = await dbConnection();

        const result = await pool.request()
            .input('Usuario', User)
            .execute('sp_login');
            
        const { id, Usuario } = result.recordset[0]
        const token = await generarJWT(id, Usuario);

        res.json({
            token,
            usuario: result.recordset
        });

    } catch (error) {
        res.status(500).json('Error: ' + error)
    }
}

module.exports = { login, renovar_token }