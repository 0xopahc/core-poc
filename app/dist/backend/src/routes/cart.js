import { Router } from "express";
import { signCart } from "../controllers/cartController.js";
const router = Router();
// Define the routes for the cart
// incoming json needs to be 
router.get('/cart/signCart', signCart);
export default router;
