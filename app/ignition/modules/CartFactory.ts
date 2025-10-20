import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("CartFactoryModule", (m) => {
  const cartFactory = m.contract("CartFactory");

  //m.call(cartFactory, "addOrder", []);

  return { cartFactory };
});
