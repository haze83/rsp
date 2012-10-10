Feature: Show Navigation
  As a visitor to the website
  I want to see saved pages listed on the homepage
  so I can see what pages are available to browse

    Background:
      Given I am not logged in

    Scenario Outline: Viewing navigations
      When I go to the home page
      Then I should see a list of saved navigations

    Scenario Outline: Viewing navigation content
      Given the following navigation exists:
        | name		|
        | Candles	|
      When I follow <name>
      Then I should see the content of <name>

    Examples:
      | name    |
      | Candles |
      | Gifts |