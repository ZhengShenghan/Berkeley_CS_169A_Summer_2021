# Chapter 1

Main Goal :The big concepts of this chapter are the contrasts between Plan-and-Document software development and Agile software development, and the synergy(协同作用) among Agile development, Software as a Service, and cloud computing.

####  Basic Concept

1.Plan-and-Document software development processes or lifecycles rely on careful, up-front planning, whereas Agile software development relies on incrementally refining a prototype with continuous feedback from the customer over the course of many 14 week iterations. Of the two, Agile has the superior track record for managing change, running compact projects with small teams, and delivering quality software on time and within budget.

2.Software quality is defined as providing business value to both customers and developers and involves many kinds of testing. In Agile, the developers themselves, rather than a separate QA team, bear primary responsibility for software quality

3.Clarity via conciseness, synthesis, reuse, and automation via tools are four paths to improving developer productivity. Ruby on Rails employs all of them

4.Software as a Service (SaaS) is software deployed on Internet servers accessible to millions of users. Compared with Software as a Product (SaaP) that users install on their devices, SaaS is easier to upgrade and evolve because there is only a single copy deployed in the field.

5.Cloud Computing supplies the dependable and scalable computation and storage for SaaS by utilizing Warehouse Scale Computers

6.Warehouse Scale Computers: a data center provide service to the company. High utility.

7.Legacy Code evolution is vital in the real world, yet often ignored in software engineering books and courses. Agile practices enhancing code each iteration, so the skills gained also apply to legacy code.

#### 1.2 Software Development Processes: Plan-and-Document

Before starting to code, come up with a plan for
the project, including extensive, detailed documentation of all phases of that plan. Progress is
then measured against the plan. Changes to the project must be reflected in the documentation
and possibly to the plan.

goal:to improve predictability via extensive documentation

##### Waterfall

5 phase:

1. Requirements analysis and specification 
2. Architectural design 
3. Implementation and Integration 
4. Verification 
5. Operation and Maintenance

remove as much error as possible

The Waterfall model can work well with well-specified tasks like NASA space flights, but it runs into trouble when customers change their minds about what they want.

##### Spiral model 

Prototyping + Waterfall

4 phase:

1. Determine objectives and constraints of this iteration 
2. Evaluate alternatives and identify and resolve risks 
3.  Develop and verify the prototype for this iteration
4.  Plan the next iteration

Easier for customers to understand what they want once they see the prototype

Pros:

Risk Handling: The projects with many unknown risks that occur as the development proceeds, in that case, Spiral Model is the best development model to follow due to the risk analysis and risk handling during each iteration. 

Good for **large and complex projects.** 

**Flexibility in Requirements:** Changes at later phase can be incorporated accurately by using this model.

**Cons**

Complex and Expensive**: Spiral Model is not suitable for small projects as it is expensive. **

Difficulty in time management: As the number of iteration is unknown at the start of the project, so time estimation is very difficult.

#####  Rational Unified Process (RUP) 

1. Inception: makes the business case for the software and scopes the project to set the schedule and budget, which is used to judge progress and justify expenditures, and initial assessment of risks to schedule and budget.
2. Elaboration: works with stakeholders to identify use cases, designs a software architecture, sets the development plan, and builds an initial prototype. 
3.  Construction: codes and tests the product, resulting in the first external release. 
4.  Transition: moves the product from development to production in the real environment, including customer acceptance testing and user training.

RUP defines 6 engineering dispcilines

1. Business Modeling 
2.  Requirements 
3.  Analysis and Design 
4. Implementation 
5.  Test 
6.  Deployment

#### 1.3 Software Development Processes: The Agile Manifesto

##### Agile

• Individuals and interactions over processes and tools

 • Working software over comprehensive documentation

 • Customer collaboration over contract negotiation

 • Responding to change over following a plan

 Agile emphasizes test-driven development (TDD) to reduce mistakes by writing the tests before
writing the code, user stories to reach agreement and validate customer requirements, and
velocity to measure project progress.

