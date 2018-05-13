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
                const doan = await client.query("SELECT * FROM doan as da LEFT JOIN sinhvien as sv ON da.ma_sv=sv.ma_sv LEFT JOIN giangvien as gv ON da.ma_gv=gv.ma_gv LEFT JOIN trangthai as tt ON da.ma_tt = tt.ma_tt LEFT JOIN loaidoan as lda ON da.ma_lda=lda.ma_lda WHERE da.ma_sv='"+req._passport.session.user.id+"'")
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

router.get('/nguyenvong', (req, res, next) => {
    if(req.isAuthenticated() && req._passport.session.user.id >=  20000000){
        (async() => {
            const client = await pool.connect()
            try {
                const doan = await client.query("SELECT * FROM doan, loaidoan WHERE doan.ma_lda=loaidoan.ma_lda AND ma_gv IS NULL AND ma_sv='"+req._passport.session.user.id+"'")
                const sv = await client.query("SELECT * FROM sinhvien WHERE ma_sv='"+req._passport.session.user.id+"'")
                const gv = await client.query("SELECT * FROM giangvien")
                const kv = await client.query("SELECT * FROM khoavien")
                console.dir(doan.rows);
                res.render('./sinhvien/nguyenvong',{doan: doan.rows, usr: req._passport.session, giangvien: gv.rows, khoavien: kv.rows})
            } finally {
                client.release()
            }
        })().catch(e => console.log(e.stack))
    } else res.redirect('/dangnhap')
})

