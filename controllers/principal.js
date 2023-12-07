const e = require("express");


const saludo = (req, res = Response) => {
    try {
        res.json('¡Hola! Esta es la página de inicio');
    } catch (error) {
        console.error(error);
    }
}

const about = (req, res = Response) => {
    try {
        res.json(`Bienvenido a la página 'Acerca de nosotros'.`);
    } catch (error) {
        console.error(error);
    }
}

const contact = (req, res = Response) => {
    try {
        res.json('Ponte en contacto con nosotros en contact@example.com');
    } catch (error) {
        console.error(error);
    }
}


module.exports = {
    saludo,
    about,
    contact
}