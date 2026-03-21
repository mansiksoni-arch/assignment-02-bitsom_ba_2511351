\## Storage Systems



For this hospital network, I have chosen a \*\*Polyglot Persistence\*\* strategy to meet the four distinct goals:



1\. \*\*Relational Database (RDBMS):\*\* Used for historical treatment data and billing. This ensures ACID compliance for departmental costs and patient records where accuracy is non-negotiable.

2\. \*\*NoSQL (Time-Series Database):\*\* Specifically for Goal 4 (ICU Vitals). Streaming vitals are high-velocity and "write-heavy." A NoSQL database handles this volume better than a traditional SQL table.

3\. \*\*Vector Database:\*\* For Goal 2 (Plain English queries). By converting medical notes into vectors, doctors can perform semantic searches on patient history without needing to know specific keywords or SQL.

4\. \*\*Data Warehouse (Snowflake/BigQuery):\*\* To achieve Goal 1 (Readmission Prediction) and Goal 3 (Monthly Reports). We need a centralized "Analytical" layer that joins the clinical data and cost data to run machine learning models and aggregate management reports.



\## OLTP vs OLAP Boundary



In my design, the \*\*OLTP (Online Transactional Processing)\*\* boundary exists at the point of data entry: the Hospital Management System and the ICU monitoring devices. These systems are optimized for fast, individual updates. 



The \*\*OLAP (Online Analytical Processing)\*\* boundary begins once the data passes through the ETL pipeline into the Data Warehouse. Here, the data is no longer being updated individually; instead, it is being queried in large batches to generate monthly reports and train the AI readmission model.



\## Trade-offs



A significant trade-off in this design is \*\*System Complexity\*\*. By using four different storage systems (SQL, NoSQL, Vector, and Warehouse), we increase the maintenance burden and the risk of "data silos." 



To \*\*mitigate\*\* this, I would implement a centralized \*\*Metadata Management\*\* tool and a robust \*\*Data Orchestration\*\* layer (like Apache Airflow). This ensures that all systems are synchronized and that the "Single Source of Truth" in the Data Warehouse is always up-to-date with the transactional systems.

