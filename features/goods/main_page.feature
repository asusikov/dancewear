Feature: Goods on main page
	
	Scenario: Show goods on main page
		Given 15 goods exist
		When I go to the home page
		Then only 4 last goods should be shown in carousel

	Scenario: Jump to good page by click title
		Given a good exists 
		When I go to the home page
		And I click by good in carousel
		Then I should be at the good page

	Scenario: Show good info
		Given a good exists
		When I go to the home page
		Then I should see title of good
		And I should see announcement of good
		And I should see price of good
		And I should see medium avatar of good