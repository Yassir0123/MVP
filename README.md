Taskerr

Introduction
Taskerr is a comprehensive task management web application designed to help students and professionals manage their tasks efficiently. By providing a user-friendly interface and robust features, Taskerr empowers users to plan, track progress, and collaborate seamlessly.

Project Links:

Deployed Site: [Taskerr Deployed Site](https://yassir0123.github.io/finallandingpage/ )
Project Blog Article: [Taskerr Blog](https://taskerrproject.blogspot.com/2024/07/taskerr.html)
Author LinkedIn: [Yassir Mzak](https://www.linkedin.com/in/yassir-mzak)

Inspiration
The idea for Taskerr stemmed from a challenging year our team endured while juggling demanding jobs and rigorous studies. Constantly under pressure from exams, job deadlines, and ongoing projects, we often sacrificed sleep to stay on top of everything, even with early starts. Our saving grace was meticulous task scheduling and deadline management, which provided clarity and structure amidst the chaos. This approach not only helped us navigate through our academic and professional commitments but also sparked conversations with peers facing similar challenges. We realized that many struggled to adapt and plan effectively due to the lack of user-friendly web applications for task management. This gap inspired us to create Taskerr: a task management web app designed to support students and professionals alike in achieving peak productivity. Taskerr offers intuitive interfaces and robust features that empower users to plan, track progress, and collaborate seamlessly—whether working individually or in teams.

Technology & Architecture
Taskerr is built using a robust set of technologies designed to provide a seamless user experience and efficient backend operations. We used Java Enterprise Edition (JEE) for the backend, incorporating JPA Hibernate for persistence, and Eclipse as our Integrated Development Environment (IDE). For the database, we utilized phpMyAdmin to manage our MySQL database.

The architecture of Taskerr follows the Model-View-Controller (MVC) pattern:

Model: Handles the data logic and database interactions using JPA Hibernate.
View: Consists of JSP pages that present data to the user and interact with the user.
Controller: Manages the application logic, processes user input, and interacts with the model to render the appropriate view.
This architecture ensures a clear separation of concerns, making the application more manageable and scalable.

Installation
To get a local copy up and running, follow these simple steps:

Clone the repo:
git clone https://github.com/Yassir0123/MVP.git
Navigate to the project directory:
cd MVP
Install dependencies:
npm install
Start the server:
npm start

Usage
Creating Tasks:

Navigate to the Tasks section and click on "Add Task".
Fill in the details and set a deadline if required.
Save the task to see it listed in your dashboard.
Managing Subtasks:

Click on an existing task to view and manage subtasks.
Add, edit, or delete subtasks as needed.
Collaborating in Groups:

Join or create a group in the Groups section.
Admins can create global tasks, while members manage their subtasks.
Core Algorithms
Taskerr's functionality relies on several key algorithms:

Task Prioritization Algorithm:

Tasks are prioritized based on deadlines and user-defined importance levels.
The algorithm dynamically adjusts task priorities as new tasks are added or deadlines change.
Collaborative Task Management:

Implemented a role-based access control (RBAC) system for group tasks.
Admins can create and manage main tasks while members manage their subtasks.
The system dynamically assigns and enforces permissions, ensuring secure and efficient collaboration.
Real-time Updates:

Utilizes WebSocket connections to provide real-time updates to all group members.
Ensures that any changes made by one member are instantly reflected for all members.
Contributing
Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

Fork the Project
Create your Feature Branch (git checkout -b feature/AmazingFeature)
Commit your Changes (git commit -m 'Add some AmazingFeature')
Push to the Branch (git push origin feature/AmazingFeature)
Open a Pull Request
Challenges and Solutions
Technical Challenge:
Implementing the collaborative mode for group tasks was the most difficult technical challenge. This feature required a robust design to handle the creation and management of groups, the assignment of roles, and the specific permissions associated with those roles. Ensuring that group admins could create and manage main tasks while allowing group members to manage only their assigned subtasks necessitated a sophisticated permission system.

Solution:
We designed a scalable data model with multiple tables and relationships to store groups, users, main tasks, and subtasks efficiently. Ensuring data integrity and consistency, we implemented various constraints and triggers within our database. Integrating this system with our existing task management framework involved refactoring parts of the backend and extensive testing to ensure no conflicts with existing functionalities. Role-based access control (RBAC) mechanisms were implemented to enforce permissions, involving complex logic to verify user roles and their corresponding actions.

Non-Technical Challenge:
Coordinating effectively between the backend and frontend teams to ensure seamless integration of new features was the most difficult non-technical challenge. As the project grew in complexity, maintaining clear and consistent communication became increasingly challenging.

Solution:
We resorted to asynchronous communication through detailed progress updates and task lists on project management tools, though this sometimes led to delays in feedback and slowed down the development process. Bridging the gap between backend functionalities and frontend requirements necessitated detailed documentation and thorough discussions. Managing expectations and workload distribution required constant negotiation and re-evaluation of our progress and goals. Our commitment to the project and effective use of collaborative tools like Trello, Slack, and GitHub helped us navigate these difficulties.

Learnings
This project has provided several key learnings:

Technical Takeaways:

Understanding the intricacies of role-based access control (RBAC) and real-time updates using WebSockets.
Gaining deeper insights into scalable data model design and efficient database management.
Approach to Future Projects:

I would focus more on initial planning and documentation to avoid miscommunication and delays.
Improved use of asynchronous communication tools to streamline collaboration.
Self-Learnings as an Engineer:

Recognizing the importance of flexibility and adaptability in managing complex projects.
Reinforcing the value of clear and consistent communication within a team.
Engineering Path:

This project has confirmed my interest in backend development and systems design.
I am eager to explore more about real-time systems and advanced database management techniques.
About Me
I am a dedicated and adaptable software engineer with a passion for solving complex problems and building efficient, scalable systems. I enjoy working on both backend and frontend technologies, always eager to learn and embrace new challenges.

Connect with me:

LinkedIn : https://www.linkedin.com/in/yassir-mzak
Project Links:

GitHub Repository : https://github.com/Yassir0123/MVP
Deployed Site : https://yassir0123.github.io/finallandingpage/
Project Video : https://youtu.be/p_Upp_u9mTg?si=nd4mTaT-kuBWB2xQ

Licensing
Distributed under the MIT License. See LICENSE for more information.
![Capture](https://github.com/Yassir0123/MVP/assets/121339866/28aedbd1-10d9-480b-ba6d-2320b1d9bb06)
