# Quiz5

# Chapter 10 Agile Teams

### 10.1 It Takes a Team: Two-Pizza and Scrum

#### “two-pizza” team

a group that can be fed by two pizzas in a meeting(usually in saas project)

####  Scrum

one way to organize the "two-piazza" team

1. what have done yesterday
2. plan today
3. any impediment block

scrum uses sprint as instead of agile term iteration

3 role in a Scrum:1) Team: who delivers the software. 2)Scrum lead: A team member who acts as buffer between the Team and external distractions, keeps the team focused on the task at hand, enforces team rules, and removes impediments that prevent the team from making progress. One example is enforcing coding standards, which are style guidelines that improve the consistency and readability of the code. 3)Product owner: member who represents the voice of customer and prioritizes user stories

For conflicts:1) list agreement for both sides-->closer than they though

2)articulate other's argument-->reduce confusion

Scrum relies more on real-time feedback than on the traditional management approach of central planning with command and control.

Which statement(s) best reflect(s) how Agile Scrum-based teams would prioritize and deliver User Stories?

Anyone can mark a story Delivered, but only the Product Owner can mark it as Accepted or Rejected

### 10.2 Using Branches Effectively 

#### feature branch

It allows a developer or sub-team to make the changes necessary to implement a particular feature without affecting the main branch until the changes are complete and tested

create a new branch for a new feature

(use branch only needed for that feature)

To back out feature, undo branch merge

1. Create new branch & switch to it
2. Edit on the branch
3. Push branch to origin repo
4. Merge branch to master

Each new feature should reside in its own branch, which can be pushed to the central repository for backup/collaboration. But, instead of branching off of `main`, `feature` branches use `develop` as their parent branch. When a feature is complete, it gets merged back into develop. Features should never interact directly with `main`.



#### Release branch

allow fixing bugs in previous releases whose code has diverged from main line of development



#### Pull

When you make pull request, you are making it with the branch that already been rebased

#### Merge Conflict

If 2 person(A,B) have different branches, and the A has merged to the master branch. If A,B change the same file. Then B can't push directly to the master. B can use git pull origin main to get the latest commits on main from the origin repo. So B's copy of repo looks the same as it did to A.

B and A have their own local master.  Run git pull origin main update B's local master(the master after merge of A).

If B changes different file than A or different place in the same file, B can merge directly.

Otherwise, git will create a version of the file that reflects both sets of changes, and it will leave a conflicted and uncommitted version of the file with conflict markers (<<< and >>>) in B’s main branch. Then B will manually edit to complete the merge 

```
          I--J   <-- branch1 (HEAD)
         /
...--G--H
         \
          K--L   <-- branch2
Here, when merging branch1 and branch2—which means commits J and L—the common starting point is clearly commit H. So git merge will run two git diff commands, and the merge base in each will be H
Git will now combine the set of changes produced by these two git diff commands. Where they overlap, but don't make the same change, is where you will get merge conflicts
```



### 10.3 Pull Requests and Code Reviews 

#### Pull Request

Pull requests are a mechanism for a developer to notify team members that they have completed a feature. It expects other team member to review and comment on it. PR may be withdraw or revised before merge.

But, the pull request is more than just a notification—it’s a dedicated forum for discussing the proposed feature. If there are any problems with the changes, teammates can post feedback in the pull request and even tweak the feature by pushing follow-up commits. All of this activity is tracked directly inside of the pull request.

All developers Merge request is an alternative name for pull request. sharing the repo see each PR, and each has the responsibility to determine how merging those changes might affect their own code

The PR’s “description” field should provide a well-written explanation of what the proposed code does overall

#### PR description

1. The code to be merged should be well covered by tests, all of which should be passing

2. The commit messages should clearly indicate what was changed in each commit
3. Documentation has been updated if necessary to explain new design decisions or changes to important configuration files
4. Any temporary or non-essential files that were versioned during development of the code have been removed from version control
5. Steps have been taken to eliminate or minimize merge conflicts that will occur when the PR is accepted and merged

