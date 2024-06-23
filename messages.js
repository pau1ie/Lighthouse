// Messages Router
const express = require('express');
const router = express.Router();
const db = require('./db');
const tuning= require('./js/genVars.js');
var strings= require("./lang/en.json");
const dayNames= tuning.dayNames;
const monthNames= tuning.monthNames;
const client= db.client;
const crypto= require('crypto');
const CryptoJS = require("crypto-js");
const { isLoggedIn, getCookies, apiEyesOnly, encryptWithAES, decryptWithAES, forbidUser, 
    lostPage, idCheck, paginate, checkUUID, truncate, capitalise, 
    getKeyByValue, splitByGroup, randomise, getRandomInt, generateToken, 
    stripHTML, distill, getOrdinal, base64encode, base64decode, 
    truncateAndStringify, renderNestedList, 
    authUser,
    validateParam} = require("./funcs.js")



console.log(`Messages Router Loaded.`);
module.exports = router;