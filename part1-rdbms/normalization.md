\## Anomaly Analysis



\* \*\*Update Anomaly:\*\* Customer Rohan Mehta (C001) appears in multiple rows, such as ORD1114 and ORD1091. If his email or city changes, we must update every row where C001 appears. Missing one row leads to inconsistent customer profiles.

\* \*\*Insert Anomaly:\*\* We cannot store details for a new Sales Representative (e.g., SR04) or a new Product (e.g., P009) unless an order is placed. The schema prevents us from recording business entities (employees/products) without a transaction.

\* \*\*Delete Anomaly:\*\* In order ORD1185, Amit Verma bought a Webcam (P008). Since this is the only record of product P008, deleting this order (e.g., due to a cancellation) removes all information about the Webcam's existence and price from our system.



\## Normalization Justification



I strongly refute the manager's position that normalization is over-engineering. While a single "flat" table like `orders\_flat.csv` seems simpler for initial data entry, it creates long-term data integrity risks and storage inefficiencies that far outweigh the initial convenience.



Using our specific dataset, we can see that customer and sales representative information is repeated every time an order is placed. For instance, Rohan Mehta’s name and email appear in every single one of his orders. If the manager’s approach were used, updating a single piece of info—like a change in a sales representative's office address—would require searching through thousands of rows. If one row is missed, the database becomes "corrupt" with conflicting information, known as an Update Anomaly.



Furthermore, normalization to Third Normal Form (3NF) ensures that we can store data about products or employees independently of sales. In the flat file, we cannot add a new product to our catalog unless it is already part of an order (Insert Anomaly). By splitting the data into separate tables for Customers, Products, and SalesReps, we ensure that every "entity" is stored only once. This reduces the database size, prevents accidental data loss during deletions (Delete Anomaly), and provides a "single source of truth." Normalization isn't over-engineering; it is the foundation of a reliable and scalable business system.

