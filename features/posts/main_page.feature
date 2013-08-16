Feature: Posts on main page
	
	Scenario: Show posts on main page
		Given 15 posts exist
		When I go to the home page
		Then only 8 last posts should be shown

	Scenario: Jump to post page by click title
		Given a post exists 
		When I go to the home page
		And I click by post title
		Then I should be at the post page