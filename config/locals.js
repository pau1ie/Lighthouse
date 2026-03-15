const pjson = require('../package.json');
const tuning = require('./js/genVars.js');
var strings = require("./lang/en.json");
const langVar = require("./js/languages.js");
const { isLoggedIn, getCookies, apiEyesOnly, encryptWithAES, decryptWithAES, forbidUser,
	lostPage, idCheck, paginate, checkUUID, truncate, capitalise,
	getKeyByValue, splitByGroup, randomise, getRandomInt, generateToken,
	stripHTML, distill, getOrdinal, base64encode, base64decode } = require("./funcs.js");
    
/*
app.locals.version = pjson.version;
app.locals.siteLanguage = langVar.siteLanguage;
app.locals.editorColours = tuning.editorColours;
app.locals.journalArr = splitByGroup(tuning.journals);
app.locals.journals = tuning.journals;
app.locals.skinGroups = tuning.skinGroups;
app.locals.strings = strings;
app.locals.apiKey = process.env.apiKey;
app.locals.moods = tuning.moods;
app.locals.isLoggedIn = function (cookies) {
	if (!cookies.u_id) {
		return false;
	} else {
		return true;
	}
};
app.locals.pad = function (number, digits) {
	return String(number).padStart(digits, '0');
}

app.locals.randomise = randomise;
app.locals.truncate = truncate;
app.locals.distill = distill;
app.locals.getOrdinal = getOrdinal;
app.locals.monthNames = monthNames;

app.locals.dateOptions = {
	weekday: 'short',
	year: 'numeric',
	month: 'short',
	day: 'numeric',
}
app.locals.timeOptions = {
	hour: '2-digit',
	minute: '2-digit'
}
app.locals.truncateAndStringify = truncateAndStringify;
app.locals.renderNestedList = renderNestedList;
app.locals.isDev = process.env.environment == "dev";
app.locals.getHourFormat = getHourFormat;
app.locals.formatGMTToLocal = function (gmtTimestamp, userLocale, userTimezone) {
	const date = new Date(gmtTimestamp);

	// Determine if the locale uses 12-hour format
	const is12HourFormat = getHourFormat(userLocale);
	console.log(is12HourFormat);

	const localDateTimeString = date.toLocaleString(userLocale, {
		timeZone: userTimezone,
		year: 'numeric',
		month: 'long',
		day: 'numeric',
		hour: '2-digit',
		minute: '2-digit',
		second: '2-digit',
		hour12: is12HourFormat // Use the determined hour format
	});

	return localDateTimeString;
};

*/

const pjson = require('./package.json');

module.exports = {
    version: pjson.version,
    siteLanguage: langVar.siteLanguage,
    dayNames,
    monthNames,

    utils: {
        randomise,
        truncate,
        encrypt: encryptWithAES,
        decrypt: decryptWithAES,
        paginate,
        capitalise,
        pluralize,
        boil: stripHTML,
        distill,
        generateToken,
        encode:base64encode,
        decode: base64decode,
    },
    // Helper functions
    isLoggedIn: (cookies) => !!cookies.u_id,
    pad: (num, digits) => String(num).padStart(digits, '0'),
    // Constants
    dateOptions: { weekday: 'short', year: 'numeric', month: 'short', day: 'numeric' },
    isDev: process.env.environment === "dev"
};