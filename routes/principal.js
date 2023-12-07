const { Router } = require('express');
const { saludo, about, contact } = require("../controllers/principal");



const router = Router();

router.get('/', saludo);
router.get('/about', about);
router.get('/contact', contact)

module.exports = router;