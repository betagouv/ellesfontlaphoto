const express = require("express");
const router = express.Router();

router.get('/', (req, res) => {
    res.render('index.ejs');
})

router.get('/mentions-legales', (req, res) => {
    res.render('mentions-legales');
})

router.get('/donnees-personnelles-et-gestion-des-cookies', (req, res) => {
    res.render('donnees-personnelles-et-gestion-des-cookies')
})

/* router.get('/faq', (req, res) => {
    res.render('faq')
}) */

router.get('*', (req, res) => {
    res.status(404).send('page not found');
})

module.exports = router;