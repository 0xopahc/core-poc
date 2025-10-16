# documenting dutchie api data structures for internal use


The following section will go into the data returned to a user from the dutchie api when a user adds a item to cart from a givnen store 

## req 1
```cURL
curl 'https://dutchie.com/api-4/graphql?operationName=GetAddressBasedDispensaryData&variables=%7B%22input%22%3A%7B%22dispensaryId%22%3A%22iwjoD2evZ4Bws3Fs3%22%7D%7D&extensions=%7B%22persistedQuery%22%3A%7B%22version%22%3A1%2C%22sha256Hash%22%3A%2213461f73abf7268770dfd05fe7e10c523084b2bb916a929c08efe3d87531977b%22%7D%7D' \
  -H 'accept: */*' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H 'apollographql-client-name: Marketplace (production)' \
  -H 'content-type: application/json' \
  -b '__cf_bm=er3ARw51wB.XVjG7CgLnizFyeRop9lhilDhd8BlGMCc-1760550313-1.0.1.1-qnN3KqeoGRoIPjbNyv3PfYSDwUfVam61ae46wNOemS0hHA_aPwZLHkIJHdwj4_imISFb9anIFP_eV2KQHCWco8XC5.a_OWOwu60Y2UEE9UQ; __cflb=04dToaXWHAPESU8RyBQBc8Yta2dmM5dcCYg9kT2nyD' \
  -H 'priority: u=1, i' \
  -H 'referer: https://dutchie.com/embedded-menu/trinity-compassionate-care/product/cap-junky-1g-live-sugar-nature-s-grace' \
  -H 'sec-ch-ua: "Brave";v="141", "Not?A_Brand";v="8", "Chromium";v="141"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-storage-access: none' \
  -H 'sec-gpc: 1' \
  -H 'url: https://dutchie.com/embedded-menu/trinity-compassionate-care/product/cap-junky-1g-live-sugar-nature-s-grace' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36' \
  -H 'x-dutchie-session: eyJpZCI6IjQyYzRlZjYzLTExMjAtNDc0Zi1iZDMwLTk5YWU4NDk4NDRmZiIsImV4cGlyZXMiOjE3NjExNTUxMTQ5NzV9'
```

### Response 
```
{
    "data": {
        "getAddressBasedDispensaryData": {
            "deliveryInfo": {
                "deliveryAreaId": null,
                "withinBounds": true,
                "fee": null,
                "minimum": 0,
                "feeVaries": null,
                "minimumVaries": null,
                "__typename": "Dispensaries_deliveryInfo"
            },
            "taxes": [
                {
                    "id": "cbb8bf7a-6551-4a24-abf6-ef5bf5900e7b",
                    "type": "sales",
                    "name": "Accessories Sales Tax",
                    "rate": 0.09,
                    "potencyRate": null,
                    "potency": null,
                    "medical": true,
                    "recreational": false,
                    "taxBasis": "retail",
                    "stages": [
                        {
                            "op": "noop",
                            "type": "pos",
                            "__typename": "Dispensaries_TaxConfig_Tax_Stage"
                        },
                        {
                            "op": "noop",
                            "type": "menu",
                            "__typename": "Dispensaries_TaxConfig_Tax_Stage"
                        },
                        {
                            "op": "add",
                            "type": "checkout",
                            "__typename": "Dispensaries_TaxConfig_Tax_Stage"
                        }
                    ],
                    "applyTo": {
                        "types": [
                            "Accessories",
                            "Apparel"
                        ],
                        "hemp": false,
                        "__typename": "Dispensaries_TaxConfig_Tax_ApplyTo"
                    },
                    "order": null,
                    "deliveryPolicy": null,
                    "includeStateSalesTaxInDestinationRate": null,
                    "__typename": "Dispensaries_TaxConfig_Tax",
                    "destinationRate": null
                },
                {
                    "id": "9e1de7a3-c7ae-487c-a3c1-9eab584b702b",
                    "type": "sales",
                    "name": "Cannabis Sales Tax",
                    "rate": 0.01,
                    "potencyRate": null,
                    "potency": null,
                    "medical": true,
                    "recreational": false,
                    "taxBasis": "retail",
                    "stages": [
                        {
                            "op": "noop",
                            "type": "menu",
                            "__typename": "Dispensaries_TaxConfig_Tax_Stage"
                        },
                        {
                            "op": "noop",
                            "type": "pos",
                            "__typename": "Dispensaries_TaxConfig_Tax_Stage"
                        },
                        {
                            "op": "add",
                            "type": "checkout",
                            "__typename": "Dispensaries_TaxConfig_Tax_Stage"
                        }
                    ],
                    "applyTo": {
                        "types": [
                            "Flower",
                            "Pre-Rolls",
                            "Vaporizers",
                            "Concentrate",
                            "Edible",
                            "Topicals",
                            "Tincture",
                            "Clones",
                            "Seeds",
                            "CBD"
                        ],
                        "hemp": false,
                        "__typename": "Dispensaries_TaxConfig_Tax_ApplyTo"
                    },
                    "order": null,
                    "deliveryPolicy": null,
                    "includeStateSalesTaxInDestinationRate": null,
                    "__typename": "Dispensaries_TaxConfig_Tax",
                    "destinationRate": null
                }
            ],
            "__typename": "AddressBasedDispensaryDataResult"
        }
    }
}
```

