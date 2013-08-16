Feature: Posts in admin part

	Scenario Outline: Denied access for unauthorized user
		Given I am not authenticated
		And a post exists
		When I go to the <page> page
		Then I should see log in form
	Examples:
		| page |
		| admin posts |
		| admin post |
		| edit admin post |

	Scenario: Show posts on post index page
		Given I am a new, authenticated user
		And 20 posts exist
		When I go to the admin posts page
		Then only 10 last posts should be shown in table

	Scenario: Show posts by page
		Given I am a new, authenticated user
		And 30 posts exist
		When I visit admin posts page number 2
		Then posts since 11 to 20 should be shown in table

	Scenario: Show pagination links
		Given I am a new, authenticated user
		And 30 posts exist
		When I go to the admin posts page
		Then pagination links should be shown

	Scenario: Jump to post page
		Given I am a new, authenticated user
		And a post exists
		When I go to the admin posts page
		And I click by post title
		Then I should be at the admin post page

	Scenario: Show info of post
		Given I am a new, authenticated user
		And a post exists
		When I go to the admin post page
		Then I should see full info of post

	Scenario: Jump to new post page
		Given I am a new, authenticated user
		And 3 posts exist
		When I go to the admin posts page
		And I click by new button
		Then I should be at the new admin post page

	Scenario Outline: Jump to edit post page
		Given I am a new, authenticated user
		And a post exist
		When I go to the admin <page> page
		And I click by edit post button
		Then I should be at the edit admin post page
	Examples:
		| page  |  
		| posts |  
		| post  |  

	Scenario Outline: Destroy post
		Given I am a new, authenticated user
		And a post exist
		When I go to the admin <page> page
		And I click by destroy post button
		Then 0 posts should exist
		And I should be at the admin posts page
		And I should see success flash message
	Examples:
		| page  |  
		| posts |  
		| post  |  
