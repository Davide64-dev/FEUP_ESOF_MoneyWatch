# MoneyWatch


## Product Vision

MoneyWatch is an app that gives the user a tool to comprehend their spending and make better decisions to grow their savings making their life easier. Our app will be able to tell you where you spend your money and will give you tips on how to spend it and where to spend it. This way you will have much more control about your life savings and expenses.

### Vision Statement

Our vision is to make people's lives easier by providing a way to understand their expenses and make wiser choices to increase their savings.



### Main Features
   1. Allows the user to add their expenses to the app
      - Every time the user makes a purchase, he should open the app and register the information. The app should store the information
   2. Tracking the expenses made in a certain time and by category
      - If the user wants to see how much he saved in a certain period of time, the app should provide organised statistics by time and category.
   3. A forum where users can share their ideas with others.
      - The users that have some doubt about anything about finance will have a forum that allows them to interchange their ideas and grow theirs savings together.
   4. Built-in tips inside the app
      - Users who have doubts about a financial topic can share their ideas in a forum and increase their savings together.
   5. Addiction Tracking
      - The app will have a feature that will allow the users to track their addictions and see the money they have saved since they started tracking.
   6. Creation of budgets inside the app.
      - The users should be able to add a budget os spending in some category
   7. Diverse Register/Login ways
      - Users can register in many different ways, such as Facebook, Google etc. 

### Assumptions and dependencies

- Google account (if the user wants to login with the Google)
- Google Translator - To translate text written in the forum for the main language of the user

## Requirements

### Nonfunctional requirements

1. The product should be developed with Flutter

## User Stories

### Feature 1

1. As a user, I want to add a new purchase to the app so I can review it later. (Must Have 5)

   **Acceptance test:**
   Given that I am on the purchase screen
   When I submit a purchase
   Then the purchase will be registered, and I can review it later.

2. As a user, when I add a purchase, I want to add a category so I can see where I spent more money. (Must have 3)

   **Acceptance test:**
   Given that I select a purchase category
   When I submit the purchase
   Then it will be registered on the database with a category.

3. As a user, I want to be able to add purchases at the frequency I choose so I don't have to add them every time I make them. (Should have 8)

   **Acceptance test:**
   Given that I select the option "multiple purchases"
   When I choose a timeline for the purchases, a total amount spent and submit
   Then the purchase will be registered with those attributes.

4. As a user who has made a mistake, I want to be able to cancel (and edit) an issue I've made so that I can correct my mistake. (Must have 20)

    **Acceptance test:**
    Given that I select a previous purchase
    When I edit it, correcting a mistake
    Then the purchase will appear with the new information selected.

5. As a user, I want to be able to add a description to my expenses so I can remember what I spent the money on. (Should have 3)

   **Acceptance test:**
   Given that I fill in a description and submit a purchase
   When I select the purchase
   Then I will see its description

6. As a user, I want to be able to add a picture of the bill of the expense so that I can check all the information about the purchase. (Could have 3)

   **Acceptance test:**
   Given that I submit a purchase with a picture
   When I select the purchase
   Then I will see the picture with all of the purchase's details

7. As a user, I'd like to add the price of a new purchase in many different currencies to the app so that the app does the coin conversion to my main currency so that I don't have to search for how much I spent in my currency. (Should have 2)

   **Acceptance test:**
   Given that I choose a currency
   When I click "confirm"
   Then all of my spendings will be in the selected currency.

### Feature 2

1. As a user, I want to check how much I spent in each category last month so that I can spend more efficiently. (Must have 20)

   **Acceptance test:**
   Given that I am in the history menu
   When I choose a category
   Then I will see the amount of money spent in that category in the last month

2. As a user, I like to check my spending by giving a start day and an end day so that I can see what times I spent more money. (Could have 20)

   **Acceptance test:**
   Given 
   **Acceptance test:** From the history menu, I can edit a text box to write the start date and another text box to write the end date, both in the DD/MM//YYYY format.

