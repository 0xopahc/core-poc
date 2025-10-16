// routes/about.ts
import { Router } from "npm:express";
import { hc } from "../controllers/hc.ts";
const router = Router();
router.get("/hc", hc);
export default router;

