## Requirements

### Nonfunctional requirements

1. The product should be developed with Flutter

## User Stories

### Feature 1

1. As a user, I want to add a new purchase to the app so I can review it later. (Must Have 5)

   **Acceptance test:** From the main page, I can press a button to take me to the purchase screen, where I can declare a purchase, adding an amount that I spent in a text box and clicking "submit".

2. As a user, when I add a purchase, I want to add a category so I can see where I spent more money. (Must have 3)

   **Acceptance test:** From the purchase screen, I can press a button to bring up a category menu, and press one of the category options: "food", "fashion"...

3. As a user, I want to be able to add purchases at the frequency I choose so I don't have to add them every time I make them. (Should have 8)

   **Acceptance test:** From the purchase menu, I can press a button to choose "multiple purchases", add a timeline of when the purchases were made and a total amount spent.

4. As a user who has made a mistake, I want to be able to cancel (and edit) an issue I've made so that I can correct my mistake. (Must have 20)

   **Acceptance test:** From the main menu, I can press a button to access the edit menu, where I can delete or edit purchases - there will be a text box with the price of the purchase which I can edit, writing the right amount, a menu with the categories, where you can choose the right one, the selected date and a text box to edit it.

5. As a user, I want to be able to add a description to my expenses so I can remember what I spent the money on. (Should have 3)

   **Acceptance test:** From the purchase screen, I can click a text box to write a customized description of the expense.
 
   **Acceptance test:** From the history menu, I can click each purchase to check its description.

6. As a user, I want to be able to add a picture of the bill of the expense so that I can check all the information about the purchase. (Could have 3)

   **Acceptance test:** From the purchase screen, I can press a button to add a photo.

7. As a user, I'd like to add the price of a new purchase in many different currencies to the app so that the app does the coin conversion to my main currency so that I don't have to search for how much I spent in my currency. (Should have 2)

   **Acceptance test:** From the purchase screen, I can press a button to open a currency menu, and click on the currency that I want - "Euro, US dollar, Sterling"

### Feature 2

1. As a user, I want to check how much I spent in each category last month so that I can spend more efficiently. (Must have 20)

   **Acceptance test:** From the main menu, I can press the history button to open the history menu, which shows a graph with all my spendings in each category in the current month.

2. As a user, I like to check my spending by giving a start day and an end day so that I can see what times I spent more money. (Could have 20)

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
   
   
   
## Domain Model


   ![tmp](https://user-images.githubusercontent.com/114567030/224747169-f467383d-1fa3-4311-b04e-70bdbb635e27.png)

## UI Mockups

  ![New Wireframe 1](https://user-images.githubusercontent.com/114567030/224743640-e12daf0e-956d-42dc-b890-b8837bd37aae.png)
  
  
  ![New Wireframe 2](https://user-images.githubusercontent.com/114567030/224743740-71f5ff52-50a0-459d-be6b-4ee96b4ae425.png)
  
  
  ![New Wireframe 3](https://user-images.githubusercontent.com/114567030/224747718-c2dc7386-5711-445d-8a20-db0036d3e9e8.png)



