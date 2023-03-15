## Requirements

### Nonfunctional requirements

1. The product should be developed with Flutter


## User Stories

### Feature 1

1. As a user, I want to add a new purchase to the app so I can review it later. (Must Have 5)

   **Acceptance test:**<br>
	Given that I am on the purchase screen,<br>
	When I submit a purchase,<br>
	Then the purchase will be registered, and I can review it later.

2. As a user, when I add a purchase, I want to add a category so I can see where I spent more money. (Must have 3)

   **Acceptance test:**<br>
	Given that I select a purchase category,<br>
	When I submit the purchase,<br>
	Then it will be registered on the database with a category.<br>

3. As a user, I want to be able to add purchases at the frequency I choose so I don't have to add them every time I make them. (Should have 8)

   **Acceptance test:**<br>
	Given that I select the option "multiple purchases",<br>
	When I choose a timeline for the purchases, a total amount spent and submit,<br>
	Then the purchase will be registered with those attributes.<br>

4. As a user who has made a mistake, I want to be able to cancel (and edit) an issue I've made so that I can correct my mistake. (Must have 20)

    **Acceptance test:**<br>
	Given that I select a previous purchase,<br>
	When I edit it, correcting a mistake,<br>
	Then the purchase will appear with the new information selected.<br>

5. As a user, I want to be able to add a description to my expenses so I can remember what I spent the money on. (Should have 3)

   **Acceptance test:**<br>
	Given that I fill in a description and submit a purchase,<br>
	When I select the purchase,<br>
	Then I will see its description.<br>

6. As a user, I want to be able to add a picture of the bill of the expense so that I can check all the information about the purchase. (Could have 3)

   **Acceptance test:**<br>
	Given that I submit a purchase with a picture,<br>
	When I select the purchase,<br>
	Then I will see the picture with all of the purchase's details.<br>

7. As a user, I'd like to add the price of a new purchase in many different currencies to the app so that the app does the coin conversion to my main currency so that I don't have to search for how much I spent in my currency. (Should have 2)

   **Acceptance test:**<br>
	Given that I choose a currency,<br>
	When I click "confirm",<br>
	Then all of my spendings will be in the selected currency.<br>

### Feature 2

1. As a user, I want to check how much I spent in each category last month so that I can spend more efficiently. (Must have 20)

   **Acceptance test:**<br>
	Given that I am in the history menu,<br>
	When I choose a category,<br>
	Then I will see the amount of money spent in that category in the last month.<br>

2. As a user, I like to check my spending by giving a start day and an end day so that I can see what times I spent more money. (Could have 20)

   **Acceptance test:**<br>
	Given that I am in the history menu,<br>
	When I choose a start date and an end date,<br>
	Then I will see the total amount spent across that time period and all of the purchases.<br>

3. As a user, I want to be able to add new expense categories so that I can customize my stats to my own liking. (Should have 5)

   **Acceptance test:**<br>
	Given that I am on the settings menu,<br>
	When I fill in a textbox and confirm,<br>
	Then I will get the option to choose that custom category in every purchase.<br>

### Feature 3

1. As a user, I would like to be able to ask a question in a forum organized by categories that users can create, so that other people can answer me and we can exchange ideas. (Should have 100)

   **Acceptance test:**<br>
	Given that I am on the main menu,<br>
	When I select the forum,<br>
	Then I will see posts by other users.<br>

2. As a user, I would like to have a forum organized by category so that I can check the topics that interest me the most. (Must have 5)

   **Acceptance test:**<br>
	Given that I am on the forum,<br>
	When I select a predefined category,<br>
	Then all the posts on the forum will be in that category.<br>

3. As a user, I want to be able to search the forum for the topics that interest me so that I can make my search more efficient. (Must have 20)

   **Acceptance test:**<br>
	Given that I select the search option,<br>
	When I write a text in the searchbox and confirm,<br>
	Then the posts that show up will have that text in their title.<br>

4. As a user, I'd like to be able to write my text in different languages so that I can contribute to the forum even if I don't speak English. (Must have 1)

   **Acceptance test:**<br>
	Given that the user is in the forum menu,<br>
	When they write a post,<br>
	Then an error will never be thrown, so that they can write in any language.<br>

