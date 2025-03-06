# Real-Time Customer Data Pipeline with Apache NiFi, AWS, and Snowflake

## 🚀 Project Overview
This project showcases a **real-time data streaming pipeline** that efficiently ingests, processes, and manages customer data while handling **Slowly Changing Dimensions (SCD1 & SCD2)**. By leveraging **Apache NiFi, AWS, and Snowflake**, the pipeline enables seamless data movement, change tracking, and historical record maintenance.

## 📌 Key Highlights
- **End-to-End Real-Time Data Pipeline** for customer data processing
- **Containerized Apache NiFi** running inside **Docker on AWS EC2**
- **Automated Data Ingestion** via **AWS S3 & Snowpipe**
- **Change Data Capture (CDC) with Snowflake Streams** for SCD2
- **Automated SCD1 & SCD2 Management** with **Snowflake Tasks**
- **Highly Scalable & Cloud-Native Solution** with AWS & Snowflake

---

## 🔷 Architecture Diagram
![Architecture Diagram](Project%20images/Pipeline%20Overview.png)

This architecture ensures **seamless, real-time customer data processing** while maintaining historical integrity and supporting automated transformation workflows.

---

## ⚙️ **Tech Stack & Components**
| Component         | Technology Used |
|------------------|----------------|
| **Data Generation**  | Python (Faker Library) |
| **Containerization** | Docker (Running Apache NiFi & Jupyter Notebook) |
| **Data Orchestration** | Apache NiFi |
| **Cloud Infrastructure** | AWS EC2 (Dockerized NiFi), AWS S3 (Data Storage) |
| **Data Warehousing** | Snowflake |
| **Streaming & Automation** | Snowflake Streams (SCD2), Snowflake Tasks (SCD1 & SCD2 Automation) |
| **Cluster Management** | ZooKeeper |

---

## 🔄 **End-to-End Pipeline Workflow**
### **0️⃣ AWS EC2 Instance Setup & Running Services**
- **Amazon EC2** is used to host Dockerized Apache NiFi and Jupyter Notebook.
- **Instance setup includes** security groups, SSH access, and Docker installation.

![EC2 Instance Running with Services](Project%20images/ec2%20instance.png)
### **1️⃣ Data Generation (Jupyter Notebook inside Docker on EC2)**
- A **Python script** generates synthetic customer data in real-time.
- Data is **written to a mounted volume** inside the Docker container.

![Jupyter Notebook running inside Docker](Project%20images/customer%20data.png)

---

### **2️⃣ Data Ingestion (Apache NiFi & AWS S3)**
- **Apache NiFi** listens to the generated data files and transfers them to **Amazon S3**.
- **NiFi Flow is orchestrated** to ensure efficient handling of large-scale data ingestion.

![NiFi Workflow & Processors Setup](Project%20images/Apache%20Nifi%20Flow%20in%20process.png)

---

### **3️⃣ Automated Data Loading (Snowpipe & Staging Table)**
- **Snowpipe** automatically ingests data from **S3 into the Snowflake staging table**.
- Ensures **low-latency streaming ingestion** with minimal manual intervention.

![S3 Bucket](Project%20images/AWS%20s3%20bucket.png)

---

### **4️⃣ Change Data Capture & SCD Implementation**
#### **📌 SCD1 (Latest Data Updates)**
- **Snowflake Tasks** automate the **overwrite logic** for updating records.
- Ensures the latest data is available for business intelligence and analytics.

#### **📌 SCD2 (Historical Data Tracking)**
- **Snowflake Streams** continuously capture changes to the customer dataset.
- **Merge logic** inserts new versions of the records, maintaining historical integrity.
- **Snowflake Tasks** automate this process at scheduled intervals.

![SCD2 Working in Snowflake](Project%20images/scd2%20test%20results.png)

---

## 🏆 **Technical Capabilities Demonstrated**
### **📍 Data Engineering & ETL**
✅ **Real-time Data Pipeline Design**  
✅ **Efficient ETL/ELT with Apache NiFi & Snowflake**  
✅ **Schema Evolution & CDC Implementation**  

### **📍 Cloud & Infrastructure**
✅ **Containerized Deployment using Docker**  
✅ **AWS Infrastructure (EC2, S3, Snowpipe, Snowflake Integration)**  
✅ **Scalable, Cloud-Native Architecture**  

### **📍 Data Modeling & Storage**
✅ **Dimensional Modeling with SCD1 & SCD2**  
✅ **Efficient Query Optimization & Performance Tuning**  
✅ **Snowflake Streams & Tasks for Automation**  

### **📍 Automation & Optimization**
✅ **Scheduled & Automated Data Processing using Snowflake Tasks**  
✅ **Hands-free Change Data Capture with Snowflake Streams**  
✅ **Minimal Latency with Snowpipe-based Data Ingestion**  



