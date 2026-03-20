\## RDBMS vs NoSQL Reflection



\### 1. Flexibility

RDBMS (SQL) requires a strict schema. If I want to add a "Middle Name" to a customer, I have to alter the whole table. In NoSQL, I can just add that field to one document without affecting others.



\### 2. Relationships

RDBMS is better for complex relationships (like linking Sales Reps to Orders) because it uses Joins. NoSQL is better for "Nested" data where everything about a customer is in one place.



\### 3. Scaling

NoSQL is generally easier to scale across multiple servers for massive amounts of data, whereas RDBMS is best for maintaining "Perfect" data integrity.

