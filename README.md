# Data Pipeline Project: Airbyte, dbt, and Metabase

This README describes a simple data pipeline project that integrates **Airbyte**, **dbt**, and **Metabase** to process and analyze a movie dataset. The pipeline involves three source dataset, a MySQL database, a PostgreSQL database, and CSV files that are consolidated into a single PostgreSQL schema for visualization in Metabase.

![Interface](./images/pipeline.png?raw=true "Title")

---

## Project Overview

### **Data Sources:**
1. **MySQL Database (DB2):**
   - Tables:
     - `film`: Contains movie details.
     - `film_actor`: Contains information about movie actors.

2. **PostgreSQL Database (DB1):**
   - Tables:
     - `actor`: Actor information.
     - `film`: Movie details.
     - `genre`: Movie genres.

3. **CSV Files from Google Drive:**
   - `ratings.csv`: User ratings for movies.
   - `films.csv`: Metadata about movies.
   - `users.csv`: User details.

### **Pipeline Steps:**
1. **Extraction and Loading (EL):** Using **Airbyte**, extract data from:
   - MySQL (`film` and `film_actor`) into the schema `SC2` in PostgreSQL.
   - PostgreSQL (`actor`, `film`, and `genre`) into the schema `SC1` in PostgreSQL.
   - CSV files (`ratings.csv`, `films.csv`, `users.csv`) into the schema `SC3` in PostgreSQL.

2. **Transformation (T):** Use **dbt** to:
   - Transform and combine data from `SC1`, `SC2`, and `SC3` into a unified schema `general`.
   - Create a final table containing aggregated movie information, actor details, and user ratings.

3. **Visualization (BI):** Use **Metabase** to:
   - Connect to the `general` schema in PostgreSQL.
   - Create dashboards visualizing movie insights, including:
     - Average ratings by genre.
     - Ratings distribution over time.
     - Actor contributions by movie.

---

## Step-by-Step Instructions

### **1. Setting Up Airbyte**
1. Install and run Airbyte using Docker:
   ```bash
   docker-compose up
   ```
2. Create sources in Airbyte:
   - **MySQL Source:** Connect to DB2 (MySQL database).
   - **PostgreSQL Source:** Connect to DB1 (PostgreSQL database).
   - **CSV Source:** Use the CSV files from Google Drive.
3. Create a destination in Airbyte:
   - **PostgreSQL Destination:** Target a new PostgreSQL database with schemas `SC1`, `SC2`, and `SC3`.
4. Configure Airbyte connections to extract data from the sources into the respective schemas in the PostgreSQL database.
5. Run syncs to load the data.

### **2. Setting Up dbt**
1. Install dbt and set up a dbt project:
   ```bash
   dbt init movie_pipeline
   ```
2. Configure the `profiles.yml` file to connect to the PostgreSQL database.
3. Create dbt models:
   - **Staging Models:** Create models for cleaning and standardizing data in `SC1`, `SC2`, and `SC3`.
   - **Final Model:** Combine the cleaned data into a table in the `general` schema containing:
     - Movie details (name, release date, genre).
     - Actor details (name, roles).
     - User ratings (average rating per movie).
4. Run dbt commands to build the models:
   ```bash
   dbt build
   ```

### **3. Setting Up Metabase**
1. Install and launch Metabase:
   ```bash
   docker run -d -p 3000:3000 metabase/metabase
   ```
2. Connect Metabase to the PostgreSQL database.
3. Select the `general` schema and create dashboards:
   - Visualize average movie ratings by genre.
   - Analyze rating distributions and trends.
   - Display actor contributions across movies.

---

## Example Output

### **Final Table Structure in `general` Schema:**
| film_name      | actor_count | release_date | genre_name | avg_rating |
|----------------|-------------|--------------|------------|------------|
| Alien          | 1           | 1979-05-25   | Horror     | 4.0        |
| Braveheart     | 2           | 1995-05-24   | Action     | 3.4        |
| Fight Club     | 3           | 1999-10-15   | Drama      | 2.2        |

### **Metabase Dashboard:**
- **Visualizations:**
  - Average movie ratings by genre.
  - Ratings over time.
  - Actor distributions by movie.
  - Number of movies in each genre.

---

## Tools and Technologies
- **Airbyte:** For data extraction and loading.
- **dbt:** For data transformation.
- **Metabase:** For data visualization and business intelligence.
- **PostgreSQL:** As the central data warehouse.
- **MySQL:** As a source database.
- **Google Drive:** For CSV file storage.

---

## Challenges and Improvements
### Challenges
- Mapping data from diverse sources into a unified schema.
- Handling data quality issues (e.g., null values, inconsistent formats).

### Future Improvements
- Automate pipeline execution using scheduling tools.
- Integrate more advanced analytics into the Metabase dashboard.

---

## Author
**Idriss El Abidi**
