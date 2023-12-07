const { response } = require("express");
const bcrypt = require('bcryptjs');

const { dbConnection } = require("../db/db");



const getUsuarios = async (req, res = response) => {
    try {

        let pool = await dbConnection();

        await pool.request()
            .execute('sp_get_user', (err, result) => {
                if (err) {
                    return res.status(400).json('Error al traer los usuarios: ' + err)
                }

                res.json({
                    result: result.recordset
                });
            });

    } catch (error) {
        res.status(500).json('Error: ' + error)
    }
}

const addModifyUsuario = async (req, res = response) => {
    try {
        let { id, Nombre, Usuario, Pw, Correo } = req.body;

        const salt = bcrypt.genSaltSync();

        Pw = bcrypt.hashSync(Pw, salt);

        let pool = await dbConnection();
        await pool.request()
            .input('id', id)
            .input('Nombre', Nombre)
            .input('Usuario', Usuario)
            .input('Pw', Pw)
            .input('Correo', Correo)
            .execute('sp_add_modify_user', (err, result) => {
                if (err) {
                    return res.status(400).json('Error al guardar usuario: ' + err)
                }

                if (id > 0) {
                    return res.json({
                        msg: 'Actualizado coon exito.'
                    })
                }


                res.json({
                    msg: 'Usuario guardado con exito.'
                })
            })


    } catch (error) {
        res.status(500).json('Error: ' + error)
    }
}

const delete_logical = async (req, res = response) => {
    try {
        const { id } = req.body;

        let pool = await dbConnection();

        await pool.request()
            .input('id', id)
            .execute('sp_delete_logical', (err, result) => {
                if (err) {
                    return res.status(400).json('Error al dar de baja la usuario ' + err)
                }

                res.json({
                    msg: 'Usuario dado de baja.'
                });
            })
    } catch (error) {
        res.status(500).json('Error: ' + error)
    }
}

module.exports = {
    getUsuarios,
    addModifyUsuario,
    delete_logical
}