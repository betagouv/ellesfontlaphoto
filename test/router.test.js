const assert = require('assert');
const expect = require('chai').expect
const request = require('supertest');
const app = require('../server')

describe('Unit testing the / route', function () {

    it('should return OK status', async function () {
        const response = await request(app)
            .get('/');
        assert.strictEqual(response.status, 200);
    });

    it('should return message on rendering', async function () {
        const response = await request(app)
            .get('/');
        expect(response.text).to.contain('<!--HOME PAGE-->');
    });

});

describe('Unit testing the /mentions-legales route', function () {

    it('should return OK status', async function () {
        const response = await request(app)
            .get('/mentions-legales');
        assert.strictEqual(response.status, 200);
    });

    it('should return message on rendering', async function () {
        const response = await request(app)
            .get('/mentions-legales');
        expect(response.text).to.contain('<!--LEGAL NOTICE TEXT-->');
    });

});

describe('Unit testing the /donnees-personnelles-et-gestion-des-cookies', function () {

    it('should return OK status', async function () {
        const response = await request(app)
            .get('/donnees-personnelles-et-gestion-des-cookies');
        assert.strictEqual(response.status, 200);
    });

    it('should return message on rendering', async function () {
        const response = await request(app)
            .get('/donnees-personnelles-et-gestion-des-cookies');
        expect(response.text).to.contain('<!--COOKIE MANAGEMENT TEXT-->');
    });

});

describe('Unit testing the /hello', function () {

    it('should return 404 status', async function () {
        const response = await request(app)
            .get('/hello');
        assert.strictEqual(response.status, 404);
    });

    it('should return an error message ', async function () {
        const response = await request(app)
            .get('/hello');
        expect(response.text).to.contain('page not found');
    });

});