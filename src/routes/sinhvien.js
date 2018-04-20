const Router = require('express-promise-router')
const router = new Router()
const pool = require('../model')
var bodyParser = require('body-parser')
var urlencodedParser = bodyParser.urlencoded({ extended: false })
var md5 = require('md5');

router.use(bodyParser.urlencoded({ extended: false }))

module.exports = router

router.get('/danhsach', (req, res, next) => {
    (async() => {
        const client = await pool.connect()
        try {
            const result = await client.query('SELECT * FROM sinhvien')
            res.render('./sinhvien/danhsach',{sinhvien: result.rows.reverse()})
        } finally {
            client.release()
        }
    })().catch(e => console.log(e.stack))
});

router.get('/them', (req, res, next) => {
    (async() => {
        const client = await pool.connect()
        try {
            const result = await client.query('SELECT * FROM sinhvien')
            res.render('./sinhvien/them',{sinhvien: result.rows.reverse()})
        } finally {
            client.release()
        }
    })().catch(e => console.log(e.stack))
});

router.post('/them', (req, res, next) => {
    const ma_sv = req.body.ma_sv;
    const ten_sv = req.body.ten_sv;
    const khoa = req.body.khoa;
    const lop = req.body.lop;
    const email = req.body.email;
    
    console.log(req.body);
    (async() => {
        const client = await pool.connect()
        try {
            await client.query("INSERT INTO sinhvien (ma_sv, ten_sv, khoa, lop, mat_khau, email) VALUES ('"+ma_sv+"','"+ten_sv +"','"+khoa+"', '"+lop+"', '"+md5(email)+"', '"+email+"')");       
            req.flash("success", "Thêm sinh viên thành công")
            res.redirect("/sinhvien/danhsach")
        } finally {
            client.release()
        }
    })(req,res).catch((e) => {
        console.log(e.stack)
        req.flash("error", "Thêm sinh viên thất bại / Lỗi: " + e.message)
        res.redirect("/sinhvien/danhsach")
    })
});

router.get('/xoa/:id', (req, res, next) => {
    (async() => {
        const client = await pool.connect()
        try {
            const sv = await client.query("SELECT ten_sv FROM sinhvien WHERE ma_sv='"+req.params.id+"'")
            ten_sv = sv.rows[0].ten_sv
            await client.query("DELETE FROM sinhvien WHERE ma_sv='"+req.params.id+"'")       
            req.flash("success", "Xoá sinhvien "+ten_sv+" thành công")
            res.redirect("/sinhvien/danhsach");
        } finally {
            client.release()
        }
    })(req).catch((e,req) => {
        console.log(e.stack)
        req.flash("error", "Xóa sinh viên thất bại / Lỗi: " + e.stack)
    })
});

router.get('/sua/:id', (req, res, next) => {
    (async() => {
        const client = await pool.connect()
        try {
            const result2 = await client.query("SELECT * FROM sinhvien WHERE ma_sv='"+req.params.id+"'")
            res.render('./sinhvien/sua',{sinhvien: result2.rows[0]})
        } finally {
            client.release()
        }
    })().catch(e => console.log(e.stack))
});

router.post('/sua/:id', (req, res, next) => {
    const ten_sv = req.body.ten_sv;
    const khoa = req.body.khoa;
    const lop = req.body.lop;
    const email = req.body.email;

    console.log(req.body);
    (async() => {
        const client = await pool.connect()
        try {
            await client.query("UPDATE sinhvien SET ten_sv='"+ten_sv +"', khoa='"+khoa+"', lop='"+lop+"', mat_khau='"+md5(email)+"', email='"+email+"' WHERE ma_sv ='"+req.params.id+"'")       
            req.flash("success", "Sửa thông tin sinh viên "+ten_sv+" thành công")
            res.redirect("/sinhvien/danhsach");
        } finally {
            client.release()
        }
    })(req).catch((e,req) => {
        console.log(e.stack)
        req.flash("error", "Sửa thông tin sinh viên thất bại / Lỗi: " + e.stack)
    })
});