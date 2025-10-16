import express from "express";
import aboutRoutes from "./routes/about.js";
import hc from "./routes/hc.js";
import signCart from "./routes/cart.js";
const port: number = 3000;
const app = express();

app.use("/", aboutRoutes);
app.use("/", hc);
app.use("/", signCart);
app.listen(port, () => {
  console.log(`server running on ${port}`);
})
