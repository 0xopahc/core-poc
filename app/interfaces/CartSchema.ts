export interface Item {
  id: number;
  name: string;
  quantity: number;
  price: number;
}

export interface Order {
  items: Item[];
  total: number;
  customer: string;
  storeWallet: string;
}