#### Rebase

The first thing to understand about `git rebase` is that it solves the same problem as `git merge`. Both of these commands are designed to integrate changes from one branch into another branch

happens when you want merge you branch to master but the master is in another version

As the branch owner, I take the responsibility to make sure when merging the master, it's clean. To achieve this, first rebase the latest master, do the clean up then merge.

```
$ git checkout experiment
$ git rebase master // rebase the change on experiment to master
$ git checkout master
$ git merge experiment // do the merge on master
```



you can take the patch of the change that was introduced in `C4` and reapply it on top of `C3`. In Git, this is called *rebasing*. With the `rebase` command, you can take all the changes that were committed on one branch and replay them on a different branch.

For example, if there have been 3 new commits on main since the time you branched off of it, and you now rebase your branch on top of main, Git will first apply those 3 new commits to the original state of your branch, and then try to apply your own commits. This latter step may cause conflicts if the 3 commits on the main branch touched some of the same files your changes have touched

##### rewriting of history

1.You have not yet pushed to the shared repo

2.You have pushed to the shared repo, but no one else has made additional changes based on your branch

3.You have pushed to the shared repo, and others have based work off of your changes

For case 3, one good practice is to construct feature branch names in some way that signals that others should not build off of those commits

### 10.4 Delivering the Backlog Using Continuous Integration

#### Automation

consistent deploy process

#### Continuous Integration

integration-testing the app beyond what each developer does

It allows developers to frequently merge code changes into a central repository where builds and tests then run. Automated tools are used to assert the new code’s correctness before integration.

Central to CI is the continuous running of tests as code is developed, usually using a separate service such as Travis

#### Continuous Deployment

Push->pass CI->Deploy

#### Basic Workflow

1. use git pull to make sure your local get the most up-to-date copy
2. create a feature branch
3. make commits to your feature branch. Periodically push you commits on a branch of origin repo(origin repo is set up to run a CI test for every commits to the master or branch)
4. ask for permission to merge to the master branch. Starts with a PR(the pull request is comparing the feature branch on the origin repo to the master branch on the origin repo)
5. give feedback
6. make more commits and make PR
7. Fix all the issues and PR is accepted. Merge with the master
8. Deploy new merged code in a staging server(like a small version of production server). Listen to customer's request and make more commits and make PR and finish
9. use git pull to make local repo up-to-date



delivered: deploy on staging server

accepted: deploy on production server

If the team doesn't own the app, we need variations



#### Minimize Loops

small stories->simple branch->quick PR

work on stories on prioritized order

one story at a time

### 10.6 Reporting and Fixing Bugs: The Five R’s 

#### 5 Rs

1. Reporting a bug(maybe found by customer or your team. Many bug tracker can cross-reference commit-IDs that contain the associated fixes and regression tests)
2. Reproducing the problem, or else Reclassifying it as “not a bug” or “won’t be fixed”(reproduce it with simplest test. make the precondition as small as possible,before block in RSPEC)
3. Creating a Regression test that demonstrates the bug
4. Repairing the bug(no bug can be closed out without a test)
5. Releasing the repaired code

Even non-agile do something like this

#### Reclassify(4 cases)

This is not a bug but a request to make an enhancement or change a behavior that is working as designed 

This bug is in a part of the code that is being undeployed or is otherwise no longer supported 

This bug occurs only with an unsupported user environment, such as a very old browser lacking necessary features for this SaaS app 

This bug is already fixed in the latest version (uncommon in SaaS, whose users are always using the latest version)

#### Pivotal Tracker

bug = 0 point story

automation: Github service hooks can be configured to mark Tracker story deliverd when properly-annotated commit is pushed



### 10.7 The Plan-And-Document Perspective on Managing Teams 

Project manager takes charge of P&D documentation

#### Review Agenda

