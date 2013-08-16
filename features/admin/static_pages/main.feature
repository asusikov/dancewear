Feature: Static pages in admin part

	Scenario Outline: Denied access for unauthorized user
		Given I am not authenticated
		And a static page exists
		When I go to the <page> page
		Then I should see log in form
	Examples:
		| page                   |
		| admin static pages     |
		| admin static page      |
		| edit admin static page |

	Scenario: Show static pages on section index page
		Given I am a new, authenticated user
		And 3 static pages exist
		When I go to the admin static pages page
		Then all static pages should be shown in table

	Scenario: Jump to static page
		Given I am a new, authenticated user
		And a static page exists
		When I go to the admin static pages page
		And I click by static page title
		Then I should be at the admin static page page

	Scenario: Show info of static page
		Given I am a new, authenticated user
		And a static page exists
		When I go to the admin static page page
		Then I should see body of static page

	Scenario Outline: Jump to edit static page
		Given I am a new, authenticated user
		And a static page exist
		When I go to the admin <page> page
		And I click by edit static_page button
		Then I should be at the edit admin static page page
	Examples:
		| page         |  
		| static pages |  
		| static page  |  

	Scenario: Form for edit static page
		Given I am a new, authenticated user
		And a static page exist
		When I go to the edit admin static page page	
		Then I should see input fields for edit info of static page
		And I should see info of static page in fields

	Scenario: Edit static page
		Given I am a new, authenticated user
		And a static page exist
		When I go to the edit admin static page page
		And I input "Text body" in body of static page
		And I click save button
		And body of static page should be equaled "Text body"
		And I should be at the admin static page page
		And I should see success flash message

	Scenario: Jump to static page page from editing exists static page
		Given I am a new, authenticated user
		And a static page exist
		When I go to the edit admin static page page
		And I click back button
		Then I should be at the admin static page page