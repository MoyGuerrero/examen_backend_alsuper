const { Router } = require("express");
const { getUsuarios, addModifyUsuario, delete_logical } = require("../controllers/User");
const { validteJWT } = require("../middlewares/validateJWT");



const router = Router();


router.get('/obtener_usuarios', validteJWT, getUsuarios);
router.post('/agregar_modificar_usuario', validteJWT, addModifyUsuario);
router.delete('/borrar_usuario', validteJWT, delete_logical)


module.exports = router;