Prepare questions to be discussed->starts with high level description of customer need->give SW architecture showing APIs and highlighting design pattern at each level of abstraction->go through code and documentation

####  four major tasks for project managers

1. Team size, roles, space, communication 
2. Managing people and conflicts 
3. Inspections and metrics 
4. Configuration management

#### Inspection and metrics

Inspections like design reviews and code reviews allow feedback on the system even before everything is working

#### Configuration management

Configuration management includes four varieties of changes

1. version control or source and configuration management (SCM)
2. system building, is closely related to the first. Tools like make assemble the compatible versions of components into an executable program for the target system
3. release management
4. change management, which comes from change requests made by customers and other stakeholders to fix bugs or to improve functionality

#### SAMOSAS

good meeting

S: start and stop meeting promptly

A: agenda created in advance

M: minutes recorded

O: one speaker at a time

S: send material in advance 

A: action items in the end so everybody knows what's their job

S: set time for next meeting

# Chapter 11 Design Patterns for SaaS Apps

### 11.1 Patterns, Antipatterns, and SOLID Class Architecture 

#### design pattern

a reusable structure, behavior, strategy, or technique that captures a proven solution to a collection of similar problems by separating the things that change from those that stay the same

#### 2 principles for OOD:

Prefer Composition and Delegation over Inheritance

Program to an Interface, not an Implementation

#### 23 GoF design pattern

| Creational patterns                                          |
| ------------------------------------------------------------ |
| **Abstract Factory, Factory Method**: Provide an interface for creating families of related or dependent objects without specifying their concrete classes **Singleton**: Ensure a class has only one instance, and provide a global point of access to it. **Prototype**: Specify the kinds of objects to create using a prototypical instance, and create new objects by copying this prototype. As we’ve seen in Chapter 6, prototype-based inheritance is part of the JavaScript language. **Builder**: Separate the construction of a complex object from its representation allowing the same construction process to create various representations |
| Structural patterns                                          |
| **Adapter, Proxy, Façade, Bridge**: Convert the programming interface of a class into another (sometimes simpler) interface that clients expect, or decouple an abstraction’s interface from its implementation, for dependency injection or performance **Decorator**: Attach additional responsibilities to an object dynamically, keeping the same interface. Helps with “Prefer composition or delegation over inheritance.” **Composite**: Provide operations that work on both an individual object and a collection of that type of object **Flyweight**: Use sharing to support large numbers of similar objects efficiently |
| Behavioral patterns                                          |
| **Template Method, Strategy**: Uniformly encapsulate multiple varying strategies for same task **Observer**: One or more entities need to be notified when something happens to an object **Iterator, Visitor**: Separate traversal of a data structure from operations performed on each element of the data structure **Null Object**: (Doesn’t appear in GoF catalog) Provide an object with defined neutral behaviors that can be safely called, to take the place of conditionals guarding method calls **State**: Encapsulate an object whose behaviors (methods) differ depending on which of a small number of internal states the object is in **Chain of Responsibility**: Avoid coupling the sender of a request to its receiver by giving more than one object a chance to handle the request, passing request up the chain until someone handles it **Mediator**: Define an object that encapsulates how a set of objects interact without those objects having to refer to each other explicitly, allowing decoupling **Interpreter**: Define a representation for a language along with an interpreter that executes the representation **Command**: Encapsulate an operation request as an object, thereby letting you parameterize clients with different requests, queue or log requests, and support undoable operations |



#### antipattern

a piece of code that seems to want to be expressed in terms of a well-known design pattern, but isn’t

#### Design smells

warning signs that your code may be headed towards an antipattern

It applies to relationships between classes and how responsibilities are divided among them

##### refactoring method and design

refactor method->move code in a class

refactor design->move code between classes. delete or create new class and method

#### SOLID

