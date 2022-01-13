# Quiz 4

## SUT(system under test,TDD)

refers to the object being tested. The object could be a single method, group of methods, entire class etc

A test suite refers to a collection of test cases where each test case checks a specific behavior of a SUT

| property of SUT                                     | How To Test                                                  |
| --------------------------------------------------- | ------------------------------------------------------------ |
| pure leaf function                                  | Assert correct output for critical values                    |
| relies on result of collaborator methods or objects | In Arrange phase, create doubles that “force” the desired behavior by returning prearranged values |
| nondeterministic behavior                           | In Arrange state, isolate the nondeterminism in a method call that can be stubbed using a double |
| side effect                                         | In Arrange state, observe the relevant state; In Assert state, observe it again and check for side effect |

Test doubles are set up in the Arrange phase of a test case. Stubs are set up to control the return values from collaborator methods, while mocks are set up to mimic just those behaviors of the collaborator object used by the SUT

#### Arrange

create any necessary preconditions for the test case, such as setting values of variables that affect the behavior of the SUT

#### Act

#### Assert

verify that the result or behavior matches what was expected

```
describe '' do
	before '' do
		...(Arrange)
		@book = BookInStock.new('isbn1',11)
	end
	it '' do
		@book.isbn = 'isbn2'(Act)
		expect().to eq()(Assertion)
	end
	
```



## TDD

TDD ensures that the product, system or process is being built correctly. It tests independent small units or objects to make sure each works as intended.

#### Red–Green–Refactor

1. Before you write any code, write a test for one aspect of the behavior you expect the new code will have.
2. Red step: Run the test, and verify that it fails because you haven’t yet implemented the code necessary to make it pass
3. Green step: Write the simplest possible code that causes this test to pass without breaking any existing tests
4. Refactor step: Look for opportunities to refactor either your code or your tests

#### Rspec

**Describe** block used to group together a suite of related test cases.

**Context** block used to group together tests cases within a describe block that share the same state.

**It** block used to specify a single test case.

**Before** block is used to set up necessary pre-conditions.

```
#Set up 3A test for controller method
class MoviesController < ApplicationController
	def review_movie
	search_string = params[:search] 
	begin
		...
	end
	rescue Movie::ConnectionError => err
		redirect_to review_movie_path, :alert => "Error contacting TMDb: #{err.message}"
	end
	end
end

```



#### Factory

a **factory** is an object for creating other objects – formally a factory is a function or method that returns objects of a varying prototype or class from some method call, which is assumed to be "new".

