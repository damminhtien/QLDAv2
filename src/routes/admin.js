const Router = require('express-promise-router')
const router = new Router()

module.exports = router

router.get('/', (req, res, next) => {
	res.render('./admin/aboutus')
});