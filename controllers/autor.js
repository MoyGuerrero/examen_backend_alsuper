const { response } = require("express")
const { dbConnection } = require("../db/db")


const getAutores = async (req, res = response) => {
    try {
        const { Activo } = req.body;

        let pool = await dbConnection();

        await pool.request()
            .input('Activo', Activo)
            .execute('sp_obtener_autores', (err, result) => {
                if (err) {
                    return res.status(400).json({
                        msg: 'Error al traer los autores.',
                        err
                    });
                }

                res.json({
                    result: result.recordset
                });
            })
    } catch (error) {
        res.status(500).json('Error: ' + error)
    }
}

const addModifyAutor = async (req, res = response) => {
    try {
        const { idAutores, Nombre, Apellido } = req.body;

        if (!Nombre) {
            return res.status(400).json({
                msg: `El campo ${Nombre} no puede ser vacios`
            });
        }

        let pool = await dbConnection();

        await pool.request()
            .input('idAutores', idAutores)
            .input('Nombre', Nombre)
            .input('Apellido', Apellido)
            .execute('sp_add_modify_autor', (err, result) => {
                if (err) {
                    return res.status(400).json({
                        msg: 'Error al guarda el autor.',
                        err
                    });
                }

                res.json({
                    msg: 'Autor guardado con exito.'
                });
            })

    } catch (error) {
        res.status(500).json('Error: ' + error)
    }
}

const deleteAutor = async (req, res = response) => {
    try {
        const { id } = req.params;

        let pool = await dbConnection();

        const result = await pool.request()
            .input('idAutores', id)
            .execute('sp_delete_autor');

        if (result.recordset == 'undefined') {
            return res.status({
                msg: 'Autor eliminado con exito'
            });
        }
        res.json({
            res: result.recordset
        });


    } catch (error) {
        res.status(500).json('Error: ' + error)
    }
}

const getBooksByAutor = async (req, res = response) => {
    try {

        const { idAutor } = req.params;
        let pool = await dbConnection();
        await pool.request()
            .input('idAutor', idAutor)
            .execute('sp_get_books_of_autor', (err, respuesta) => {
                if (err) {
                    return res.status(400).json({
                        msg: 'Error al traer los libros del autor',
                        err
                    });
                }
                res.json({
                    res: respuesta.recordset
                });
            })

    } catch (error) {
        res.status(500).json('Error: ' + error)
    }
}

const getCountBooksAllAutores = async (req, res = response) => {
    try {
        let pool = await dbConnection();
        await pool.request()
            .execute('sp_count_book_autores', (err, respuesta) => {
                if (err) {
                    return res.status(400).json({
                        msg: 'Error de mostrar la canitdad de libros de autores',
                        err
                    });
                }

                res.json({
                    res: respuesta.recordset
                });
            })

    } catch (error) {
        res.status(500).json('Error: ' + error)
    }
}



module.exports = {
    getAutores,
    addModifyAutor,
    deleteAutor,
    getBooksByAutor,
    getCountBooksAllAutores
}