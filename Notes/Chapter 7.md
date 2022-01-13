# Chapter 7 Requirement: Behavior-Driven Design and User Stories

### 7.1 Behavior-Driven Design and User Stories

#### Behavior-Driven Design (BDD)

BDD asks questions about the behavior of an application before and during development so that the stakeholders are less likely to miscommunicate. Requirements are written down as in plan-and-document.

(Stakeholders include nearly everyone: customers, developers, managers, operators...)

the goal of BDD requirements is validation (build the right thing), not just verification (build the thing right)

#### user stories

The BDD version of requirements which describe how the application is expected to be used

It's a tool in Agile software development used to capture a description of a software feature from a user's perspective

```
Feature name
  As a [ kind of stakeholder ],
  So that [ I can achieve some goal ],
  I want to [ do some task ]
//All three clauses have to be present in the Connextra
format, but they do not have to be in this order.

```

The general guidelines for the user stories themselves is that they must be testable, be small enough to implement in one iteration, and have business value.

### 7.2 SMART User Stories 

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
Timeboxing means that you stop developing a story once youâ€™ve exceeded
the time budget. Either you give up, divide the user story into smaller ones, or reschedule what is left according to a new estimate. 
It's important because it is extremely easy to underestimate
the length of a software project.
```



### 7.3 Lo-Fi User Interface Sketches and Storyboards

#### lo-fi (low-fidelity) UI(sketch)

 using kindergarten tools for UI mockups: crayons, construction paper, and scissors

lo-fi doesn't show how the sketches work together as a user interacts with a page. That's what storyboards does

#### storyboarding

the storyboard for a UI is typically a tree or graph of screens driven by different user choices

Need to think about all user ineraction: Pages or sections of pages, Forms and buttons, and popupss

### 7.4 Points and Velocity 

One way to measure the productivity of a team would be simply to count the number of user stories completed per iteration, and then calculate the average.

But this measurement doesn't include the difficulty of the user story

The simple solution is to give each user story an integer number of points reflecting its perceived difficulty

(First, everyone on the team should be in rough agreement on how much a “point” is worth. Second, more points should represent not only more effort, but more uncertainty)

#### planning poker

During an Iteration Planning Meeting at the beginning of an iteration, the team first prioritizes the stories according to the stated desires of the customer (or the Product Owner speaking for the customer). Each story is discussed in turn: the Project Manager reads and reviews the story to ensure everyone understands what the story requires, then each team member places a card face-down marked with the number of points they think that story should be worth. 

#### spike

a short investigation into a technique or problem that the team wants explored before sitting down to do serious coding.

The spike’s purpose is to help you determine what approach you want to follow.

#### backlog

the collection of stories that have been prioritized and assigned points in this way, but have not yet been started in this iteration.

At the end of the iteration, the team computes the total number of points completed, rather than the number of stories. The moving average of this total is called the team’s **velocity**.

**The purpose of velocity is to give all stakeholders an idea how many iterations it will take a team to add the desired set of features, which helps set reasonable expectations and reduces chances of disappointment.**

#### burn down chart

It shows work to be done (points) on the vertical axis and time along the horizontal axis.

#### Tracker

Pivotal Tracker provides a service that helps prioritize and keep track of user stories and their status, calculates velocity, and predicts software development time based on the team’s history

### 7.5 Agile Cost Estimation 

Plan-and-document processes usually have a bid basis while Agile works on a time and materials basis

#### scoping

the client representatives bring whatever they think can clarify exactly what they want done, and the Agile team brings two engineers to the scoping.

an Agile team’s notion of “cost estimation” is therefore more about advising the client on what team size can provide the maximum efficiency

### 7.6 Cucumber: From User Stories to Acceptance Tests 

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

#### How does Cucumber match each step of a scenario with the correct step definitions? 

The trick is that Cucumber uses regular expressions or regexes (Chapter 2) to match the phrases in the scenario steps to the step definitions themselves.

```ruby
 Given /^(?:| I ) am on (.+) $ /
```

#### Capybara

A tool in rails that will act as a user and pretend to use the feature under different scenarios.

### 7.8 Explicit vs. Implicit and Imperative vs. Declarative Scenarios 

#### explicit requirement

user stories developed by the stakeholders. They typically correspond to acceptance tests

#### implicit requirement

Implicit requirements are the logical consequence of explicit requirements, and typically correspond to what Chapter 1 calls integration tests.

#### Imperative Scenario

specifying a logical sequence of user actions. specifying a logical sequence of user actions

useful in ensuring that the details of the UI match the customer’s expectations, it quickly becomes tedious and non-DRY to write most scenarios this way.

#### Declarative Scenario

```ruby
Feature : movies should appear in alphabetical order , not added order

 Scenario : view movie list after adding movie ( declarative and DRY )

 Given I have added " Zorro " with rating "PG -13 "
 And I have added " Apocalypse Now " with rating "R"
 Then I should see " Apocalypse Now " before " Zorro " on the RottenPotatoes
home page sorted by title
#use domain language
```



### 7.9 The Plan-And-Document Perspective on Documentation 

#### 1.Requirements Elicitation

The first is interviewing, where stakeholders answer predefined questions or just have informal discussions.

Another technique is to cooperatively create scenarios, which can start with an initial assumption of the state of the system, show the flow of the system for a happy case and a sad case, list what else is going on in the system, and then the state of the system at the end of the scenario.

A third technique is to create use cases, which are lists of steps between a person and a system to achieve a goal

#### 2.Requirements Documentation

Document requirement via Software Requirement Specification(SRS)

Validity: all requirement necessary

Consistency: do requirement conflict

Completeness: all requirement and constraints included

Feasibility: can requirement be implemented 

#### 3.Cost Estimation

Decompose SRS into tasks

Estimate weeks per tasks

Convert into $

Estimate before&after contract

 COCOMO formula:

![image-20211109100006359](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211109100006359.png)

#### 4.Scheduling and Monitoring Progress

![image-20211109093945666](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211109093945666.png)

#### 5.Change Management for Requirements, Cost, and Schedule

As stated many times in this book, customers are likely to ask for changes to the requirements as the project evolves for many reasons, including a better understanding of what is wanted after trying a prototype, changing market conditions for the project, and so on. The challenge for the project manager is keeping the requirements documents, the schedule, and cost predictions up-to-date as the project changes. 

![image-20211109094430735](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211109094430735.png)

#### 6.Ensuring Implementation Matches Requirement Features

requirement traceability: The relationship between features in requirements and what is implemented

Tools that implement traceability essentially offer cross-references between a portion of the design, the portion of the code that implements the feature, code reviews that checked it, and the tests that validate it.

If there is both a high-level SRS and a detailed SRS, forward traceability refers to the traditional path from requirements to implementation, while backwards traceability is the mapping from a detailed requirement back to a high-level requirement.

#### 7.Risk Analysis and Management



### 7.10 Fallacies and Pitfalls

### 7.11 Concluding Remarks: Pros and Cons of BDD 