**Test-driven development** (**TDD**) is a software development process relying on software requirements being converted to [test cases](https://en.wikipedia.org/wiki/Test_case) before software is fully developed, and tracking all software development by repeatedly testing the software against all test cases.

Agile is a family of methodologies, not a single methodology. We follow Extreme Pro-
gramming (XP), which includes one- to two-week iterations, behavior driven design (see
Chapter 7), test-driven development (see Chapter 8), and pair programming (Section 2.2).
Another popular variant is Scrum (Section 10.1)

Summary: In contrast to the Plan-and-Document lifecycles, the Agile lifecycle works
with customers to continuously add features to working prototypes until the customer is
satisfied, allowing customers to change what they want as the project develops. Documen-
tation is primarily through user stories and test cases, and it does not measure progress
against a predefined plan. Progress is gauged instead by recording velocity, which essen-
tially is the rate that a project completes features.

#### 1.4 Software Quality Assurance: Testing

Quality: For software, quality means both satisfying the customer’s needs—easy to use, gets correct answers, does not crash, and so on—and being easy for the developer to debug and enhance.

 Verification: Did you build the thing right?

 Validation: Did you build the right thing?

#### 1.5 Productivity: Conciseness, Synthesis, Reuse, and Tools

Engineers developed four fundamental mechanisms to improve their productivity:
1. Clarity via conciseness

    if programs are easier to understand, they will have fewer bugs and to be easier
   to maintain

   2 ways for programming language:

   1. offering a syntax that
      lets programmers express ideas naturally and in fewer characters

   2. raise the level of abstraction

2. Synthesis

   Synthesis refers to code that is generated automatically rather than created manually.

3. Reuse

    object-oriented programming (OOP)

4. Automation via Tools

    replacing tedious manual tasks with tools to save time,
   improve accuracy, or both.

#### 1.6 SaaS and Service Oriented Architecture

Software as a Service (SaaS)

1. Since customers do not need to install the application, they don’t have to worry whether
their hardware is the right brand or fast enough
2. The data associated with the service is generally kept with the service, so customers
  need not worry about backing it up
3. When a group of users wants to collectively interact with the same data, SaaS is a
  natural vehicle
4. When data is large and/or updated frequently, it may make more sense to centralize
  data and offer remote access via SaaS
5. Only a single copy of the server software runs in a uniform, tightly-controlled hardware
  and operating system environment selected by the developer
6.  pre-test new version,upgrade the software and even the hardware as long as they don’t violate the external application program interfaces (API)
7.  SaaS companies compete regularly on bringing out new features to help ensure that
  their customers do not abandon them for a competitor who offers a better service

for short:

1. No user installation: Documents
2. Can’t lose data: Gmail, Calendar.
3. Users cooperating: Documents.
4. Large/changing datasets: Search, Maps, YouTube.
5. Software centralized in single environment: Search.
6. No field upgrades when improve app: Documents.

#### 1.7 Deploying SaaS: Cloud Computing

SaaS places three demands on our information technology (IT) infrastructure:
1. Communication, to allow any customer to interact with the service.
2. Scalability, inthatthecentralfacilityrunningtheservicemustdealwiththefluctuations
in demand during the day and during popular times of the year for that service as well
as a way for new services to add users rapidly.
3. Availability, in that both the service and the communication vehicle must be continu-
ously available

cloud computing: offers computing, storage, and communication at pennies per hour

#### 1.8 Deploying SaaS: Browsers and Mobile

HTML is an example of a markup language: it combines text with
markup (annotations about the text’s structure) in a way that makes it easy to syntactically
distinguish the two. 

Separating an HTML document’s logical structure from its appearance confers many
benefits. Structure refers to the kind of content each logical component of a page represents.

The key to separating structure and appearance is the use of Cascading Style Sheets
(CSS)

CSS: a way to associate visual rendering information with HTML
elements. It's a stylesheet language describing visual attributes
of elements on a Web page.(KEY CONCEPT: selector—an expression that matches one or As a reminder, the
Concepts & Prerequisites page suggests self-study materials for basic HTML and CSS.
more HTML elements in a document.)

The basic mechanism of using CSS to “style” HTML:

1.When the browser loads the page, it looks for one or more link elements

2.The browser loads each referenced CSS stylesheet. A stylesheet contains a set of se-
lectors and, for each selector, a set of rules for how to display elements matching that
selector. 

3.When displaying the page, the browser matches up the CSS rules with the matching
elements on each displayed page.

CSS pages are separate from HTML documents, and link element(s) inside the
head element of an HTML document associate one or more stylesheets with that
document.

HTML/CSS frameworks

#### 1.9 Beautiful vs. Legacy Code

 legacy code: old code but continue to meet customers' need

#### 1.11 Fallacies and Pitfalls

NOTE: Agile is a nice match to many types of software, particularly SaaS, which is why we
use it in this book. However, Agile is not best for everything. Agile may be ineffective for
safety-critical apps, for example.

#### 1.12 Concluding Remarks: Software Engineering Is More Than Programming

