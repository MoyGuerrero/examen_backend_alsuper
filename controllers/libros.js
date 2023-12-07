const { response } = require("express");
const { dbConnection } = require("../db/db");


const addBook = async (req, res = response) => {
    try {
        const { Titulo, Editorial, Año, idAutor } = req.body

        if (!idAutor) {
            return res.status(400).json({
                msg: 'El autor es requerido'
            });
        }

        let pool = await dbConnection();

        await pool.request()
            .input('Titulo', Titulo)
            .input('Editorial', Editorial)
            .input('anio', Año)
            .input('idAutor', idAutor)
            .execute('sp_insert_book ', (err, respuesta) => {
                if (err) {
                    return res.status(400).json({
                        msg: 'No se pudo insertar el libro',
                        err
                    });
                }

                res.json({
                    msg: 'Libro agregado con exito.'
                });
            })

    } catch (error) {
        res.status(500).json('Error: ' + error);
    }
}


const getBooks = async (req, res = response) => {
    try {
        const { Activo } = req.body;
        let pool = await dbConnection();

        await pool.request()
            .input('Activo', Activo)
            .execute('sp_get_books', (err, respuesta) => {
                if (err) {
                    return res.status(400).json({
                        msg: 'No se lograron obtener los libros',
                        err
                    });
                }

                res.json({
                    res: respuesta.recordset
                });
            })

    } catch (error) {
        res.status(500).json('Error: ' + error);
    }
}

const deleteBook = async (req, res = response) => {
    try {
        const { idLibro, idAutor } = req.body;
        let pool = await dbConnection();

        await pool.request()
            .input('idLibro', idLibro)
            .input('idAutor', idAutor)
            .execute('sp_delete_book', (err, respuesta) => {
                if (err) {
                    return res.status(400).json({
                        msg: 'No se logro eliminar el libro',
                        err
                    });
                }
                

                if (respuesta.recordset == 'undundefinedefined') {
                    return res.json({
                        msg: 'Libro eliminado con exito.'
                    });
                }

                res.json({
                    res: respuesta.recordset
                })
            })

    } catch (error) {
        res.status(500).json('Error: ' + error);
    }
}



module.exports = {
    addBook,
    getBooks,
    deleteBook
}