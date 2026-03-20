// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  { "product_id": "P_ELEC_001", "name": "Gaming Laptop", "category": "Electronics", "price": 75000, "specs": { "warranty": "2 years", "voltage": "220V" } },
  { "product_id": "P_CLOT_002", "name": "Cotton T-Shirt", "category": "Clothing", "price": 1200, "specs": { "size": "L" } },
  { "product_id": "P_GROC_003", "name": "Whole Wheat Bread", "category": "Groceries", "price": 50, "expiry_date": "2024-12-25" }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({ "category": "Electronics", "price": { $gt: 20000 } });

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({ "category": "Groceries", "expiry_date": { $lt: "2025-01-01" } });

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne({ "product_id": "P_ELEC_001" }, { $set: { "discount_percent": 10 } });

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ "category": 1 });
// Explanation: Indexing the category field speeds up search queries (like OP2 and OP3) by allowing the database to find products without scanning every single document.

