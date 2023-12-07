const { Router } = require("express");
const { login, renovar_token } = require("../controllers/login");
const { validteJWT } = require("../middlewares/validateJWT");


const router = Router();

router.post('/login', login);
router.get('/renovarToken', validteJWT, renovar_token)

module.exports = router;