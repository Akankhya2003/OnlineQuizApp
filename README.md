# Online Quiz Web App

An interactive **Online Quiz Web Application** built using **Java Servlets, JSP, and Oracle Database**. The application allows admins to manage quiz questions and students to attempt quizzes online.

## Features

- **Admin Panel**
  - Add, update, and delete quiz questions.
  - View all questions in a tabular format.

- **Student Panel**
  - Attempt quizzes.
  - View quiz results.

- **Database**
  - Uses **Oracle DB** to store questions, options, and answers.
  - Auto-increment question IDs using sequences.

## Technologies Used

- Java Servlets & JSP
- HTML, CSS (for UI)
- Oracle Database
- JDBC for database connectivity

## Setup
1. Clone the repo:  
   ```bash
   git clone <repository_url>
2. Import as a Dynamic Web Project in Eclipse/IntelliJ.

3. Add Oracle JDBC driver (ojdbc) to project library.

4. Deploy on Apache Tomcat.

5. Run SQL scripts to create tables and sequences.

6. Access the project through its name.
   http://localhost:9090/<project_name>
