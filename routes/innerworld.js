// Inner World Router
const express = require('express');
const router = express.Router();
const db = require('../db.js');
const client= db.client;
const { getCookies } = require("../funcs.js");

router.get('/inner-world/:id', (req, res) => {
	// if (!checkUUID(req.params.id)) return lostPage(res, req);
	if (isLoggedIn(req)) {
		client.query({ text: "SELECT * FROM inner_worlds WHERE u_id=$1 AND id=$2;", values: [getCookies(req)['u_id'], req.params.id] }, (err, result) => {
			if (err) {
				console.log(err.stack);
				res.status(400).render('pages/400', { session: req.session, code: "Bad Request", cookies: req.cookies });
			} else {
				res.render(`pages/edit_innerworld`, {
					session: req.session, cookies: req.cookies, iw: {
						id: result.rows[0].id,
						title: Buffer.from(result.rows[0].key, "base64").toString(),
						body: Buffer.from(result.rows[0].value, "base64").toString()
					}
				});
			}
		});

	} else { res.status(403).render('pages/403', { session: req.session, code: "Forbidden", cookies: req.cookies }); }

});

router.get('/inner-world', (req, res, next) => {
	if (isLoggedIn(req)) {
		client.query({ text: 'SELECT * FROM inner_worlds WHERE u_id=$1', values: [getCookies(req)['u_id']] }, (err, result) => {
			if (err) {
				console.log(err.stack);
				res.status(400).render('pages/400', { session: req.session, code: "Bad Request", cookies: req.cookies });
			} else {
				req.session.innerworld_rows = result.rows;
				client.query({ text: 'SELECT * FROM users WHERE id=$1', values: [getCookies(req)['u_id']] }, (err, bresult) => {
					if (err) {
						console.log(err.stack);
						res.status(400).render('pages/400', { session: req.session, code: "Bad Request", cookies: req.cookies });
					} else {
						req.session.innerworld = bresult.rows[0].inner_worlds || false;
						res.render(`pages/innerworld`, { session: req.session, cookies: req.cookies });
					}

				});
			}

		});
	} else { res.status(403).render('pages/403', { session: req.session, code: "Forbidden", cookies: req.cookies }); }
});

router.get('/inner-world/delete/:id', (req, res) => {
	// if (!checkUUID(req.params.id)) return lostPage(res, req);
	if (isLoggedIn(req)) {
		client.query({ text: "DELETE FROM inner_worlds WHERE id=$1;", values: [`${req.params.id}`] }, (err, result) => {
			if (err) {
				console.log(err.stack);
				res.status(400).render('pages/400', { session: req.session, code: "Bad Request", cookies: req.cookies });
			} else {
				req.session.sys_rules = null;
			}
			res.redirect("/inner-world");
		});
	} else { res.status(403).render('pages/403', { session: req.session, code: "Forbidden", cookies: req.cookies }); }
});

router.post('/inner-world/:id', (req, res) => {
	// if (!checkUUID(req.params.id)) return lostPage(res, req);
	if (isLoggedIn(req)) {
		client.query({
			text: "UPDATE inner_worlds SET key=$3, value=$4 WHERE u_id=$1 AND id=$2;",
			values: [
				getCookies(req)['u_id'],
				req.params.id,
				`'${Buffer.from(req.body.keytitle).toString("base64")}`,
				`'${Buffer.from(req.body.valuebody).toString("base64")}`,
			]
		}, (err, result) => {
			if (err) {
				console.log(err.stack);
				res.status(400).render('pages/400', { session: req.session, code: "Bad Request", cookies: req.cookies });
			} else {
				req.flash("flash", "Inner world updated!")
				res.redirect("/inner-world")
			}
		});
	} else {
		res.status(403).render('pages/403', { session: req.session, code: "Forbidden", cookies: req.cookies });
	}
});

router.post('/inner-world', (req, res) => {
	if (isLoggedIn(req)) {
		if (req.body.create) {
			client.query({ text: 'INSERT INTO inner_worlds (u_id, key, value) VALUES ($1,$2,$3);', values: [`${getCookies(req)['u_id']}`, `${Buffer.from(req.body.key).toString('base64')}`, `${Buffer.from(req.body.value).toString('base64')}`] }, (err, result) => {
				if (err) {
					console.log(err.stack);
					res.status(400).render('pages/400', { session: req.session, code: "Bad Request", cookies: req.cookies });
				}
			});
		} else {
			// Deleting.
			client.query({ text: "DELETE FROM inner_worlds WHERE id=$1;", values: [getKeyByValue(req.body, "Remove")] }, (err, result) => {
				if (err) {
					console.log(err.stack);
					res.status(400).render('pages/400', { session: req.session, code: "Bad Request", cookies: req.cookies });
				} else {
					req.session.sys_rules = null;
				}
			});
		}
		res.redirect(req.get('referrer'));
	} else {
		res.status(403).render('pages/403', { session: req.session, code: "Forbidden", cookies: req.cookies });
	}
});

console.log("Inner World Router Loaded.");
module.exports = router;