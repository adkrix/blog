Feature: Manage posts

  @javascript
  Scenario: Create posts
    Given I am on posts page

    When I follow "create new post"

    When I fill post form

    And I submit posts form
    Then I should be on posts page