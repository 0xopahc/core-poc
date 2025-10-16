import fs from "fs";
// init log serverice 
const log_file = '../app.log';
const logStream = fs.createWriteStream('/home/andowens/core-poc/app/backend/app.log', { flags: 'a' });
/**
 *  // cart json with details from webapp about items:prices
 *
 *  @param {import("npm:express").Request} req - The request object
 * //
 *  @param {import("npm:express").Response} res - The response object
 * // needs to respond with html to prompt user to connect wallet and sign cart and send payment to contact
**/
export const signCart = (req, res) => {
    try {
        const ip = req.headers['x-forwarded-for']?.toString().split(',')[0].trim() || // use if behind a proxy
            req.socket?.remoteAddress ||
            req.ip; // fallback
        logStream.write(`${new Date().toISOString()} [LOG]: ${ip} hit sign page \n`);
        //ser
    }
    catch (e) {
        logStream.write(`${new Date().toISOString()} [ERROR]: \n${e}\n`);
    }
    res.status(200).send(`signCart`);
};
