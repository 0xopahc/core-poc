// routes/about.ts
import { Router } from "express";
import { getAboutPage } from "../controllers/aboutController.js";
const router = Router();
router.get("/about", getAboutPage);
export default router;
