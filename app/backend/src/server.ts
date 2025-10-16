import express from "express";
import aboutRoutes from "./routes/about.ts";
import hc from "./routes/hc.ts";
import signCart from "./routes/cart.ts";
const port: number = 3000;
const app = express();

app.use("/", aboutRoutes);
app.use("/", hc);
app.use("/", signCart);
app.listen(port, () => {
  console.log(`server running on ${port}`);
})
