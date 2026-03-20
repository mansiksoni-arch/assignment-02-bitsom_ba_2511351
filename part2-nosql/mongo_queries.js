// 1. Find all customers from Mumbai
db.customers.find({ "city": "Mumbai" });

// 2. Find customers who have spent more than 10,000 in a single order
db.customers.find({ "orders.total": { $gt: 10000 } });

// 3. Add a new order to Rohan Mehta (C001)
db.customers.updateOne(
  { "customer_id": "C001" },
  { $push: { "orders": { "order_id": "ORD2000", "product": "Mouse", "quantity": 1, "total": 800 } } }
);