Feature: Posts on index page
	
	Scenario: Show posts on index page
		Given 20 posts exist
		When I go to the posts page
		Then only 10 last posts should be shown

	Scenario: Show posts by page
		Given 30 posts exist
		When I visit posts page number 2
		Then posts since 11 to 20 should be shown
		
	Scenario: Show pagination links
		Given 30 posts exist
		When I go to the posts page
		Then pagination links should be shown

	Scenario: Show info about post
		Given a post exists
		When I go to the posts page
		Then I should see title of post
		And I should see announcement of post
		And I should see avatar of post

	Scenario: Show default avatar
		Given a post exists with avatar: nil
		When I go to the posts page
		Then I should see default post's avatar

	Scenario: Show avatar
		Given a post exists
		When I go to the posts page
		Then I should see avatar of post

	Scenario Outline: Show link "details"
		Given a post exists with body: <body_text>
		When I go to the posts page
		Then I <visible> see details link
	Examples:
		| body_text   | visible    |  
		| ""          | should not |  
		| "body text" | should     |  

	Scenario: Jump to post page by click details
		Given a post exists 
		When I go to the posts page
		And click details link
		Then I should be at the post page

	Scenario: Jump to post page by click title
		Given a post exists 
		When I go to the posts page
		And I click by post title
		Then I should be at the post page

	Scenario Outline: Post page
		Given a post exists with body: <body_text>
		When I go to the post page
		Then I should see title of post
		And I should see <field> of post
	Examples:
		| body_text   | field        |  
		| ""          | announcement |  
		| "body_text" | body         |  
