// controllers/hc.ts
import fs from "node:fs"
// init log serverice 
const log_file: string = '../app.log';
const logStream = fs.createWriteStream('/home/andowens/.bc/backend/app.log', { flags: 'a' });

let hcItteration = 0
export const hc = (req, res) => {
  res.status(200).send(`bc api living. /hc hit ${hcItteration}x`);
  logStream.write(`${new Date().toISOString()} [LOG]: /hc hit ${hcItteration}x}\n`)
  hcItteration++;


}