router.post('/nguyenvong', (req, res, next) => {
    if(req.isAuthenticated() && req._passport.session.user.id >= 20000000){
        const ma_sv = req.body.ma_sv;
        const ma_gv = req.body.ma_gv;
        const ma_da = req.body.ma_da;
        const ghi_chu = req.body.ghi_chu;
        (async() => {
            const client = await pool.connect()
            try {
                await client.query("INSERT INTO nguyenvong(ma_sv, ma_gv, ma_da, ghi_chu) VALUES ('"+ma_sv+"',"+ma_gv+","+ma_da+",'"+ghi_chu+"');")       
                req.flash("success", "Đăng ký nguyện vọng thành công. Hãy đợi")
                res.redirect("/sinhvien/");
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

router.get('/nopbai', (req, res, next) => {
    if (req.isAuthenticated() && req._passport.session.user.id >=  20000000) {
        (async() => {
            const client = await pool.connect()
            try {
                const da = await client.query("SELECT * FROM doan, loaidoan, trangthai WHERE (loaidoan.ma_lda=doan.ma_lda) AND (doan.ma_sv = '"+req._passport.session.user.id+"') AND (trangthai.ma_tt=2) AND (doan.ma_tt=trangthai.ma_tt)")
                const sv = await client.query("SELECT * FROM sinhvien WHERE ma_sv= '"+req._passport.session.user.id+"'")
                res.render('./sinhvien/nopbai', {  usr: sv.rows[0], doan: da.rows})
            } finally {
                client.release()
            }
        })().catch(e => console.log(e.stack))
    } else res.redirect('/dangnhap')
});

router.post('/nopbai', (req, res, next) => {
    if (req.isAuthenticated() && req._passport.session.user.id >=  20000000) {
        const ma_da = req.body.ma_da;
        let tbc = req.files.tep_bao_cao
        const ghi_chu_sv = req.body.ghi_chu_sv
        const ghi_chu = req.body.ghi_chu
        const che_do = req.body.che_do
        let file = req.files.tep
        let img = req.files.hinh_anh;
        (async() => {
            const client = await pool.connect()
            try {
                if (file != undefined && img != undefined && tbc != undefined ) {
                    let fileName = addFile(file)
                    let imgName = addImg(img)
                    let tbcName = addFile(tbc)
                    await client.query("INSERT INTO manguoncuoi (che_do,ghi_chu,tep, hinh_anh, ma_da) VALUES('" + che_do + "','" + ghi_chu + "','"+fileName+"','"+imgName+"','"+ma_da+"')");
                    await client.query("UPDATE doan SET tep_bao_cao='"+tbcName+"', ghi_chu_sv='"+ghi_chu_sv+"', ma_tt =4 WHERE ma_da=" + ma_da );
                }
                if (file == undefined && img != undefined && tbc != undefined ) {
                    let imgName = addImg(img)
                    let tbcName = addFile(tbc)
                    await client.query("INSERT INTO manguoncuoi (che_do,ghi_chu, hinh_anh, ma_da) VALUES('" + che_do + "','" + ghi_chu + "','"+imgName+"','"+ma_da+"')");
                    await client.query("UPDATE doan SET tep_bao_cao='"+tbcName+"', ghi_chu_sv='"+ghi_chu_sv+"', ma_tt =4 WHERE ma_da=" + ma_da );
                }
                if (file != undefined && img == undefined && tbc != undefined ) {
                    let fileName = addFile(file)
                    let tbcName = addFile(tbc)
                    await client.query("INSERT INTO manguoncuoi (che_do,ghi_chu, tep, ma_da) VALUES('" + che_do + "','" + ghi_chu + "','"+fileName+"','"+ma_da+"')");
                    await client.query("UPDATE doan SET tep_bao_cao='"+tbcName+"', ghi_chu_sv='"+ghi_chu_sv+"', ma_tt =4 WHERE ma_da=" + ma_da );
                }
                if (file != undefined && img != undefined && tbc == undefined ) {
                    let fileName = addFile(file)
                    let imgName = addImg(img)
                    await client.query("INSERT INTO manguoncuoi (che_do,ghi_chu,tep, hinh_anh, ma_da) VALUES('" + che_do + "','" + ghi_chu + "','"+fileName+"','"+imgName+"','"+ma_da+"')");
                    await client.query("UPDATE doan SET ghi_chu_sv='"+ghi_chu_sv+"', ma_tt =4 WHERE ma_da=" + ma_da );
                }
                if (file == undefined && img == undefined && tbc != undefined ) {
                    let tbcName = addFile(tbc)
                    await client.query("INSERT INTO manguoncuoi (che_do,ghi_chu, ma_da) VALUES('" + che_do + "','" + ghi_chu + "','"+ma_da+"')");
                    await client.query("UPDATE doan SET tep_bao_cao='"+tbcName+"', ghi_chu_sv='"+ghi_chu_sv+"', ma_tt =4 WHERE ma_da=" + ma_da );
                }
                if (file != undefined && img == undefined && tbc == undefined ) {
                    let fileName = addFile(file)
                    await client.query("INSERT INTO manguoncuoi (che_do,ghi_chu,tep, ma_da) VALUES('" + che_do + "','" + ghi_chu + "','"+fileName+"','"+ma_da+"')");
                    await client.query("UPDATE doan SET ghi_chu_sv='"+ghi_chu_sv+"', ma_tt =4 WHERE ma_da=" + ma_da );
                }
                if (file == undefined && img != undefined && tbc == undefined ) {
                    let imgName = addImg(img)
                    await client.query("INSERT INTO manguoncuoi (che_do,ghi_chu, hinh_anh, ma_da) VALUES('" + che_do + "','" + ghi_chu + "','"+imgName+"','"+ma_da+"')");
                    await client.query("UPDATE doan SET ghi_chu_sv='"+ghi_chu_sv+"', ma_tt =4 WHERE ma_da=" + ma_da );
                }
                if (file == undefined && img == undefined && tbc == undefined ) {
                    await client.query("INSERT INTO manguoncuoi (che_do,ghi_chu, ma_da) VALUES('" + che_do + "','" + ghi_chu + "','"+ma_da+"')");
                    await client.query("UPDATE doan SET ghi_chu_sv='"+ghi_chu_sv+"', ma_tt =4 WHERE ma_da=" + ma_da );
                }
                req.flash("success", "Nộp bài thành công")
                res.redirect("/sinhvien/")
            } finally {
                client.release()
            }
        })(req, res).catch((e) => {
            console.log(e.stack)
            req.flash("error", "Nộp bài thất bại / Lỗi: " + e.message)
            res.redirect("/sinhvien/")
        })
    } else res.redirect('/dangnhap')
});

function addImg(img){
  let imgName = Date.now() + Math.floor((Math.random() * 100) + 1) + img.name
  if(imgName.length >= 255) imgName = imgName.slice(imgName.length-100, 100)
  img.mv('./public/upload/manguoncuoi/hinh_anh/'+imgName, function(err) {
    if (err) return res.status(500).send(err)
  })
  return imgName
}

function addFile(file){
  let fileName = Date.now() + Math.floor((Math.random() * 100) + 1) + file.name
  if(fileName.length >= 255) fileName = fileName.slice(fileName.length-100, 100)
  file.mv('./public/upload/manguoncuoi/tep/'+fileName, function(err) {
    if (err) return res.status(500).send(err)
  })
  return fileName
}