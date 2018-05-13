const Router = require('express-promise-router')
const router = new Router()
const pool = require('../model')
const bodyParser = require('body-parser')
const urlencodedParser = bodyParser.urlencoded({ extended: false })
const md5 = require('md5');

router.use(bodyParser.urlencoded({ extended: false }))

module.exports = router

router.get('/', (req, res, next) => {
    if(req.isAuthenticated() && req._passport.session.user.id >=  20000000){
        (async() => {
            const client = await pool.connect()
            try {
                const doan = await client.query("SELECT * FROM sinhvien as sv, doan as da, giangvien as gv, trangthai as tt, loaidoan as lda WHERE da.ma_sv=sv.ma_sv AND da.ma_gv=gv.ma_gv AND da.ma_tt = tt.ma_tt AND da.ma_lda=lda.ma_lda AND da.ma_sv='"+req._passport.session.user.id+"'")
                const sv = await client.query("SELECT * FROM sinhvien WHERE ma_sv='"+req._passport.session.user.id+"'")
                console.log({doan: doan.rows, usr: sv.rows[0]})
                res.render('./sinhvien/homepages/sinhvien',{doan: doan.rows, usr: sv.rows[0]})
            } finally {
                client.release()
            }
        })().catch(e => console.log(e.stack))
    } else res.redirect('/dangnhap')
})

router.get('/danhsach', (req, res, next) => {
    if(req.isAuthenticated() && req._passport.session.user.id == 0){
        (async() => {
            const client = await pool.connect()
            try {
                const result = await client.query('SELECT * FROM sinhvien')
                res.render('./sinhvien/danhsach',{sinhvien: result.rows.reverse()})
            } finally {
                client.release()
            }
        })().catch(e => console.log(e.stack))
    } else res.redirect('/dangnhap')
})

router.get('/them', (req, res, next) => {
    if(req.isAuthenticated() && req._passport.session.user.id == 0){
        (async() => {
            const client = await pool.connect()
            try {
                const result = await client.query('SELECT * FROM sinhvien')
                res.render('./sinhvien/them',{sinhvien: result.rows.reverse()})
            } finally {
                client.release()
            }
        })().catch(e => console.log(e.stack))
    } else res.redirect('/dangnhap')
})

router.post('/them', (req, res, next) => {
    if(req.isAuthenticated() && req._passport.session.user.id == 0){
        const ma_sv = req.body.ma_sv;
        const ten_sv = req.body.ten_sv;
        const khoa = req.body.khoa;
        const lop = req.body.lop;
        const email = req.body.email;
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
    } else res.redirect('/dangnhap')
})

router.get('/xoa/:id', (req, res, next) => {
    if(req.isAuthenticated() && req._passport.session.user.id == 0){
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
    } else res.redirect('/dangnhap')
})

router.get('/sua/:id', (req, res, next) => {
    if(req.isAuthenticated() && req._passport.session.user.id == 0){
        (async() => {
            const client = await pool.connect()
            try {
                const result2 = await client.query("SELECT * FROM sinhvien WHERE ma_sv='"+req.params.id+"'")
                res.render('./sinhvien/sua',{sinhvien: result2.rows[0]})
            } finally {
                client.release()
            }
        })().catch(e => console.log(e.stack))
    } else res.redirect('/dangnhap')
})

router.post('/sua/:id', (req, res, next) => {
    if(req.isAuthenticated() && req._passport.session.user.id == 0){
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
    } else res.redirect('/dangnhap')
})

router.get('/doithongtin/:id', (req, res, next) => {
    if(req.isAuthenticated() && req._passport.session.user.id >=  20000000){
        (async() => {
            const client = await pool.connect()
            try {
                const result2 = await client.query("SELECT * FROM sinhvien WHERE ma_sv='"+req.params.id+"'")
                res.render('./sinhvien/homepages/doithongtin',{usr: result2.rows[0]})
            } finally {
                client.release()
            }
        })().catch(e => console.log(e.stack))
    } else res.redirect('/dangnhap')
})

router.post('/doithongtin/:id', (req, res, next) => {
    if(req.isAuthenticated() && req._passport.session.user.id >=  20000000){
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
                res.redirect("/sinhvien");
            } finally {
                client.release()
            }
        })(req).catch((e,req) => {
            console.log(e.stack)
            req.flash("error", "Sửa thông tin sinh viên thất bại / Lỗi: " + e.stack)
        })
    } else res.redirect('/dangnhap')
})

// router.get('/doithongtin', (req, res, next) => {
//     if(req.isAuthenticated() && req._passport.session.user.id >=  20000000){
//         (async() => {
//             const client = await pool.connect()
//             try {
//                 const result2 = await client.query("SELECT * FROM sinhvien WHERE ma_sv='"+req.params.id+"'")
//                 res.render('./sinhvien/sua',{sinhvien: result2.rows[0]})
//             } finally {
//                 client.release()
//             }
//         })().catch(e => console.log(e.stack))
//     } else res.redirect('/dangnhap')
// })

// router.post('/doithongtin', (req, res, next) => {
//     if(req.isAuthenticated() && req._passport.session.user.id >=  20000000){
//         const ten_sv = req.body.ten_sv;
//         const khoa = req.body.khoa;
//         const lop = req.body.lop;
//         const email = req.body.email;

//         console.log(req.body);
//         (async() => {
//             const client = await pool.connect()
//             try {
//                 await client.query("UPDATE sinhvien SET ten_sv='"+ten_sv +"', khoa='"+khoa+"', lop='"+lop+"', mat_khau='"+md5(email)+"', email='"+email+"' WHERE ma_sv ='"+req.params.id+"'")       
//                 req.flash("success", "Sửa thông tin sinh viên "+ten_sv+" thành công")
//                 res.redirect("/sinhvien/homepages/sinhvien");
//             } finally {
//                 client.release()
//             }
//         })(req).catch((e,req) => {
//             console.log(e.stack)
//             req.flash("error", "Sửa thông tin sinh viên thất bại / Lỗi: " + e.stack)
//         })
//     } else res.redirect('/dangnhap')
// })