## req 2
```cURL
curl 'https://dutchie.com/api-4/graphql' \
  -H 'accept: */*' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H 'apollographql-client-name: Marketplace (production)' \
  -H 'content-type: application/json' \
  -b '__cf_bm=er3ARw51wB.XVjG7CgLnizFyeRop9lhilDhd8BlGMCc-1760550313-1.0.1.1-qnN3KqeoGRoIPjbNyv3PfYSDwUfVam61ae46wNOemS0hHA_aPwZLHkIJHdwj4_imISFb9anIFP_eV2KQHCWco8XC5.a_OWOwu60Y2UEE9UQ; __cflb=04dToaXWHAPESU8RyBQBc8Yta2dmM5dcCYg9kT2nyD' \
  -H 'origin: https://dutchie.com' \
  -H 'priority: u=1, i' \
  -H 'referer: https://dutchie.com/embedded-menu/trinity-compassionate-care/product/cap-junky-1g-live-sugar-nature-s-grace' \
  -H 'sec-ch-ua: "Brave";v="141", "Not?A_Brand";v="8", "Chromium";v="141"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-storage-access: none' \
  -H 'sec-gpc: 1' \
  -H 'url: https://dutchie.com/embedded-menu/trinity-compassionate-care/product/cap-junky-1g-live-sugar-nature-s-grace' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36' \
  -H 'x-dutchie-session: eyJpZCI6IjQyYzRlZjYzLTExMjAtNDc0Zi1iZDMwLTk5YWU4NDk4NDRmZiIsImV4cGlyZXMiOjE3NjExNTUxMTQ5NzV9' \
  --data-raw '{"operationName":"ComputeWithPriceCartV2","variables":{"priceCartInput":{"cart":[{"productId":3202203,"quantity":1,"unitPrice":45,"unitWeightGrams":1}],"isDelivery":false,"ecomUserId":null,"customerTypeId":1,"dispensaryId":"iwjoD2evZ4Bws3Fs3","rewardRedemptions":[],"paymentMethods":[],"codeRedemptions":[],"loyaltyPointsApplied":0,"deliveryScheduleId":null,"payerId":null,"posCustomerId":null,"includeGamification":true}},"extensions":{"persistedQuery":{"version":1,"sha256Hash":"7061849b59aa19345054d36009d4df0d963ad183af2fc8fc831ad9df474ede6b"}}}'
  ```
### response data
```

{
    "data": {
        "computeWithPriceCartV2": {
            "itemTaxes": [
                {
                    "taxAmount": 27,
                    "taxType": "cannabis",
                    "productId": 3202203,
                    "feeItemId": null,
                    "showOnMenu": false,
                    "showOnCheckout": false,
                    "__typename": "ItemTax"
                }
            ],
            "cartItemPrices": [
                {
                    "productName": "Cap Junky | 1g | Live Sugar | Nature's Grace",
                    "productId": 3202203,
                    "quantity": 1,
                    "subtotal": 4500,
                    "unitPrice": 4500,
                    "pricingTierAdjustment": 0,
                    "pricingTierAdjustmentTotal": 0,
                    "summaryPrice": 4500,
                    "menuPrice": 4500,
                    "discounts": [
                        {
                            "name": "40% Off | ALL NGW brands | Graffiti, Signature, Twenty Twenty, Moon Walkers, Joos, Yubalachia",
                            "amount": 1800,
                            "discountId": 312791,
                            "applicationMethod": "Automatic",
                            "isLoyaltyReward": false,
                            "isPaymentIncentive": false,
                            "__typename": "Discount"
                        }
                    ],
                    "tax": 27,
                    "unitWeightGrams": 1,
                    "productType": "Quantity",
                    "__typename": "CartItem"
                }
            ],
            "fees": [],
            "subTotal": 4500,
            "taxes": 27,
            "discount": 1800,
            "originalTotal": 2727,
            "roundedDifference": 27,
            "grandTotal": 2700,
            "loyaltyPointsUsed": 0,
            "rewardValidationErrors": [],
            "totalSalesTax": 0,
            "totalCannabisTax": 27,
            "totalBottleDepositTax": 0,
            "taxInclusivePricing": false,
            "loyaltyAppliedAsDiscount": 0,
            "discountWithoutLoyalty": 1800,
            "posCustomerId": null,
            "discountGamification": {
                "gamificationDetails": null,
                "__typename": "CalculationResults_CartGamification"
            },
            "__typename": "CalculationResults"
        }
    }
}
```



