quickly create valid instances of a class using some default attributes that you can selectively override for testing(you can choose your own attribute, set attribute only you care about. after test, it gets blown away so the test doesn't get polluted)

it's stored in spec / factories / movie. rb

Pros: can keep independent

Cons: complex relation may be hard to setup

```ruby
#spec/factories/movie.rb
FactoryBot.define do
	factory :movie do
		title 'Venom' #defalut value
		rating 'PG'
		release_date{...}
    end
end
#spec/models/movie_spec.rb
describe Movie do
    it '' do
        movie = FactoryBot.build(:movie, :title => '',:rating => '')
        expect(movie.name_with_rating).to eq ''
    end
end
```



#### Fixtures

a set of objects whose existence is guaranteed and fixed, and can be assumed by all test cases

a fixture file defines a set of objects that is **automatically loaded** into the test database before tests are run, so you can use those objects in your tests without first setting them up

every test now depends implicitly on the fixture state, so changing the fixtures might change the behavior of tests

Usually test for static data

It's stored in spec/fixtures/movies.yml

Pros: easy to see test data in one place. Truly static data or rarely change

Cons: may introduce dependency(ex: number of objects)

```ruby
#spec/fixtures/movie.yml
venom_movie:
	id:1
	title: Venom
	rating:
	release_date:
spider_movie:
...
#spec/models/movie_spec.rb
require 'rails_helper.rb'
describe Movei do
	fixture:movies
	it '' do
		movie = movies(:venom_movie)
		expect(movie.name_with_rating).to eq('')
	end
end
```

#### Seam(include mock and stubs)

a place where you can alter behavior in your program without editing in that place

For example, for a stub, it can replace a real method of a class with the stubbed method

Seams are useful in testing because they let us break dependencies between a piece of code we want to test and its collaborators

#### Doubles(include mock, stubs and other seams)

Double is a more general term than mock and stub. A double can be a mock, a stub, or other seams

`double` is only useful for dealing with instances of the class, not the class itself

!!!!! RSpec doubles can be used to override any method calls on any ruby object in a test

```ruby
  thing = double("thing", :a => "A")
  thing.a == "A" => true

  person = double("thing", :name => "Joe", :email => "joe@domain.com")
  person.name => "Joe"
```

a **test double** allows you to test your code even when it relies on a class that is undefined or unavailable

```ruby
class ClassRoom 
   def initialize(students) 
      @students = students 
   end
   
   def list_student_names 
      @students.map(&:name).join(',') 
   end 
end

describe ClassRoom do 
   it 'the list_student_names method should work correctly' do 
      student1 = double('student') 
      student2 = double('student') 
      
      allow(student1).to receive(:name) { 'John Smith'} 
      allow(student2).to receive(:name) { 'Jill Smith'} 
   #the allow() method provides the method stubs that we need to test the ClassRoom class. 
       #expect()to receive:
       #It exploits Ruby's open classes and metaprogramming to create a seam
	   #It would override the real method, even if it did exist
	   #It can provide a stand-in for a real method that doesn't exist yet
      #allow()to receive is only a seam
      cr = ClassRoom.new [student1,student2]
      expect(cr.list_student_names).to eq('John Smith,Jill Smith') 
   end 
end
#list_student_names method calls the name method on each Student object in its @students member variable. So we need Double which implements a name method
#It's also helpful for debugging. Since if we only define a 'dummy' class which behaves like student. Then if the test fails, we know that our ClassRoom is wrong
```

If the double is created afterwards, we can Keep the `expect()...to_receive` seam in the spec, but if necessary, change the spec to match the API of the real `object`

#### Mock

A mock object or simply mock is a simplified “stunt double” of an object that can only mimic a few fixed behaviors of the object, such as returning fixed values for specific attributes.

#### Stub

it’s a special type of method that “stands in” for an existing method, or for a method that doesn’t even exist yet.

```ruby
# create a double
obj = double()

# stub a method
obj.stub(:message) # returns obj

# specify a return value
obj.stub(:message) { 'this is the value to return' }
```

#### stub external service

1. prevent abuse of service terms
2. making real calls prevent the test from being Repeatable depending on how the remote service responds, and would almost certainly prevent the test from being Fast

To create Fast and Repeatable test cases for code that communicates with an external service, we use stubs to mimic the service’s behavior.

### Testing Approaches 

#### Mutation Test

a test-automation technique in which small but syntactically legal changes are automatically made to the program’s source code.

such as replacing a+b with a-b or replacing if (c) with if (!c). Most such changes should cause at least one test to fail, so a mutation that causes no test to fail indicates either a lack of test coverage or a very strange program

#### Black Box Test

It is based solely on the software’s external specifications

#### White Box Test

Its design reflects knowledge about the software’s implementation that is not implied by external specifications

A black-box test would specify a random set of key/value pairs to test this behavior, whereas a white-box test might exploit knowledge about the hash function to construct worst case test data that results in many hash collisions.

#### Fuzz Test

It consists of throwing random data at your application and seeing what breaks

#### Compatibility test

for testing the app’s UI in different browsers

#### Regression test

It ensures that previously-fixed bugs do not reappear. It avoids breaking old features when developing new ones.

#### Smoke test

It consists of a minimal attempt to operate the software, to see whether anything is obviously wrong before running the rest of the test suite.

#### 4 level test

##### unit test

During this first round of testing, the program is submitted to assessments that focus on specific units or components of the software to determine whether each one is fully functional. In this phase, **a unit can refer to a function, individual program or even a procedure**

##### integration test

Integration testing allows individuals the opportunity to combine all of the units within a program and test them as a group. This testing level is designed to **find interface defects between the modules/functions**.(Find how they cooperate with each other)

##### system test

System testing is the first level in which **the complete application is tested as a whole**. The goal at this level is to evaluate whether the system has complied with all of the outlined requirements and to see that it meets Quality Standards.

##### acceptance test

The final level, Acceptance testing (or User Acceptance Testing), is conducted to **determine whether the system is ready for release**. 

#### FIRST

Fast: should be fast to run a subset of testcase

Independent: the order of the test doesn't matter

Repeatable: test shouldn't be dependable on external factors(like date, temperature)

Self-checking: each test should be able to determine on its own whether it passed or failed, rather than relying on humans to check its output

Timely: tests should be created or updated at the same time as the code being tested

#### Code Coverage

a software testing metric that determines the number of lines of code that is successfully validated under a test procedure

S0 or Method coverage: Is every method executed at least once by the test suite?

S1 or Call coverage or Entry/Exit coverage: Has each method been called from every place it could be called?

C0 or Statement coverage: Is every statement of the source code executed at least once by the test suite.(We need to go to every if , but don't need to go into each one of them)

C1 or Branch coverage: Has each branch been taken in each direction at least once?(need to go into each statement)

C2 or Path coverage: Has every possible route through the code been executed?(go through every possibility of inputs)

**Modified Condition/Decision Coverage** (MCDC) combines a subset of above

## BDD

#### Behavior-Driven Design (BDD)

BDD asks questions about the behavior of an application before and during development so that the stakeholders are less likely to miscommunicate. Requirements are written down as in plan-and-document.

(Stakeholders include nearly everyone: customers, developers, managers, operators...)

the goal of BDD requirements is validation (build the right thing), not just verification (build the thing right)

BDD ensures the correct product, system or process is being built by writing specifications or examples that describe the behavior expected.

#### user story

The BDD version of requirements which describe how the application is expected to be used

It captures app behavior, user needs, and expected usage of the app

Written as a couple sentences on 3x5 index cards

It's a tool in Agile software development used to capture a description of a software feature from a user's perspective

```
Feature name
  As a [ kind of stakeholder ],
  So that [ I can achieve some goal ],
  I want to [ do some task ]
//All three clauses have to be present in the Connextra
format, but they do not have to be in this order.
Feature: Home Page
  In order to test Home Page of application
  As a Registered user
  I want to specify the features of home page

  Scenario: Home Page Default content
    Given user is on Github home page
    Then user gets a GitHub bootcamp section
    And username is also displayed on right corner
```

The general guidelines for the user stories themselves is that they must be testable, be small enough to implement in one iteration, and have business value.

#### SMART user story

Specific, Measurable, Achievable, Relevant, and Timeboxed.

```
Feature : User can search for a movie ( vague )
Feature : User can search for a movie by title ( specific )

Feature : RottenPotatoes should have good response time ( unmeasurable )
Feature : When adding a movie , 99% of Add Movie pages
should appear within 3 seconds ( measurable )

#Achievable
If you are
getting less than one story per iteration, then they are too big and you need to subdivide these stories into smaller ones

#Relevant
Ask whys to drill down real bussiness value
make sure the business value is now apparent to at least one stakeholder

#timeboxed
Timeboxing means that you stop developing a story once you've exceeded
the time budget. Either you give up, divide the user story into smaller ones, or reschedule what is left according to a new estimate. 
```

#### Five Whys

a technique to help you drill down to uncover the real business relevance of a user story

1. Why add the Facebook feature?
2. Why does it matter if they enjoy the show more?
3. Why do you want to sell more tickets?
4. Why does the theater want to make more money?
5. Why does it matter that the theater is in business next year?

### Points and Velocity

One way to measure the productivity of a team would be simply to count the number of user stories completed per iteration, and then calculate the average.

(First, everyone on the team should be in rough agreement on how much a “point” is worth. Second, more points should represent not only more effort, but more uncertainty)

#### planning poker

During an Iteration Planning Meeting at the beginning of an iteration, the team first prioritizes the stories according to the stated desires of the customer

#### Spike

a short investigation into a technique or problem that the team wants explored before sitting down to do serious coding.

#### backlog

the collection of stories that have been prioritized and assigned points in this way, but have not yet been started in this iteration.

#### burn down chart

It shows work to be done (points) on the vertical axis and time along the horizontal axis.

#### Tracker

Pivotal Tracker provides a service that helps prioritize and keep track of user stories and their status, calculates velocity, and predicts software development time based on the team’s history

### lo-fi (low-fidelity) UI(sketch)

lo-fi doesn't show how the sketches work together as a user interacts with a page. That's what storyboards does

#### storyboarding

the storyboard for a UI is typically a tree or graph of screens driven by different user choices

Need to think about all user ineraction: Pages or sections of pages, Forms and buttons, and popupss

### Cucumber

#### function

It turns customer-understandable user stories into acceptance tests, which ensure the customer is satisfied, and integration tests, which ensure that the interfaces between modules have consistent assumptions and communicate correctly. 

In cucumber, a user story  refers to a single feature with one or more scenarios that show different ways a feature is used 

#### Keyword

##### Feature

provide a high-level description of a software feature, and to group related scenarios

##### Given

describe the initial context of the system. The purpose is to put the system in a known state

##### When

used to describe an event, or an action

##### Then

used to describe an *expected* outcome, or result.

##### And But

If you have successive `Given`’s, `When`’s, or `Then`’s, you *could* write, you can write and, but instead

##### background section

```gherkin
Feature: Test Background Feature
Description: The purpose of this feature is to test the Background keyword

Background: User is Logged In
	Given I navigate to the login page
	When I submit username and password
	Then I should be logged in 

```



```gherkin
Feature: Guess the word

  # The first example has two steps
  Scenario: Maker starts a game
    When the Maker starts a game
    Then the Maker waits for a Breaker to join

  # The second example has three steps
  Scenario: Breaker joins a game
    Given the Maker has started a game with the word "silky"
    When the Breaker joins the Maker's game
    Then the Breaker must guess a word with 5 characters
```

#### How does Cucumber match each step of a scenario with the correct step definitions? 

The trick is that Cucumber uses regular expressions or regexes (Chapter 2) to match the phrases in the scenario steps to the step definitions themselves.

```ruby
 Given /^(?:| I ) am on (.+) $ /
```

#### Capybara

A tool in rails that will act as a user and pretend to use the feature under different scenarios.

#### Step Definition

```java
public class StepDefinitions {
    @Given("I have {int} cukes in my belly")
    public void i_have_n_cukes_in_my_belly(int cukes) {
        System.out.format("Cukes: %n\n", cukes);
    }
}
```

```
Given that an account with username “cs169student” and  
  password “pg&e” exists,
. . .	

# under step_definitions
Given /^(?:|that )an account with username “cs169student” and password “pg&e” exists$/ do
    User.create(:username => “cs169student”, :password => “pg&e”)
end

Given /^(?:|that )an account with username “([\S]+)” and password “([\S]+)” exists$/ do |user|, |pass| 
    User.create(:username => user, :password => pass) 

end

#pass a list of values or objects to a step
Given /^the following users exist:$/ do |table|
		table.hashes.each do |acct|
			User.create(. . .)
		end
end


```

#### xpath

Can filter out parts of returned page in HTML DOM by element type and/or CSS attributes/identifiers

#### Data Table in Cucumber

EX:

```
| Fields                 | Values              |
| First Name             | Tom                 |
| Last Name              | Kenny               |
```

```
Feature: Login Action
Scenario: Successful Login with Valid Credentials
	Given User is on Home Page
	When User Navigate to LogIn Page
	And User enters Credentials to LogIn
    | testuser_1 | Test@153 |
	Then Message displayed Login Successfully
```



### Software Maintenance

#### Comments and Commits

a good comment tells what's not obvious about the code. It's higher level abstraction than code. They tells what the code does but not how to do it

Comments should raise the level of abstraction from the code, describing what a logical block of code does rather than providing line-by-line details.

Commits should include historical information about why the code is the way it is, but information that developers need while using the current code belongs in comments. If this leads to too many comments, your code may need cleanup

#### refactoring

a process that changes the structure of code (hopefully improving it) without changing the code’s functionality

1. find places that need to make changes
2. add characterization tests that capture how the code works now, to establish a baseline “ground truth” before making any changes
3. Determine whether the change points require refactoring(make it more testable) 
4. Once the code around the change points is well factored and covered by tests, make the required changes

we are changing the structure of the code without affecting its functionality. By improving the structure of the code we increase maintainability, which is integral in the Agile lifecycle. Refactoring also makes the code more testable and accommodates for new changes such as breaking dependencies

#### Legacy Code

It is hardly understood code whose original designers are gone and many **patches** are added that aren’t explained by **design** 

Exploration > Characterization tests > refactoring and removing failing tests > write more tests to ensure that refactoring doesn't break current functionality

#### Code Exploration

It aims to understand how the code works from different points of view

inspect the code

look for change points in the source code

understand the customer's point of view

convert user stories into cucumber scenarios

read tests and cucumber scenarios

#### characterization tests

tests written after the fact that capture and describe the actual, current behavior of a piece of software, even if that behavior has bugs

are for baseline behavior & establishes ground truth about current app functionality

### Metrics, Code Smells, and SOFA 

SOFA：

Is the method short? (make it as short as possible)

Does it do one thing?

Does it has few arguments?

Is it a consistent level of abstraction?(a method should either say what is to be done or how to do it but not both)

Rails use reek to find code smell

#### Single level of Abstraction

Start with a high level summary of key points, then go into each point in detail

Boolean argument is yellow flag. We can divide one function into 2 if its behavior depends on Boolean argument value

#### ABC Complexity

2 ways to identify problems: quantitatively using software metrics and qualitatively using code smell

Most metrics are based on control flow graph. Each node represents a set of statements that are always executed together

Score = SquareRoot(A^2+B^2+C^2)

Ruby gem flog checks ABC complexity

#### Cyclomatic Complexity

#of linearly independent path through code = E - N + 2P(edges,nodes,connected components)

| Metric                            | Tool       | Target Score   |
| --------------------------------- | ---------- | -------------- |
| Code-To-Test Ratio                | rake stats | <=1:2          |
| C0 coverage                       | SimpleCov  | 90%+           |
| Assignment-Branch-Condition score | flog       | <20 per method |
| Cyclomatic Complexity             | saikuro    | 10 per method  |

| smell                                                        |                                            |
| ------------------------------------------------------------ | ------------------------------------------ |
| long method                                                  | Decompose condition                        |
| large class                                                  | extract class                              |
| long parameter clump(The same three or four data items seem to often be passed as arguments together or manipulated togethe) | replace parameter with method call         |
| inappropriate intimacy(Class A knows a lot of methods in Class B) | Move method field to collect related items |
|                                                              |                                            |
|                                                              |                                            |

## Appendix

Whenever the schema is modified through migration, rake db:test:prepare must be rerun otherwise test might fail.

Which statement(s) best reflect(s) how Agile Scrum-based teams would prioritize and deliver User Stories?

Anyone can mark a story Delivered, but only the Product Owner can mark it as Accepted or Rejected

After a customer meeting, how does an effective team prioritize working on the user stories that were discussed, especially if the amount of work may exceed what the team can handle during that iteration?

The product owner assumes the role of representing the customer's view, and prioritizes stories accordingly

### HTTP Methods for RESTful Services

| HTTP verb | CRUD           | Function                                                     | **Entire Collection**    |
| --------- | -------------- | ------------------------------------------------------------ | ------------------------ |
| POST      | Create         | it's used to create subordinate resources. POST to the parent and the service takes care of associating the new resource with the parent, assigning an ID | 201 (Created)            |
| GET       | Read           | to **read** (or retrieve) a representation of a resource     | 200 (OK)                 |
| PUT       | Update/Replace | most-often utilized for **update** capabilities              | 405 (Method Not Allowed) |
| PATCH     | Update/Modify  | used for **modify** capabilities. The PATCH request only needs to contain the changes to the resource | 405 (Method Not Allowed) |
| DELETE    | Delete         | It is used to **delete** a resource identified by a URI      | 405 (Method Not Allowed) |

### Status Code

2xx(all is well) 

3xx(resource moved) 

4xx(forbidden,not found:client error) 

5xx(server error)

### Module

Modules are somewhat similar to classes: they are things that hold methods, just like classes do. However, modules can not be instantiated. Thus, Module doesn't have method new 

```ruby
module Encryption
  def encrypt(string)
    Digest::SHA2.hexdigest(string)
  end
end

class Person
  include Encryption

  # ...

  def encrypted_password
    encrypt(@password)
  end
end

person = Person.new("Ada")
person.password = "super secret"
puts person.encrypted_password
```

### MVC

MVC means Model-View-Controller

MVC provides the Model, View, Controller pattern and it allows software developers to build a web application as a composition of three parts or components.

### HTML element

| Start tag | Element content                                              | End tag |
| --------- | ------------------------------------------------------------ | ------- |
| <h1>      | My First Heading                                             | </h1>   |
| <p>       | My first paragraph.                                          | </p>    |
| <br>      | none                                                         | </br>   |
|           | Nested HTML element(below element can contain other tags)    |         |
| <html>    | root element and it defines the whole HTML document(it contains <body> tag) | </html> |
| <body>    | defines the document's body(it contains <h1> and <p>)        | </body> |
|           |                                                              |         |
|           |                                                              |         |

### Semantic HTML

use the most appropriate HTML element type tag

<article>
<aside>
<details>


- <figcaption>

- <figure>

- <footer>

- <header>

- <main>

- <mark>

- <nav>

- <section>

- <summary>

- <time>

| <header>                                                     |
| ------------------------------------------------------------ |
| <section>                                                       <article> |
| <footer>                                                     |

### ARIA( Accessibility Initiative/Accessible Rich Internet Application)

further improve accessibility

In ARIA, every HTML element has a role and label

### CSS

Cascading Style Sheets ( CSS) is a style sheet language used for describing the presentation of a document written in a markup language such as HTML.

So, with CSS we can have multiple styles of a page with only one HTML document

#### CSS Selector

if you want all <p> elements will be center-aligned, with a red text color:

```css
p {
  color: red;
  text-align: center;
}
```

```python
In this example p is a selector in CSS (it points to the HTML element you want to style: <p>).
color is a property, and red is the property value
text-align is a property, and center is the property value
```

Or you don't care about the tag, but you want any tag with id = "para1" to be assigned with a specific style

```css
#para1 {
  text-align: center;
  color: red;
}
```



```html
<!DOCTYPE html>
<html>
<head>
<style>
#para1 {
  text-align: center;
  color: red;
}
</style>
</head>
<body>

<p id="para1">Hello World!</p>
<p>This paragraph is not affected by the style.</p>
<p id="para1">stupid</p>
<div id="para1">ssssss</div>
</body>
</html>
```

in this example will have red and centered "Hello World!","stupid" and "ssssss"

#### CSS class Selector

```css
p.center {
  text-align: center;
  color: red;
}
```

```css
.center {
  text-align: center;
  color: red;
}
```

#### CSS group selector

```css
h1, h2, p {
  text-align: center;
  color: red;
}
```

### Unless

```ruby
unless conditional [then]
   code
[else
   code ]
end
```

Executes *code* if *conditional* is false. If the *conditional* is true, code specified in the else clause is executed.