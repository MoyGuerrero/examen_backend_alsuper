const { response } = require('express');
const jwt = require('jsonwebtoken');

const validteJWT = (req, res = response, next) => {

    const token = req.header('x-token');

    if (!token) {
        return res.status(401).json({
            msg: 'No hay token en la peticion'
        });
    }

    try {

        const { id, Usuario } = jwt.verify(token, process.env.SECRET_KEY);

        req.id = id;
        req.Usuario = Usuario;
        next();

    } catch (error) {
        res.status(401).json({
            msg: 'Token incorrecto'
        });
    }
}


module.exports = { validteJWT }