| Principle               | Meaning                                                      | Warning                                                      | Refactor                                                     |
| ----------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Single responsibility   | only one reason to change a class                            | large class                                                  | extract class                                                |
| Open/closed             | class is open for extension and close for modification       | conditional complexity                                       | use template method                                          |
| Liskov substitution     | should preserve correct program behavior when substitute a subclass for a class | subclass destructively overrides an inherited method or doesn't use some of them | Replace inheritance with delegation                          |
| Injection of dependency | Collaborating classes depend on an intermediate “injected” dependency | constructors that hardwire a call to another class’s constructor | Inject a dependency on a shared interface to isolate the classes |
| Demeter principle       | speak only to a range of friends, others are treated as stangers | Inappropriate intimacy, feature envy, mock trainwrecks       | call the delegate methods instead                            |

Viscosity: easier to fix a problem using a hack

Immobility: hard to be DRY(extraction is hard)

Needless repetition

Needless complexity

### 11.2 Just Enough UML 

#### UML(undefined Modeling Language)

a set of graphical notation techniques that provide a “standard way to visualize the design of a [software] system

It comprises a family of diagram types to illustrate various aspects of a software design and implementation

usually for heavyweight

| class     |
| --------- |
| attribute |
| methods   |

abstract class; like an animal class. we can have subclasses like cat that has all things in animal





#### Aggregation

child exist independent to parent

#### Composition

child can't survive if parent is deleted

#### Class-Responsibility-Collaborator Card(CRC)

 a collection of standard index cards that have been divided into three sections.  class represents a collection of similar objects, a responsibility is something that a class knows or does, and a collaborator is another class that a class interacts with to fulfill its responsibilities

#### Association Multiplicity

Each end of the line connecting two associated classes is annotated with the minimum and maximum number of instances that can participate in that “side” of the association

*:unlimited

1..* means “one or more”, 0..* means “zero or more”, and 1 means “exactly one.

### 11.3 Single Responsibility Principle 

#### Single Responsibility Principle (SRP)

a class should have one and only one responsibility—that is, only one reason to change

In MVC, each controller should specialize in dealing with one resource

#### cohesion

the degree to which the elements of a single logical entity are related

Two methods are related if they access the same subset of instance or class variables or if one calls the other

Extract Class

To perform Extract Class, we identify the group of methods that shares a responsibility distinct from that of the rest of the class, move those methods into a new class

```
class Moviegoer
 attr_accessor : name , : street , : phone_number , : zipcode
 validates : phone_number , # ...
 validates : zipcode , # ...
 def format_phone_number ; ... ; end
 def check_zipcode ; ... ; end
 def format_address ( street , phone_number , zipcode ) # data clump
 # do formatting , calling format_phone_number and check_zipcode
 end
end
 # After applying Extract Class :
class Moviegoer
 attr_accessor : name
 has_one : address
end
class Address
 belongs_to : moviegoer
 attr_accessor : phone_number , : zipcode
 validates : phone_number , # ...
 validates : zipcode , # ...
 def format_address ; ... ; end # no arguments - operates on 'self '
 private # no need to expose these now :
 def format_phone_number ; ... ; 
 end
 def check_zipcode ; ... ; 
 end
end
```



### 11.4 Open/Closed Principle 

#### Open/Closed Principle (OCP)

it should be possible to extend the behavior of classes without modifying existing code on which other classes or apps depend

```
class Report
 def output
 formatter_class =
 begin
 @format . to_s . classify . constantize
 rescue NameError
 # ... handle 'invalid formatter type '
 end
 formatter = formatter_class . send (: new , self )
 # etc
 end
end
```

#### decorator pattern

a design pattern that allows behavior to be added to an individual object

