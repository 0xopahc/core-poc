// inspect element on dutchie data schema for reffrece  
// think about what values are mutable and what values
export interface CartSchema {
  txHash: string
  pickedUp: boolean
  // status of order mutable value only by store wallet.  think about tx signing time and how tenders will want to get ticket > fill ticket > close ticket> completed sale || incomplete sale
  status: string 
  items: {}
  total: number 

}