3. As a user, I want to be able to add new expense categories so that I can customize my stats to my own liking. (Should have 5)

   **Acceptance test:** From the settings menu, I can press a button to choose the custom category section, where I can write in a text box to add a category.

### Feature 3

1. As a user, I would like to be able to ask a question in a forum organized by categories that users can create, so that other people can answer me and we can exchange ideas. (Should have 100)

   **Acceptance test:** From the main menu, I can press a button to bring up a forum, then press a button to make a post in a certain category.

2. As a user, I would like to have a forum organized by category so that I can check the topics that interest me the most. (Must have 5)

   **Acceptance test:** From the forum, I can press a button to choose the section (predefined category) that I want to browse.

3. As a user, I want to be able to search the forum for the topics that interest me so that I can make my search more efficient. (Must have 20)

   **Acceptance test:** From the forum, I can press a search bar to search for specific words in post titles.

4. As a user, I'd like to be able to write my text in different languages so that I can contribute to the forum even if I don't speak English. (Must have 1)

   **Acceptance test:** Inside the forum you can change the language in the forum settings by pressing the options button and then choosing the language you want.

5. As a user, I want to have a quick translator for other users' texts so that I can understand what the user is trying to say. (Should have 8)

   **Acceptance test:** Inside any forum post there is a built-in option that you can press to automatically translate its content.

6. As a user, I want to be able to delete and edit the text I add, so that I can remove text I no longer find useful. (Must have 13)

   **Acceptance test:** After the creation of a post, you are able to edit/remove it by pressing the edit button under its content. If you leave the post completely empty, a warning will appear telling you that the post is getting removed. If you press the "OK" button the post will be removed, otherwise you will be able to keep editing it.

7. As a user, I would like to be able to sort all posts in the forum by a number of options, such as date, title, and others, so that I can search the site more efficiently. (Must have 3)

   **Acceptance test:** Inside the forum, the user has the ability to press a button to sort the posts by date, title and author in ascending or descending alphabetical order.

### Feature 4

1. As a user, I would like to receive a notice every time I spend more than usual so that I can take action against it. (Could have 8?)

   **Acceptance test:** From the main menu, you can press a button where you can write a budget limit. Every time you spend more than the limit established you will get a warning.

2. As a user, I'd like to have the ability to disable the built-in tips so I don't have to deal with them anymore. (Could have 2)

   **Acceptance test:** The built-in tips can be avoided by disabling them in the options menu.

### Feature 5

1. As a smoker, I'd like to have a tracker that shows me how much I've saved since quitting smoking so that I'm even more motivated. (Should have 5)

   **Acceptance test:** The app will track your expenses (as explained in other features) so that you know when you are spending/saving more than you did before.

### Feature 6

1. As a user, I want to be able to add a budget in some category so that I can guarantee I don't spend more money than usual. (Could have 5)

   **Acceptance test:** From the main menu, select the category menu and create a new one by pressing the "create" button. When the creation is finished you can establish a budget limit on that same category by editing it.

### Feature 7

1. As a new user of the app, I would like to be able to create a new account with my e-mail so that I can use the app. (Must have 40)

   **Acceptance test:** When you open the app for the first time, to have an account you need to register. Click the register button, enter your e-mail and the password you wish to use. After that you have an account. 

2. As a new user I would like to be able to log in with Google so I do not have to create a new account first. (Should have 13)

   **Acceptance test:** When you open the app for the first time you can register via Google. Click the google button and you will be redirected to Google login screen. After the login is done you can use the app.

3. As a user of the app, I would like to receive a warning every time someone tries to log in to the app and the password is wrong so I feel safer. (Should have 5)

   **Acceptance test:** The user receives a notification if someone is trying to acess their account.

4. As a new user, I would like to test the app without having to register so I can test the app and see if I like it. (Could have 20)

   **Acceptance test:** When you open the app for the first time you can press a button to skip all the register/login stuff. Without an account all your data will be lost if you unninstall the app.
