//Create Date 12-02-2022
//64130010049 ปริญญา เติมกสิพาณิชย์

import Foundation

let config_tax_rate:[[String:Float]] = [
  [
    "range":150000,
    "rate":0,
  ],
  [
    "range":150000,
    "rate":0.05,
  ],
  [
    "range":200000,
    "rate":0.10,
  ],
  [
    "range":250000,
    "rate":0.15,
  ],
  [
    "range":250000,
    "rate":0.20,
  ],
  [
    "range":1000000,
    "rate":0.25,
  ],
  [
    "range":3000000,
    "rate":0.30,
  ],
  [
    "range":-1,
    "rate":0.35,
  ]
]

var salary:[String:Float] = ["month":0,"year":0,"calculate":0]
var tax:[String:Float] = ["deduction":0,"total":0,"temp":0]

repeat {
  print("Enter Salary : ", terminator: "")
  salary["month"] = Float(readLine()!)!
} while salary["month"]! < 0

salary["year"] = salary["month"]! * 12

tax["deduction"] = salary["year"]! * 0.4
tax["deduction"] = tax["deduction"]! > 100000 ? 100000 : tax["deduction"]!

salary["calculate"] = salary["year"]! - tax["deduction"]!

for config_data in config_tax_rate {
  if(salary["calculate"]! > config_data["range"]! && config_data != config_tax_rate.last){
    salary["calculate"] = salary["calculate"]! - config_data["range"]!
    tax["temp"] = config_data["range"]! * config_data["rate"]!
  }else{
    tax["temp"] = salary["calculate"]! * config_data["rate"]!
    salary["calculate"] = 0
  }
  
  tax["total"] = tax["total"]! + tax["temp"]!
}

print("""
-------------Tax 2564-------------
Salary : \(salary["month"]!) Baht
Total Salary : \(salary["year"]!) Baht
-----------------------------------
Tax Deduction (40%) : \(tax["deduction"]!) Baht
-----------------------------------
Total Tax : \(tax["total"]!) Baht
""")