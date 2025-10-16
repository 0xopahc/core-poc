import fs from "fs";
// init log serverice 
const log_file = '../app.log';
const logStream = fs.createWriteStream('/home/andowens/core-poc/app/backend/app.log', { flags: 'a' });
let hcItteration = 0;
export const hc = (req, res) => {
    res.status(200).send(`bc api living. /hc hit ${hcItteration}x`);
    logStream.write(`${new Date().toISOString()} [LOG]: /hc hit ${hcItteration}x}\n`);
    hcItteration++;
};
