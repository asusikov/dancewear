Feature: Sections list

	Scenario: Show sections list on catalog page
		Given 5 sections exist
		When I go to the goods page
		Then I should see all sections

	Scenario: Show sections list on section page
		Given 4 sections exist
		And a section "Shoes" exist
		When I go to the section "Shoes" page
		Then I should see all sections