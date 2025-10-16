import { Router } from "npm:express";
import { signCart } from "../controllers/cartController.ts";
const router = Router();    
// Define the routes for the cart
// incoming json needs to be 
router.get('/cart/signCart', signCart)

export default router;