5. As a user, I want to have a quick translator for other users' texts so that I can understand what the user is trying to say. (Should have 8)

   **Acceptance test:**<br>
	Given a post written in some language,<br>
	When the user doesn't understand that language,<br>
	Then they can click on the button below the post to translate it.<br>

6. As a user, I want to be able to delete and edit the text I add, so that I can remove text I no longer find useful. (Must have 13)

   **Acceptance test:**<br>
	Given that the user wants to edit some post,<br>
	When they made a mistake or want to delete it,<br>
	Then they can edit the post by pressing the edit button.<br>

7. As a user, I would like to be able to sort all posts in the forum by a number of options, such as date, title, and others, so that I can search the site more efficiently. (Must have 3)

   **Acceptance test:**<br>
	Given that the user is in the forum,<br>
	When they choose to sort by date,<br>
	Then the posts will be sorted such that the most recent show up first.<br>
	
   **Acceptance test:**<br>
	Given that the user is in the forum,<br>
	When they choose to sort by title (ascending or descending),<br>
	Then the posts will be sorted alphabetically (ascending or descending).<br>

### Feature 4

1. As a user, I would like to receive a notice every time I spend more than usual so that I can take action against it. (Could have 8?)

   **Acceptance test:**<br>
	Given that the user has a budget,<br>
	When the user spends more than that,<br>
	Then they will be notified.<br>

2. As a user, I'd like to have the ability to disable the built-in tips so I don't have to deal with them anymore. (Could have 2)

   **Acceptance test:**<br>
	Given that the user disables the tips,<br>
	When they are browsing the app,<br>
	Then they won't get annoyed by them.<br>

### Feature 5

1. As a smoker, I'd like to have a tracker that shows me how much I've saved since quitting smoking so that I'm even more motivated. (Should have 5)

   **Acceptance test:**<br>
	Given that the app stores all the purchases,<br>
	When I create a new one,<br>
	Then the app can keep a record of the user expenses giving the user the ability to see if they are spending less than usual.<br>

### Feature 6

1. As a user, I want to be able to add a budget in some category so that I can guarantee I don't spend more money than usual. (Could have 5)

   **Acceptance test:**<br>
	Given that the user wants to have a budget in some category,<br>
	When the user is trying to spend less money than usual on that category,<br>
	Then the user can press a button in the desired category and insert a budget limit.<br>

### Feature 7

1. As a new user of the app, I would like to be able to create a new account with my e-mail so that I can use the app. (Must have 40)

   **Acceptance test:** <br>
	Given that the user chooses the option register,<br>
	When they enter their email and password,<br>
	Then their information will be stored and they can read the app.<br>

2. As a new user I would like to be able to log in with Google so I do not have to create a new account first. (Should have 13)

   **Acceptance test:** <br>
	Given that the user chooses the option "Sign in with Google",<br>
	When they enter their email and password in a Google dedicated window,<br>
	Then their information will be stored and they can read the app.<br>

3. As a user of the app, I would like to receive a warning every time someone tries to log in to the app and the password is wrong so I feel safer. (Should have 5)

   **Acceptance test:** <br>
	Given that someone fill in the wrong password,<br>
	When they fail 3 times,<br>
	Then the user will receive a warning by email telling them that someone is trying to access their account.<br>

4. As a new user, I would like to test the app without having to register so I can test the app and see if I like it. (Could have 20)

   **Acceptance test:**<br>
	Given that the user doesn't want to register,<br>
	When they open the app,<br>
	Then they choose an option to continue without having to login/register and their information will be kept locally.<br>
   
   
   
## Domain Model


   ![tmp](https://user-images.githubusercontent.com/114567030/224747169-f467383d-1fa3-4311-b04e-70bdbb635e27.png)

## UI Mockups

  ![New Wireframe 1](https://user-images.githubusercontent.com/114567030/224743640-e12daf0e-956d-42dc-b890-b8837bd37aae.png)
  
  
  ![New Wireframe 2](https://user-images.githubusercontent.com/114567030/224743740-71f5ff52-50a0-459d-be6b-4ee96b4ae425.png)
  
  
  ![New Wireframe 3](https://user-images.githubusercontent.com/114567030/224747718-c2dc7386-5711-445d-8a20-db0036d3e9e8.png)



