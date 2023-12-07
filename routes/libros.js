const { Router } = require("express");
const { addBook, getBooks, deleteBook } = require("../controllers/libros");
const { validteJWT } = require("../middlewares/validateJWT");



const router = Router();


router.post('/addBook', validteJWT, addBook);
router.get('/getBooks', validteJWT, getBooks);
router.delete('/deleteBook', validteJWT, deleteBook);

module.exports = router;