To apply Decorator to a class, we “wrap” class by creating a subclass (to follow the Liskov Substitution Principle, as we’ll learn in. The subclass delegates to the original method or class for functionality that isn’t changed, and implements the extra methods that extend the functionality

```
class UserDecorator < Draper::Decorator
  delegate_all

  def email_or_request_button
    public_email ? email : h.link_to('Request Email', '#', class: 'btn btn-default btn-xs').html_safe
  end

  def full_name
    if first_name.blank? && last_name.blank?
      'No name provided.'
    else
      "#{ first_name } #{ last_name }".strip
    end
  end

  def joined_at
    created_at.strftime("%B %Y")
  end
end
```

```ruby
module RequestLogger
    def get(url)
        puts"sending request to #{url}"
        super
    end
end
class HttpClient
    #prepend RequestLogger
    def initialize(client = RestClient)
        @client=client
    end
 	def get(url)
        @client.get(url)
    end
end
http = GttpClient.new
http.extend(RequestLogger)
http.get("www.berkeley.edu")
#will print sending...
```



### 11.5 Liskov Substitution Principle

#### Liskov Substitution Principle (LSP)

####  

### 11.6 Dependency Injection Principle 

#### dependency injection principle (DIP)

if two classes depend on each other but their implementations may change, it would be better for them to both depend on a separate abstract interface that is “injected” between them

suppose we have class A and B and A uses the method in B. We say A is dependent of B. To inject dependency, we push the dependency in B to A. That's to say, we shouldn't instantiate dependencies using new method in A. Instead, take it as a parameter for a constructor

#### DI

problem: a depends on b but b's interface and implementation can change

solution: inject an abstract interface that a and b depend on

If one database try to talk to another database, inject abstract adapter which maps each method calls to the right thing for other database(each database should have a adapter which takes its(database) operation that can provide and make them look something that the adapter can map to)

The adapter may unify distinct underlying APIs to single and simplified API

#### Proxy pattern

It implements same method as "real" service object, but "intercepts" each call

one object “stands in” for another that has the same API. The client talks to the proxy instead of the original object; the proxy may forward some requests directly to the original object (that is, delegate them) but may take other actions on different requests, perhaps for reasons of performance or efficiency

```ruby
# The Subject interface declares common operations for both RealSubject and the
# Proxy.
class Subject
  # @abstract
  def request
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# The RealSubject contains some core business logic. RealSubjects are
# capable of doing some useful work which may also be very slow or sensitive
# A Proxy can solve these issues without any changes
# to the RealSubject's code.
class RealSubject < Subject
  def request
    puts 'RealSubject: Handling request.'
  end
end

# The Proxy has an interface identical to the RealSubject.
class Proxy < Subject
  # @param [RealSubject] real_subject
  def initialize(real_subject)
    @real_subject = real_subject
  end
  # A Proxy can perform controlling the access, logging, etc. depending on the result, pass the execution to the same method in a linked RealSubject object.
  def request
    return unless check_access

    @real_subject.request
    log_access
  end

  # @return [Boolean]
  def check_access
    puts 'Proxy: Checking access prior to firing a real request.'
    true
  end

  def log_access
    print 'Proxy: Logging the time of request.'
  end
end

# The client code is supposed to work with all objects
def client_code(subject)
  # ...

  subject.request

  # ...
end

puts 'Client: Executing the client code with a real subject:'
real_subject = RealSubject.new
client_code(real_subject)

puts "\n"

puts 'Client: Executing the same client code with a proxy:'
proxy = Proxy.new(real_subject)
client_code(proxy)
```

#### Facade pattern

an adapter pattern not only converts an existing API but also simplifies it

#### Adapter pattern

An adapter wraps one of the objects to hide the complexity of conversion happening behind the scenes. The wrapped object isn’t even aware of the adapter. For example, you can wrap an object that operates in meters and kilometers with an adapter that converts all of the data to imperial units such as feet and miles.

Adapters can not only convert data into various formats but can also help objects with different interfaces collaborate. Here’s how it works:

1. The adapter gets an interface, compatible with one of the existing objects.
2. Using this interface, the existing object can safely call the adapter’s methods.
3. Upon receiving a call, the adapter passes the request to the second object, but in a format and order that the second object expects.

#### Null object pattten

create a “dummy” object that has all the same behaviors as a real object but doesn’t do anything when those behaviors are called

### 11.7 Demeter Principle 

you can access instance methods in your own class and in the classes corresponding to your nearest collaborators, but not on their collaborators

#### 2 situations violate demeter principle

inappropriate intimacy

managing some attribute that's other class's responsibility

mock trainwreck

to test code that violates Demeter, we find ourselves setting up a “chain” of mocks that will be used when we call the method under test

```ruby
class Paperboy
	def collect_money(customer,amount)
        if customer.wallet.cash<amout
            ...
        else
            customer.wallet.cash -= due_amount
            @collected_amount += due_amount
        end
    end
end
# it knows to much of the class customer which is not a friend of paperboy
#solution
#use delegate
class Customer
    def cash
        self.wallet.cash
    end
end
class Paperboy
	def collect_money(customer,amount)
        if customer.cash<amout
            ...
        else
            customer.wallet.cash -= due_amount
            @collected_amount += due_amount
        end
    end
end
## Best: delegate the *behavior*, whose implementation can now be changed without affecting Paperboy.
class Wallet
	attr_reader : cash # no longer attr_accessor!
	def withdraw( amount)
		raise Insufficient FundsError if amount > cash
		cash -= amount
		amount
	end
end
class Customer
# behavior delegation
	def pay(amount)
		wallet.withdraw( amount)
	end
end
class Paperboy
	def collect_money(customer, due_amount)
		@collected_amount += customer.pay(due_amount)
	end
end
```

#### Iterator pattern

It separates the implementation of traversing a collection from the behavior you want to apply to each collection element

#### Observer pattern

one class know that other classes are doing without knowing their details of implementation

### 11.8 The Plan-And-Document Perspective on Design Patterns 

#### P&D Approach To Design Pattern

Careful planning->good SW architecture

#### Six S's

Site: think about whether it's the right place to inset new code. Does it properly belongs to the model or method or . should it be separately modularized. Is it connect properly to the app

Solid: carefully check whether your new code follows the SOLID principle

Sofa: check whether new or refactored method follow the SOFA criteria

Smells: check whether it's free of code and design smells. Can use tools like CodeClimate

Style: your code should follow variable and function naming, spacing and indentation for that language or framework

Sign-off: if the above steps are finished, open a pull request and invite team feedback until tehy are fine with it

Automated tools can help with some of the S’s, but in the end, there’s no substitute for an informed team who trust and hold each other responsible for providing constructive feedback

# Chapter 12 Dev/Ops

### 12.1 From Development to Deployment

#### development

test to make sure app works as designed

#### deployment

test to make sure app works even used in the way not designed to be used

####  key operational criteria

##### performance stability

Responsiveness: how long do most users wait for a response

Release management: how to upgrade your app without reducing availability and responsiveness

availability: what percentage of the time is your app correctly serving requests

scalability: can app maintain steady-state availability and responsiveness without increasing the operational cost per user even with fluctuation of users

##### security

privacy: Is customer's data accessible only to authorized party

authentication: can the app ensure that a given user is who they claim to be

data integrity: can the app prevent customer data from being tampered with

#### SaaS goals

High availability & responsiveness, 

Release managements without downtime

Scalability without increased user costs

Defend customer data in the app

### 12.2 Three-Tier Architecture

The three-tier architecture includes a presentation tier, which renders views and interacts with the user; a logic tier, which runs SaaS app code; and a persistence tier, which stores app data

HTTP’s statelessness allows the presentation and logic tiers to be shared-nothing, so cloud computing can be used to add more computers to each tier as demand requires. However, the persistence tier is harder to scale

#### 3-tier shared-nothing architecture

entities within a tier generally don't communicate with each other

#### presentation tier

### 12.3 Responsiveness, Service Level Objectives, and Apdex

### 12.4 Releases and Feature Flags

### 12.5 Monitoring and Finding Bottlenecks

### 12.6 Improving Rendering and Database Performance With Caching

#### Goal of caching

satisfy each HTTP request as close to the user as possible

#### Browser caching(for browser)

A Web browser that has previously visited a page can reuse the copy in its local cache after verifying with the server that the page hasn’t changed

#### Page Caching(for web server)

Page caching is a Rails mechanism which allows the request for a generated page to be fulfilled by the web server without having to go through the entire Rails stack

Page Caching cannot be used for actions that have before filters - for example, pages that require authentication

#### action caching(for controller)

Action Caching works like Page Caching except the incoming web request hits the Rails stack so that before filters can be run on it before the cache is served

Rails may be able to serve it from the action cache without querying the database or rendering any templates

#### Fragment Caching(for view)

When different parts of the page need to be cached and expired separately you can use Fragment Caching

Fragment Caching allows a fragment of view logic to be wrapped in a cache block and served out of the cache store when the next request comes in

#### Query Caching(for database)

Query caching is a Rails feature that caches the result set returned by each query. If Rails encounters the same query again for that request, it will use the cached result set as opposed to running the query against the database again

### 12.7 Avoiding Abusive Database Queries

### 12.9 Security: Defending Customer Data in Your App

#### principle of least privilege

a user or software component should be given no more privilege

#### Transport Layer Security (TLS)

keep data private as it travels between the browser and server, and assure the browser of the server’s identity, but provide no other guarantees

#### Secure Sockets Layer (SSL)

goal of SSL and and TLS is to encrypt all HTTP traffic by transforming it using cryptographic techniques driven by a secret (such as a password) known only to the two communicating parties. Running HTTP over such a **secure connection** is called HTTPS

#### Cross-site request forgery

A CSRF attack (sometimes pronounced “sea-surf”) involves tricking the user’s browser into visiting a different web site for which the user has a valid cookie, and performing an illicit action on that site as the user

### 12.10 The Plan-And-Document Perspective on Operations

#### SaaS

Software as a Service, also known as cloud application services, represents the most commonly utilized option for businesses in the cloud market. SaaS utilizes the internet to deliver applications, which are managed by a third-party vendor, to its users. A majority of SaaS applications run directly through your web browser, which means they do not require any downloads or installations on the client side.

As a customer, you can use it directly

#### PaaS

Cloud platform services, also known as Platform as a Service (PaaS), provide cloud components to certain software while being used mainly for applications. PaaS delivers a framework for developers that they can build upon and use to create customized applications. All servers, storage, and networking can be managed by the enterprise or a third-party provider while the developers can maintain management of the applications.

don't need to care about the bottom infrastructure

#### IaaS

Cloud infrastructure services, known as Infrastructure as a Service (IaaS), are made of highly scalable and automated compute resources. IaaS is fully self-service for accessing and monitoring computers, networking, storage, and other services. IaaS allows businesses to purchase resources on-demand and as-needed instead of having to buy hardware outright.

[Select all that apply] Which is FALSE about pair programming practices?

Pair programming reduces distractions that could otherwise affect an individual developer.

Pair programming brings higher programming costs; less number of user stories gets picked.

[Select all that apply.] In Agile lifecycle, when a user story is delivered, who may sign off on the story as "complete"? (Hint: "Accepting" the delivered story signs off the story to be complete)

Customer; team member act as customer

Which statements are TRUE about the Scrum Master role?

enforces rules, coding standards and style guides

acts as a buffer between developers and distractions

responsible for code consistency

Developers who deploy on a well-curated PaaS should focus primarily on attacks that can be thwarted by good coding practices?

Rooting attacks on the operatng system

Which of the following are benefits of using design patterns?

Apply well-known solutions to common problems****Help to develop high-level architecture of software****Improve ability to reuse existing implementations****Improve communication between developers by providing well-known names for software interactions**