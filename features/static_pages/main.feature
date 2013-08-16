Feature: Static pages
	
	Scenario: Show static page
		Given a static page exists with title: "contacts"
		When I go to the absolute path "/contacts"
		Then I should see body of static page