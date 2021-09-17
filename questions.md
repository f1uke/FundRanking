# Technical questions

#### How long did you spend on the coding test? What would you add to your solution if you had more time? If     you didn't spend much time on the coding test then use this as an opportunity to explain what you would     add.

ผมใช้เวลาหลังเลิกงานประมาณ 2-3 ชม ต่อวันในการทำ โดยผมมีเวลาทำทั้งหมด 7 วัน ผมจึงแบ่งงานแต่ละวันโดย
- วันแรกผมเริ่มดูเอกสารเพื่อทราบถึงความต้องการว่าจะออกแบบ app มาเป็นยังไงและเริ่มออกแบบ app คร่าวๆในกระดาษ 
- วันที่ 2 จึงเริ่มวางโครงสร้างโปรเจคโดยมีต้นแบบจากโปรเจคที่เคยทำผ่านมา
- วันที่ 3-7 เริ่ม dev และ test ไปในเวลาเดียวกัน

#### What was the most useful feature that was added to the latest version of your chosen language? Please       include a snippet of code that shows how you've used it.

ใน swift 5.4 มีสิ่งที่เพิ่มมาใหม่ที่น่าสนใจคือ การรับ parameters แบบ multiple
```swift
func chooseSecondPerson(persons: String...) -> String {
   let index = 1
   if persons.count > index {
       return persons[index]
   } else {
       return "There is no second person."
   }
}
```
ฟังชั่นด้านบนจะทำการรับ parameter ที่เป็น string และทำการ return string ใน index ที่ 1 กลับมา
ตัวอย่างการเรียกใช้ดังนี้
```swift
chooseSecondPerson(persons: "a", "b", "b")
//result is b
```

#### How would you track down a performance issue in production? Have you ever had to do this?

ในโปรเจคที่ผมเคยทำนั้น เราจะใช้เครื่องมีติดตามปัญหาอย่างเช่น firebase crashlytics ซึ่งจะช่วย track ปัญหาหลังจากที่ปล่อย app ขึ้น production แล้วได้ เมื่อเกิดปัญหา app crash ขึ้นเราจะสามารรู้ได้ว่าปัญหาเกิดขึ้นที่ view controller ไหนบ้าง

#### How would you improve the FINNOMENA APIs that you just used?

สิ่งที่ผมเห็นว่าควรปรับปรุงใน API ที่ provide ให้มานั้นแบ่งได้เป็นเรื่องๆคือ
 1. โครงสร้างของ json นั้นสามารถออกแบบได้ดีกว่านี้ โดยแบ่งให้ชัดเจนว่า data ที่ได้มานั้นมี object เดียว หรือเป็น list ของ object เช่น 
 
ใช้ data เมื่อข้อมูล return เป็น object เดียว
```json
{
  "status": true,
  "error": "",
  "data": {
    "mstar_id": "F00000LKGM",
    "thailand_fund_code": "KT-PRECIOUS",
    "nav_return": 2.98222,
    "nav": 5.7116,
    "nav_date": "2021-09-03T00:00:00.000Z",
    "avg_return": 0.19715
  }
}
```
ใช้ datas เมื่อข้อมูล return เป็น list
```json
{
  "status": true,
  "error": "",
  "datas": [
    {
      "mstar_id": "F00000LKGM",
      "thailand_fund_code": "KT-PRECIOUS",
      "nav_return": 2.98222,
      "nav": 5.7116,
      "nav_date": "2021-09-03T00:00:00.000Z",
      "avg_return": 0.19715
    }
  ]
}
```

 2. ชื่อของตัวแปรนั้นหากเลือกใช้เป็นรูปแบบ camel case จะทำให้การ decode, encode ง่ายกว่ามาก
 3. พบปัญหาในการใช้งาน api เนื่องจากไม่มีเอกสารอธิบายให้จัดเจนว่าตัวแปรแต่ละตัวมีความหมายยังไง


