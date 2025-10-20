import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";
export default buildModule("RegisterStore", (m) => {
  const newStore = m.contract("StoreRegisry");
  
  // call register store func 
  m.call(newStore, "", []);

  return { newStore };
});

