// controllers/aboutController.ts
import fs from "node:fs"
// init log serverice 
const log_file: string = '../app.log';
const logStream = fs.createWriteStream('/home/andowens/.bc/backend/app.log', { flags: 'a' });

export const getAboutPage = (req, res) => {
  try{
    const ip =
    req.headers['x-forwarded-for']?.toString().split(',')[0].trim() || // use if behind a proxy
    req.socket?.remoteAddress || 
    req.ip; // fallback
    logStream.write(`${new Date().toISOString()} [LOG]: ${ip} hit about page \n`)
    //server file
    res.sendFile(`/home/andowens/.bc/backend/src/public/index.html`);
  } catch (e) {
    logStream.write(`${new Date().toISOString()} [ERROR]: \n${e}\n`)
  }

};

