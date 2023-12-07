const { Router } = require("express");
const { getAutores, addModifyAutor, deleteAutor, getBooksByAutor, getCountBooksAllAutores } = require("../controllers/autor");
const { validteJWT } = require("../middlewares/validateJWT");



const router = Router();

router.get('/getAutores', validteJWT, getAutores);
router.post('/addAutor', validteJWT, addModifyAutor)
router.delete('/deleteAutor/:id', validteJWT, deleteAutor)
router.get('/getBooksByAutor/:idAutor', validteJWT, getBooksByAutor)
router.get('/getCountBooksByAutores', validteJWT, getCountBooksAllAutores)

module.exports = router;