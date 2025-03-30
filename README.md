# ReviseX App 📚🎯

A **Flutter-powered** quiz application with SQLite integration, subject-wise performance tracking, and AI-generated quizzes. Built using **Drift** for local database management and **Riverpod** for state management.

## Features 🚀
- 📖 **Standard Quiz**: Randomly selects questions from the database.
- 🎛 **Custom Quiz**: Users select subjects, number of questions, and time per question.
- 🤖 **AI Quiz**: Personalizes questions based on user weaknesses using TFLite.
- 📊 **Subject-wise Performance Tracking**: Identify strong and weak subjects.
- 💾 **Local Database (SQLite with Drift)**: Stores quiz questions and user progress.
- 🎨 **Custom UI Theme**: Dark mode-inspired colors and styling.
  

## Installation 🛠
1. **Clone the repository:**
   ```sh
   git clone https://github.com/sherledge/ReviseX.git
   cd ReviseX
   ```
2. **Install dependencies:**
   ```sh
   flutter pub get
   ```
3. **Run the app:**
   ```sh
   flutter run
   ```

## Database Schema 🗃
The app uses an SQLite database (`quiz.db`) with a `quiz` table:
```sql
CREATE TABLE quiz (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  subject TEXT,
  question TEXT,
  option_a TEXT,
  option_b TEXT,
  option_c TEXT,
  option_d TEXT,
  correct_answer TEXT,
  times_asked INTEGER
);
```

## AI Quiz 🎯
- Uses a **TFLite model** to determine the number of questions per subject.
- **Weakness Score Formula**: `1 - (correct answers / total questions)`
- **Subjects Considered:**
  1. Operating Systems
  2. Data Structures
  3. Database Management Systems
  4. Computer Organization And Architecture
  5. Formal Languages And Automata Theory

## Technologies Used 🛠
- **Flutter** (Dart)
- **Drift** (SQLite ORM)
- **Riverpod** (State Management)
- **TFLite** (AI-based question selection)

## Contributing 🤝
1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature-name`
3. **Commit your changes**: `git commit -m "Added new feature"`
4. **Push to GitHub**: `git push origin feature-name`
5. **Create a Pull Request**

