Feature: Authorization in admin

	Scenario: Log in page
		When I go to the new user session page
		Then I should see log in form
		And I should see form elements for log in

	Scenario: Redirect after log in
		Given I am not authenticated
		And I go to the admin sections page
		When I log in
		Then I should be at the admin sections page

	Scenario: Redirect after log out
		Given I am a new, authenticated user
		When I log out
		Then I should be at the new user session page