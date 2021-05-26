# Preferred Learning Style
This is the Flutter app for PLS. 

## Structure for quiz section

* **QuizScreen:** Appears after scenario selection. Uses QuestionController and quiz components (body, option, progress bar, question card) to build a StaefulWidget which updates the questions in a single screen. Has the options to skip or exit. Displays progress at the top.
* **QuestionController:** Parses the questions database to create a series of Question objects which in turn are used to generate the question cards. It uses page controllers to navigate between the questions and sends responses to the database.
* **QuestionCard:** Contains question text, options, sliders, as well as the buttons to save response and go to next question or exit.
* **Body:** Builds a widget using the Question object and the options.
* **Welcome Screens:** App starting screen, asks for user name, age.
* **Scenario Selection:** Gives available options for scenarios for the quiz.
* **Feedback:** Asks for user feedback.
* **Score Screen:** Shows graph for PLS for the current quiz session.
* **Database:** The MongoDB Atlas database which stores questions and responses. The keys have been made into placeholders in the codebase and will need to be replaced by the ones provided in the keys document (private).

**NOTE:** Sections can be jumped by exiting, choosing to continue the quiz, and choosing a new scenario.
