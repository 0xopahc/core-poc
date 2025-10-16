// routes/about.ts
import { Router } from "express";
import { hc } from "../controllers/hc.js";
const router = Router();
router.get("/hc", hc);
export default router;
