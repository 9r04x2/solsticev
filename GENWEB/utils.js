const config = require("./ayarlar")
const util = require("util");


/** 
 * @param {number} id 
 * @returns {object} */
const getPlayerIdentifiers = (id) => {
    const ids = {};
    for (let i = 0; i < GetNumPlayerIdentifiers(id); i++) {
        const identifier = GetPlayerIdentifier(id, i).split(":");
        ids[identifier[0]] = identifier[1];
    }
    return ids;
};
exports.getPlayerIdentifiers = getPlayerIdentifiers;


/** 
 * @param {number} id - 
 * @returns {string|boolean} -  */
const getPlayerDiscordId = (id) => {
    const ids = getPlayerIdentifiers(id);
    return ids["discord"] || false;
};
exports.getPlayerDiscordId = getPlayerDiscordId;


/** 
 * @param {string} discordid 
 * @returns {string|boolean} */
const getPlayerFromDiscordId = async (discordid) => {
    let player = false;
    getPlayers().some(async function(p, i, a) {
        const id = getPlayerDiscordId(p);
        if (id == discordid) {
            player = p;
            return true;
        }
        return false;
    });
    return player;
};
exports.getPlayerFromDiscordId = getPlayerFromDiscordId;


/** 
 * @param {number} ms
 * @returns {Promise} */
exports.sleep = (ms) => {
    return new Promise(resolve => setTimeout(resolve, ms));
};


/** 
 * @param {string} string 
 * @returns {string} */
exports.uppercaseFirstLetter = (string) => {
    return `${string[0].toUpperCase()}${string.slice(1)}` || "";
};


/** 
 * @param {string} string
 * @return {string} */
exports.replaceGlobals = (mustafafa, string) => {
    return string
        .replace(/{Oyuncu}/g, GetNumPlayerIndices());
};


/**  */
const log = {
    /** 
     * @returns {string} */
    timestamp: (noSpaces = false) => {
        function pad(n) { return n < 10 ? "0" + n : n; }
        const date = new Date();
        return `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}${noSpaces ? "_" : " "}${pad(date.getHours())}${noSpaces ? "-" : ":"}${pad(date.getMinutes())}${noSpaces ? "-" : ":"}${pad(date.getSeconds())}`;
    },

    /** 
     * @param {string} content 
     * @param {object} settings  */
    log: (content, { color = "\x1b[37m", tag = "LOG" } = {}) => {
        log.write(content, { color, tag });
    },

    /** 
     * @param {string} content 
     * @param {object} settings  */
    info: (content, { color = "\x1b[1;36m", tag = "INF" } = {}) => {
        log.write(content, { color, tag });
    },

    /** 
     * @param {string} content 
     * @param {object} settings  */
    warn: (content, { color = "\x1b[33m", tag = "WRN" } = {}) => {
        log.write(content, { color, tag });
    },

    /**
     * @param {string} content 
     * @param {object} settings  */
    error: (content, { color = "\x1b[1;31m", tag = "ERR" } = {}) => {
        log.write(content, { color, tag, error: true });
        return false;
    },

    /** 
     * @param {string} content
     * @param {object} settings */
    write: (content, { color = "\x1b[37m", tag = "LOG", error = false } = {}) => {
        const stream = error ? process.stderr : process.stdout;
        stream.write(`\x1b[1;36m[mustafa]\x1b[0m[${log.timestamp()}]${color}[${tag}]: ${log.clean(content)}\x1b[0m\n`);
        return false;
    },

    /**
     * @param {string|object} item 
     * @returns {string}  */
    clean: (item) => {
        if (typeof item === "string") return item;
        const cleaned = util.inspect(item, { depth: Infinity });
        return cleaned;
    },

    /** 
     * 
     * @param {string|object} err -  */
    handler: (type, err) => {
        const e = err.toString();
        if (e.includes("[DISALLOWED_INTENTS]")) log.error("[mustafafa BOT] \"setup\"");
        else if (e.includes("[TOKEN_INVALID]")) log.error("[mustafafa BOT] ");
        else if (e.includes("Missing Access")) log.error("[mustafafa BOT]");
        else if (e.includes("[HeartbeatTimer]")) return;
        else if (e.includes("Heartbeat acknowledged")) return;
        else if (type === "error") log.error(e);
        else if (type === "warn") log.warn(e);
        else if (type === "info") log.info(e);
        else log.log(e);
    },

    /** 
     * @param {boolean} statement 
     * @param {string} error  */
    assert: (statement, error) => {
        if (statement == true) {
            log.error(error);
        }
    },
};
exports.log = log;


/** 
 * @param {string} id 
 * @returns {boolean} */
const isValidID = (id) => {
    return /^\d{17,21}$/.test(id);
};
exports.isValidID = isValidID;




/** 
 * @param {number} destination 
 * @param {string} label
 * @param {string} msg 
 * @param {object} options */
const chatMessage = (destination, label, msg, options) => {
    if (!options) { options = {}; }
    TriggerClientEvent("chat:addMessage", destination, {
        color: (options.color || [ 255, 255, 255 ]),
        multiline: options.multiline || false,
        args: [ label, msg ],
    });
};
exports.chatMessage = chatMessage;
