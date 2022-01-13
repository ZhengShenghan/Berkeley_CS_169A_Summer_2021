# Cucumber

## Scenario Outline

The `Scenario Outline` keyword can be used to run the same `Scenario` multiple times, with different combinations of values.

The keyword `Scenario Template` is a synonym of the keyword `Scenario Outline`.

```
Scenario: eat 5 out of 12
  Given there are 12 cucumbers
  When I eat 5 cucumbers
  Then I should have 7 cucumbers

Scenario: eat 5 out of 20
  Given there are 20 cucumbers
  When I eat 5 cucumbers
  Then I should have 15 cucumbers
  
# combine them together
Scenario Outline: eating
  Given there are <start> cucumbers
  When I eat <eat> cucumbers
  Then I should have <left> cucumbers

  Examples:
    | start | eat | left |
    |    12 |   5 |    7 |
    |    20 |   5 |   15 |
```



## Feature

The purpose of the `Feature` keyword is to provide a high-level description of a software feature, and to group related scenarios.

The first primary keyword in a Gherkin document must always be `Feature`, followed by a `:` and a short text that describes the feature.

You can add free-form text underneath `Feature` to add more description.

These description lines are ignored by Cucumber at runtime, but are available for reporting (they are included by reporting tools like the official HTML formatter).

```cucumber
Feature: Guess the word

  The word guess game is a turn-based game for two players.
  The Maker makes a word for the Breaker to guess. The game
  is over when the Breaker guesses the Maker's word.

  Example: Maker starts a game
```

## Given

`Given` steps are used to describe the initial context of the system - the *scene* of the scenario. It is typically something that happened in the *past*.

When Cucumber executes a `Given` step, it will configure the system to be in a well-defined state, such as creating and configuring objects or adding data to a test database.

The purpose of `Given` steps is to **put the system in a known state** before the user (or external system) starts interacting with the system (in the `When` steps). Avoid talking about user interaction in `Given`’s. If you were creating use cases, `Given`’s would be your preconditions.

It’s okay to have several `Given` steps (use `And` or `But` for number 2 and upwards to make it more readable).

## When

`When` steps are used to describe an event, or an *action*. This can be a person interacting with the system, or it can be an event triggered by another system.

It’s strongly recommended you only have a single `When` step per Scenario. If you feel compelled to add more, it’s usually a sign that you should split the scenario up into multiple scenarios.

## Then

`Then` steps are used to describe an *expected* outcome, or result.

The step definition of a `Then` step should use an *assertion* to compare the *actual* outcome (what the system actually does) to the *expected* outcome (what the step says the system is supposed to do).

An outcome *should* be on an **observable** output. That is, something that comes *out* of the system (report, user interface, message), and not a behaviour deeply buried inside the system (like a record in a database).



```
Feature: Visit career guide page in career.guru99.com
Scenario: Visit career.guru99.com
Given: I am on career.guru99.com
When: I click on career guide menu
Then: I should see career guide page
```





```
Feature: display list of movies filtered by MPAA rating

  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

Background: movies have been added to database

  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  And  I am on the RottenPotatoes home page
  Then 10 seed movies should exist

Scenario: restrict to movies with "PG" or "R" ratings
  And I check the "PG" checkbox
  Then complete the rest of of this scenario
  # enter step(s) to check the "PG" and "R" checkboxes
  #When I check the following ratings: PG, R
  # enter step(s) to uncheck all other checkboxes
  #When I uncheck the following ratings: G, NC-17, PG-13
  # enter step to "submit" the search form on the homepage
  #And I press "Refresh" button
  # enter step(s) to ensure that PG and R movies are visible
  #Then I should see 5 movies
    #And I should see 'The Terminator'
    #And I should see 'When Harry Met Sally'
    #And I should see 'Amelie'
    #And I should see 'The Incredibles'
    #And I should see 'Raiders of the Lost Ark'
  # enter step(s) to ensure that other movies are not visible
    #And I should not see 'Aladdin'
    #And I should not see 'The Help'
    #And I should not see 'Chocolat'
    #And I should not see '2001: A Space Odyssey'
    #And I should not see 'Chicken Run'

Scenario: all ratings selected
  # your steps here
  #When I check the following ratings: G, PG, PG-13, NC-17, R
  #And I press "Refresh" button
  #Then I should see all the movies
  Then complete the rest of of this scenario
```

```
# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(title: movie[:title], rating: movie[:rating], release_date: movie[:release_date])
  end
  #pending "Fill in this step in movie_steps.rb"
end

Then /(.*) seed movies should exist/ do | n_seeds |
  expect(Movie.count).to eq n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(/[\s\S]*#{e1}[\s\S]*#{e2}/).to match(page.body)
  #pending "Fill in this step in movie_steps.rb"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  ratings = rating_list.split(', ')
  ratings.each do |rating|
      uncheck ? uncheck("ratings[#{rating}]") : (check("ratings[#{rating}]"))
      
  #pending "Fill in this step in movie_steps.rb"
end

# Part 2, Step 3
Then /^I should (not )?see the following movies: (.*)$/ do |no, movie_list|
  # Take a look at web_steps.rb Then /^(?:|I )should see "([^"]*)"$/
  pending "Fill in this step in movie_steps.rb"
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  pending "Fill in this step in movie_steps.rb"
end

### Utility Steps Just for this assignment.

Then /^debug$/ do
  # Use this to write "Then debug" in your scenario to open a console.
   require "byebug"; byebug
  1 # intentionally force debugger context in this method
end

Then /^debug javascript$/ do
  # Use this to write "Then debug" in your scenario to open a JS console
  page.driver.debugger
  1
end


Then /complete the rest of of this scenario/ do
  # This shows you what a basic cucumber scenario looks like.
  # You should leave this block inside movie_steps, but replace
  # the line in your scenarios with the appropriate steps.
  fail "Remove this step from your .feature files"
end

```

