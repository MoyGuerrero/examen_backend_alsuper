const jwt = require('jsonwebtoken');



const generarJWT = (id, Usuario) => {

    return new Promise((result, reject) => {

        const payload = {
            id,
            Usuario
        };

        jwt.sign(payload, process.env.SECRET_KEY, {
            expiresIn: '8h'
        }, (err, token) => {
            if (err) {
                reject('No se pudo generar el jwt');
            } else {
                result(token)
            }
        });

    });
}

module.exports = {
    generarJWT
}