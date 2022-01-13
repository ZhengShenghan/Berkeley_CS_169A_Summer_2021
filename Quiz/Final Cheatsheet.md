# Final Cheatsheet(combing quiz1-5 together)

## Module 1 & 2

#### Agile software development & Plan-and-Document software development

Plan-and-Document software development processes or lifecycles rely on careful, up-front planning, whereas Agile software development relies on incrementally refining a prototype with continuous feedback from the customer over the course of many 14 week iterations. Of the two, Agile has the superior track record for managing change, running compact projects with small teams, and delivering quality software on time and within budget.

Plan-and-Document: waterfall, spiral, Rational Unified Process (RUP)

All of them rely on on careful planning and thorough documentation

All of them measure progress against a plan

Agile

Agile omits the requirements-gathering and documentation phase present in most P&D methodologies

Agile includes the same phases as P&D methodologies, but the work of each phase is done in smaller increments

cons : 1.No finite end

2.Difficult measurement

3.Limited documentation

4.Poor resource planning

#### **Developer Productivity**

**Clarity via conciseness** Small programs => Easy to evolve and understand => fewer bugs and easier to maintain. How do programming languages do this? 1. Syntax that lets programmers express ideas using fewer characters. 2. Raise level of abstraction

**Synthesis of Implementations **Automatically generated code > Manually written code. Metaprogramming: automatically synthesize code at runtime

**Reuse** Reuse existing designs, procedures and functions > writing everything from scratch. Object Oriented Programming => Inheritance. Dynamic Typing. Mix-ins Don’t have to change all copies when fixing a bug - just one place. DRY - don’t repeat yourself

**Automation via tools** Replace tedious manual tasks with tools to save time, improve accuracy, or both. Concerns: 1)Trade off between time to learn and time saved. 2)Dependability of the tool. 3)The quality of the user experience. 4)How to decide which one to use. Examples, Cucumber, Pivotal Tracker, RSpec, Compilers, Interpreters

#### SaaS

Software is run on Internet based servers that communicate among each other and allow users to access the service via a web browser.

Software as a Service (SaaS) is attractive to both customers and providers. Customer: universal client (the Web browser) makes it easier for customers to use the service Developer: single version of the software at a centralized site makes it easier for the provider to deliver, improve and frequent upgrade the service.

Advantages:

1. No local installation removes hardware compatibility requirement
2. Service data is kept within service (no back up, data loss concerns)Easier for groups of users to collaborate on same data
3. Centralized data with remote access that is good for large frequently changing data
4. Developers maintain single copy of server software (instead of 1 per OS)Upgrades to software don’t interfere with user experience
5. Encourages more competition + better features among SaaS companies

#### SOA(**Service oriented architecture**)

Service-oriented architecture (SOA) is a set of independent services composed together

PROS:

**Reusable**: combine existing microservice

**Easy testing**:

**Agile Friendly**: small team good

**customer-feedback cycles** can be done quickly and efficiently

CONS:

performance penalty

**Dependability**: one microservice fail may cause the whole app fail

**Development Work**: own interface for each microservice

need to know operation to manage functionality and performance

need:1. all customer should be able to contact with the service

2.request fluctuations during the day

3.the service and the communication vehicle must be continuously available

Cloud Computing can fulfill the need:1.Cluster:ethernet switch->scalable

2.virtual machine: multiple apps can share hardware with each app

#### Cloud Computing

Cloud computing provides a scalable and dependable hardware computation and storage for SaaS

One reason "elastic" cloud computing is a good match for SaaS is the stateless HTTP protocol.

**Need of SaaS**: 

1. Communication: allow any customer interact with the service
2. Scalability: central facility running the service must deal with the fluctuations in demand during the day and during popular times of the year for that service as well as a way for new services to add users rapidly.
3. Availability: both the service and the communication vehicle must be continuously available

**How can these needs be fulfilled?**

**Cluster**: small scale computers connected by Ethernet switches > expensive large scale computerMore scalable than conventional servers: due to reliability on Ethernet switches

**Virtual machine**: software that imitates a real computer. An OS can be run on top of the VM abstraction. 1) Can imitate with low overhead as well as simplify software distribution within a cluster 2)multiple apps can share hardware with each app believing that it has its own copy of the OS 3)OS-level virtualization: the apps are also able to share the operating system. Tool: Docker

#### Legacy code

meet customer need

### Ruby

#### loop

```
array.each do |x|
end
array.each { |x| puts x }
```

#### Block

```
def test
   yield 5
   puts "You are in the method test"
   yield 100
end
test {|i| puts "You are in the block #{i}"}
```

#### operator

```
and has lower precedence than =
a = false and true => a = false
```

#### Unless

```
unless conditional [then]
   code
[else
   code ]
endunless conditional [then]
   code
[else
   code ]
end
#Executes code if conditional is false. If the conditional is true, code specified in the else clause is executed.
```

#### Self

```

class DryRun < ActiveRecord::Base
  validate :only_one_instructor_per_quiz

  def only_one_instructor_per_quiz
    this_quiz = self.quiz
	other_quizzes_by_this_instructor = instructors.dryruns.map(&:quiz)
    if other_quizzes_by_this_instructor.include?(this_quiz)
      self.errors.add(:instructor, "Cannot review same quiz again")
    end
  end
end
```

#### Map

```
[1, 2, 3].map { |n| n * n } #=> [1, 4, 9]
```

#### Gemfile

```
bundle install --without production
source 'https://rubygems.org'

gem 'rails', '3.2.2'
gem 'rack-cache', :require => 'rack/cache'
gem 'nokogiri', '~> 1.4.2'

group :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
```

#### Where

```
Book.where("LENGTH(title) > ?", params[:min_length])
Book.long_title.where(category: "Ruby")
```

#### Collection

A collection is **any class that represents a collection of values**. Array and Hash are the key collection classes in Ruby, and the standard library adds a Set class.

#### Class variable

```
class Student

  attr_accessor :first, :last

  def full_name
     "#{first} #{last}"
     or @first + " " + @last
     or  self.first + " " + self.last
  end
end
```

#### operator

```
a<=>b # return 0 if a=b
```

#### ActiveRecord Query

```
create_table "books" do |t|
  t.string "isbn", null: false
  t.string "title"
  t.string "genre"
  t.integer "student_id"
  t.string "status"
  t.datetime "issue_date"

  t.timestamps      
end
Snack.where(type: 'cookie', company: "Nestle").destroy_all
Book.find_by(isbn: '123').update(status: 'checked', issue_date: '2021-10-05', student_id: 65)

```

#### .html.erb

```
<div class="restaurant-area text-center">
  <a href="#" class="restaurant-card">
    <img src="<%= restaurant.image %>" class="img-fluid restaurant-img"/>
    <div class="restaurant-card-detail text-left">
      <h4><%= restaurant.name %></h4>
      <p>
        <%= restaurant.address %>
      </p>
    </div>
  </a>
</div>
```



## Module 3 & 4

#### Patterns

##### design pattern:

a general architectural solution to family of similar problems obtained by generalizing from the experience of users who have solved those

##### architecture pattern:

how subsystems are connected together to meet the application’s functional and non-functional requirements

SaaS apps follow the client-server pattern

peer-to-peer pattern: Peer-to-peer architecture (P2P) is a computer networking architecture in which each workstation, or node, has the same capabilities and responsibilities. <------->client/server architecture, in which some computers are dedicated to serving others

#### SaaS communication

SaaS use HTTP route to communicate

network protocol: a set of communication rules on which agents participating in a network agree

The fundamental protocol: TCP/IP. It allows a pair of communicating agents to exchange ordered sequences of bytes in both directions simultaneously(TCP/IP doesn’t distinguish the roles of the agents)

It is up to the individual programs communicating over a TCP/IP connection to determine the rules of communication. The rules are defined by HTTP.

By TCP/IP , Each computer is assigned an IP address consisting of four bytes separated by dots(136.152.143.69)

Use a service called Domain Name system to avoid using IP address directly. It will map hostname to IP address. When you type a site name ('www.shanghaitech.edu') into your browser’s address bar, the browser automatically contacts a DNS server to translate that name into an IP address(So DNS is a client–server protocol)

Because multiple TCP/IP-based programs can be running on the same computer simultaneously-->IP is not enough to distinguish-->establishing a TCP/IP connection also requires a port number to indicate which program on the server is the intended communication partner. Some program must be listening to that port number on the server in order to accept connections

The default ports for production Web servers are 80 for HTTP and 443 for HTTPS

##### HTTP protocol

1. The client initiates a TCP/IP connection to a server by specifying the IP address and port number. If the computer at that IP address does not have an HTTP server process listening on the specified port, the client immediately experiences an error(like  “Connection refused.”)

2. if connection succeeds, the client will sends an HTTP request describing its intention to perform some operation on a resource. A resource is any entity that the server app manipulates(like image, form submmision)

3. The server delivers an HTTP response-->satisfying the client’s request or reporting any errors that prevented the request from succeeding. 

   !!!The response may also include information in the form of an HTTP cookie

##### elements of  HTTP request 

a route, zero or more headers, and possibly a request body(they are strings sent over the TCP/IP connection).

an HTTP route consists of an HTTP method— usually, one of GET, POST, PUT, PATCH, or DELETE—plus a URI.

!! same URI with different HTTP methods can have different meanings to a SaaS app

URI usually begins with http://

EX:

GET(HTTP METHOD) http(scheme)://srch.com(hostname):80(port)/main/search(resource path)?q=cloud&lang=en(query terms:"key=value")#top(fragment)

GET can modify cookie

GET typically means “deliver a copy of the resource to the client without modifying the resource or causing any side effects,” 

POST, PUT, PATCH, DELETE are typically used to perform an operation that creates, modifies, or deletes a resource.

 HTTP is a request-response protocol: every HTTP interaction begins with the client making a request, to which the server delivers a response. 

The HTTP request must include the route and HTTP protocol version, and usually also includes some request headers that provide information about the client.

 The HTTP protocol version tells the server which HTTP features the client can understand, so that (for example) servers can avoid using newer HTTP features if the client only understands an older protocol version. 

status code: 2xx(all is well) 3xx(resource moved) 4xx(forbidden,not found:client error) 5xx(server error)

HTTP is a stateless protocol: every HTTP request is independent of and unrelated to all previous requests.

--> so we need cookie to identify clients-->

##### cookie

a mechanism provided by HTTP. The first time a client makes a request from a particular server, the server can include in the response a Set-Cookie: header, containing a chunk of information that the server can use to identify this client on future HTTP requests.

It is the client’s responsibility to store that information and pass it back via a Cookie: header on every subsequent request to that same server.

#### API

A set of well-defined methods for interacting with the data of a software system. Defines what kind of requests are acceptable to access their servers and what kind of requests should be expected

#### RESTful

Representational state transfer (REST):  a software architectural style that was created to guide the design and development of the architecture for the World Wide Web. A way of mapping requests to actions that is particularly well suited to a service-oriented architecture

!!!represent the various entities manipulated by a Web app as resources to make them represntational.  and to construct routes so that any HTTP request would contain all the information necessary to identify both a resource and the action to be performed on it

The REST architectural style emphasizes the scalability of interactions between components, uniform interfaces, independent deployment of components, and the creation of a layered architecture to facilitate caching components to reduce user-perceived latency, enforce security, and encapsulate legacy systems.

#### Movie-View-Controller Architecture(MVC)

##### controller 

deliver data from model to render a view

pass data to model

#### Ruby On Rails

Rails is a web application development framework written in the Ruby programming language. It is designed to make programming web applications easier by making assumptions about what every developer needs to get started.

#### Partial view

_question_group.html.erb. start with a _

# Quiz 1



## Software as a Service, Agile Development, and Cloud Computing

### Plan&Document

project plan-->development

documentation->1.for new people to keep up

2.info not lost

Why ?Need: build software that was predictable in quality, cost & time

Waterfall

Idea:top-down

complete the step then move to next one

cons: customers change their minds, it'll be difficult

Spiral

Idea: prototyping + waterfall

The idea is to iterate through a sequence of four phases, with each iteration resulting in a prototype that is a refinement of the previous version

4 phase: 1.det obj and limi for iter

2. find problems and solve them

3. prototype

4. nest iter

    

   

   pros:

   1.customer know what they want from prototype

   2.Risk Handling

   3.good for large and complex group

   4.flexibility requirement

   con:

   1.Complex and Expensive

   2.time management

   Rational unified process(RUP)

   Idea: Spiral + Waterfall + Documentation

   4 phase:1.Inception: business case, schedule and budget

   2.Elaboration:plan,prototype

   3.Construction:code and test for product

   4.customer acceptance test, user training

   difference with waterfall: phase iteration

   Agile Software Development:

   1. refinement of prototype up up
   2. manage change 
   3. creates requirements as a result of frequent customer interaction
   4. daily meeting
   5. Kanban approach

Software quality

for Customers easy to use, doesn’t crash for Developers each to debug and enhance

build the right thing, build the thing right

unit testing, module testing



Developer Productivity

1.Synthesis of Implementations

2.Clarity via conciseness

3.Reuse

4.Automation via tools



SaaS

DF: Software is run on Internet based servers that communicate among each other and allow users to access the service via a web browser

central site makes it easy to upgrade

but no third party -->Service-oriented architecture (SOA):independent services composed together

microservices: service that are highly specialized to a narrow range of tasks



SOA

PROS:

**Reusable**:combine existing microservice

**Easy testing**:

**Agile Friendly**:small team good

**customer-feedback cycles** can be done quickly and efficiently

CONS:

performance penalty

**Dependability**: one microservice fail may cause the whole app fail

**Development Work**: own interface for each microservice

need to know operation to manage functionality and performance

need:1. all customer should be able to contact with the service

2.request fluctuations during the day

3.the service and the communication vehicle must be continuously available

Cloud Computing can fulfill the need:1.Cluster:ethernet switch->scalable

2.virtual machine: multiple apps can share hardware with each app



**Public Cloud Services**

Idea:Public cloud services offers computing, storage, and communication at pennies per hour

Beautiful Code: easy to evolve

Legacy code: meet customer need





Ruby

a = [1, 4.3, "hello", 3..7]

a[6] = 1 -> a = [1, 4.3, "hello", 3..7,nil,nil,6]



equivalent:

array.each do |x| puts x end           <==>   1. array.each { |x| puts x }    2. for x in array	puts x end

!!     Cannot use "i++", "--i" but can use "i += 1", "i -= 1"



Blocks

Defined by curly braces {} or do/end statement



Collection:

[1, 2, 3].**each do** |n| text = "Current number is: #{n}" **puts** textEnd



Class:

global:$ or @@

instance variable:@

use new to create an object

use  

```
def initialize 
```

to create a method

other method can take their own parameter

setter&getter

```
def website
  @website
end
```

```
def website=(website)
  @website = website
 end
```

and &&

&& is fine

and has lower precedence after than =, it should be treated as **control flow operators**

and is useful for chaining related operations together until one of them returns nil or false

A = B and C   if B is triggered then C is triggered , if B can't then C can't, for boolean B C , A =B

A = B or C if B can't trigger then C trigger, if B trigger then C can't trigger, for boolean B C, A = B 





Module

modules can not be instantiated. I.e., it is not possible to create objects from a module. Thus it doesn't have new method. This is useful if we have methods that we want to reuse in certain classes, but also want to keep them in a central place.

```
module Cream
  def cream?
    true
  end
end

class Cookie
  include Cream
end

cookie = Cookie.new
p cookie.cream?
```



Enumerable

The `Enumerable` mixin provides collection classes with several traversal and searching methods, and with the ability to sort.



URI

```
 userinfo       host      port
          ┌──┴───┐ ┌──────┴──────┐ ┌┴┐
  https://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top
  └─┬─┘   └───────────┬──────────────┘└───────┬───────┘ └───────────┬─────────────┘ └┬┘
  scheme          authority                  path                 query           fragment
```

URL is a URI that specifies the means of acting upon or obtaining the representation of a resource

EX:

URL `http://example.org/wiki/Main_Page`

 resource identified as `/wiki/Main_Page` which is in the form of HTML

way to obtain: http

network host domain name: example.org

# Chapter 3: SaaS Application Architecture: Microservices, APIs, and REST

• SaaS apps follow the client-server pattern

• Hypertext Transfer Protocol (HTTP), a request-reply protocol over which Web content is delivered, and Universal Resource Identifiers (URIs), which name a particular resource on the Web and may specify parameters (options) for accessing it. 

• A basic building block of SaaS is an HTTP route,(has method GET or POST with a URI)

 Shift of Web: a collection of static resources----> a collection of programs (services) that could be remotely accessed via SaaS app. --->number of microservices rocketed

 An Application Programming Interface (API) for a microservice is a formal description of the operations the microservice can do.  "API first" design --> thinking about the app in terms of its smaller components and the APIs by which they communicate --->more modular design

 • Since most mobile apps are just SaaS clients, the API-first design is an ideal complement to the mobile-first design stance.

Cascading Style Sheets: **a simple mechanism for adding style** (e.g., fonts, colors, spacing) to Web documents

#### 3.1 The Web’s Client–Server Architecture 

SaaS based on Web protocols is a client-server architecture: clients are programs whose job is asking servers for information and allowing user interactions, and servers are programs whose job is efficiently serving large numbers of clients 

peer-to-peer architecture: Peer-to-peer architecture (P2P) is a computer networking architecture in which each workstation, or node, has the same capabilities and responsibilities. <------->client/server architecture, in which some computers are dedicated to serving others.

Conclusion:

SaaS Web apps are examples of the client-server architectural pattern, in which client software is typically specialized for interacting with the user and sending requests to the server on the user’s behalf, and the server software is specialized for handling large volumes of such requests. 



• Web’s heritage as a fundamentally client-server architecture.

• Web apps use open standards-->anyone can implement royalty-free, different from proprietary standards used by older client-server apps.

 • An alternative to client-server is peer-to-peer. While arguably more flexible, this architecture makes it difficult to specialize the software to do either job really well



#### 3.2 SaaS Communication Uses HTTP Routes 

network protocol: a set of communication rules on which agents participating in a network agree

The fundamental protocol: TCP/IP. It allows a pair of communicating agents to exchange ordered sequences of bytes in both directions simultaneously(TCP/IP doesn’t distinguish the roles of the agents)

It is up to the individual programs communicating over a TCP/IP connection to determine the rules of communication. The rules are defined by HTTP, the HyperText Transfer Protocol

By TCP/IP , Each computer is assigned an IP address consisting of four bytes separated by dots(136.152.143.69)

Use a service called Domain Name system to avoid using IP address directly. It will map hostname to IP address. When you type a site name ('www.shanghaitech.edu') into your browser’s address bar, the browser automatically contacts a DNS server to translate that name into an IP address(So DNS is a client–server protocol)

Because multiple TCP/IP-based programs can be running on the same computer simultaneously-->IP is not enough to distinguish-->establishing a TCP/IP connection also requires a port number to indicate which program on the server is the intended communication partner. Some program must be listening to that port number on the server in order to accept connections

The default ports for production Web servers are 80 for HTTP and 443 for HTTPS



HTTP protocol:

1. The client initiates a TCP/IP connection to a server by specifying the IP address and port number. If the computer at that IP address does not have an HTTP server process listening on the specified port, the client immediately experiences an error(like  “Connection refused.”)

2. if connection succeeds, the client will sends an HTTP request describing its intention to perform some operation on a resource. A resource is any entity that the server app manipulates(like image, form submmision)

3. The server delivers an HTTP response-->satisfying the client’s request or reporting any errors that prevented the request from succeeding. 

   

   !!!The response may also include information in the form of an HTTP cookie

elements of  HTTP request :a route, zero or more headers, and possibly a request body(they are strings sent over the TCP/IP connection).

an HTTP route consists of an HTTP method— usually, one of GET, POST, PUT, PATCH, or DELETE—plus a URI.

!! same URI with different HTTP methods can have different meanings to a SaaS app

URI usually begins with http://

EX:

GET(HTTP METHOD) http(scheme)://srch.com(hostname):80(port)/main/search(resource path)?q=cloud&lang=en(query terms:"key=value")#top(fragment)



GET typically means “deliver a copy of the resource to the client without modifying the resource or causing any side effects,” 

POST, PUT, PATCH, DELETE are typically used to perform an operation that creates, modifies, or deletes a resource.

 HTTP is a request-response protocol: every HTTP interaction begins with the client making a request, to which the server delivers a response. 

The HTTP request must include the route and HTTP protocol version, and usually also includes some request headers that provide information about the client.

 The HTTP protocol version tells the server which HTTP features the client can understand, so that (for example) servers can avoid using newer HTTP features if the client only understands an older protocol version. 

status code: 2xx(all is well) 3xx(resource moved) 4xx(forbidden,not found:client error) 5xx(server error)

HTTP is a stateless protocol: every HTTP request is independent of and unrelated to all previous requests.

--> so we need cookie to identify clients-->

##### cookie

a mechanism provided by HTTP. The first time a client makes a request from a particular server, the server can include in the response a Set-Cookie: header, containing a chunk of information that the server can use to identify this client on future HTTP requests.

It is the client’s responsibility to store that information and pass it back via a Cookie: header on every subsequent request to that same server.

#### 3.3 CHIPS: HTTP and URIs 

#### 3.4 From Web Sites to Microservices: Service-Oriented Architecture 

AJAX(Asynchronous JavaScript And XML):  a technique for creating fast and dynamic web pages. AJAX allows web pages to be updated asynchronously by exchanging small amounts of data with the server behind the scenes. This means that it is possible to update parts of a web page, without reloading the whole page.

In response of AJAX request, the server returns data structure in either XML or JSON format

Change of perspective: client: receiving HTML pages and functioning primarily as a display engine-->client: calling a function on the remote server and expecting some data

-->Service Oriented Architecture (SOA) ：Service Oriented Architecture (SOA) just means an approach to software development in which subsystems can only access each others’ data via external interfaces.

feature of SOA: the only way one service can name or access another service’s data is to request specific operations on that data through an external interface that provides those operations

microservice : a standalone service that performs just one type of task, and is specifically designed to be accessible from and absorb into the functionality of any other outside service



Pro:

1. Reusability: Others can recombine existing services to create new apps(1 productivity mechanism)

2. Easier testing

3. More Agile-friendly: SOA allows large services to be created by composing smaller ones which can be handled by small teams

4. improved more quickly since the teams for testing, developing... are same tightly-knit

Con:

1. Performance: each invocation of a service involves the higher cost of wading through the deeper software stack of a network interface

2. some services may fail while others are working, making dependability more challenging.

3. you must design and implement an interface for each service component

4. Developers must learn about operations

   

2 notes:!!!!!!

1. a microservice should perform a related set of operations on a well-circumscribed set of resources, should be independently deployed and operated, and should be designed to be readily incorporated with other external services
2. Precondition of SOA: each service provides a well-defined set of operations on one or a few related types of resources

#### 3.5 RESTful APIs: Everything is a Resource 

Application Programming Interface（API）：refers to the “contract” between a caller and callee(2 applications). a software intermediary that allows two applications to talk to each other.

Representational state transfer (REST):  a software architectural style that was created to guide the design and development of the architecture for the World Wide Web. A way of mapping requests to actions that is particularly well suited to a service-oriented architecture

!!!represent the various entities manipulated by a Web app as resources to make them represntational.  and to construct routes so that any HTTP request would contain all the information necessary to identify both a resource and the action to be performed on it

The REST architectural style emphasizes the scalability of interactions between components, uniform interfaces, independent deployment of components, and the creation of a layered architecture to facilitate caching components to reduce user-perceived latency, enforce security, and encapsulate legacy systems.

RESTful URI   GET /user/301/welcome     Non-RESTful URI  GET /welcome

purest RESTful API defines only 5 operations: Create instance;Retrieve a copy of resource;Update a source;Delete source;List desired source of specific feature



RESTful APIs observe several conventions for how those parts of the URI are constructed when making an API call:

1. hostname component of the URI--->which server provides the service

2. servers providing RESTful API usually have base URI prepended to all API calls

3. The URI path components following the prefix specify the operation to be performed and the resource on which to perform it

4. provide version number allows the API to evolve while preserving compatibility with older clients

   

!!!!!usually structure of the URI path itself reveals information about the relationships among resource types

• To treat one or more SaaS apps as “services” that can accept remote procedure calls on behalf of a client, we need to be able to identify the service, identify which operation (which function) is to be called, pass data to and receive data from the service, and handle errors. 

 • The key idea of REST is to represent each type of thing managed by the service as a resource, and provide a limited set of operations (5 basic operations) that can be performed on a resource. 

REST API

ex:

a REST API would use a GET request to retrieve a record, a POST request to create one, a PUT request to update a record, and a DELETE request to delete one.

#### 3.6 RESTful URIs, API Calls, and JSON 

3 ways for HTTP client to pass parameters to a service:

1. through URI(especially when the parameters belong to simple type)
2. through request body(for complex data)
3. value of HTTP header

How is this data presented to the server?

usually json

APIs require authorization to prove that client has right to make API calls. The most common scheme is include a client-specific API key with each request.

!!API key is a required URI parameter for every request

To make HTTP more RESTful is make HTTP routes is to encode resource and operation through the HTTP method (GET, POST, and so on) and the URI path

For GET requests, optional arguments can be encoded in the URI itself (?param1=value1&...paramN=valueN). 

For POST or PUT requests, typically used for form submission, both the form’s field values and additional optional arguments can be transmitted as part of the request body. 

Requests to a service may require that the client present some credentials to prove it is authorized to use the service. The simplest scheme is HTTP Basic Authentication, in which a username and password (collected from browser) are embedded in the HTTP headers. 

#### 3.7 CHIPS: Create and Deploy a Simple SaaS App 

#### 3.8 Fallacies and Pitfalls 

#### 3.9 Concluding Remarks: Continuity From CGI to SOA 

Common Gateway Interface: an interface specification that enables [web servers](https://en.wikipedia.org/wiki/Web_server) to execute an external program, typically to process user requests.

Basically, CGI works like this: **A reader sends a URL that causes the AOLserver to use CGI to run a program**. The AOLserver passes input from the reader to the program and output from the program back to the reader.



# Chapter 4 : SaaS Framework: Rails as a Model View Controller Framework

In the Rails implementation of MVC, models are stored in a relational database using the Active Record design pattern. 

Views, which allow users to see and interact with the data, use the Template View pattern to create HTML or JSON representations of the app's resources (models). 

Controllers, which mediate interaction between the views and models, follow Representational State Transfer (REST), in which each controller action describes a single self-contained operation on one of the app's resources.

convention over configuration: one design pattern--->reduce numbers of decisions for developers with  flexibility, so a developer only needs to specify unconventional aspects of the application)

#### 4.1 The Model–View–Controller (MVC) Architecture 

Each Rails model is a resource type whose instances are rows in a particular table of a relational db. These DB operations are exposed to the developer via **Active Record**

Goal of MVC design pattern: separate organization of resource(model) from UI&presentation(view) by introducing controller

view<------(human view,directives for rendering data)----->controller<-----(read data&update data)--->Model(Model data provided to view through controller)

!!!model code is invoked only by the controller when needed

each resource has a model, controller and set of views

The views serve as the interface between the system’s users and its data

how controllers mediate the interaction in both directions?

1. when a user interacts with a view, a specific controller action corresponding to that user activity is invoked
2. The controller can ask the model to retrieve or modify information
3. the controller decides what view will be presented next to the user and supply necessary infomation

An application organized according to MVC consists of three main types of code.

Definition of Model: Models are concerned with the data manipulated by the application: how to store it, how to operate on it, and how to change it(data)

Details:

1. Rails is designed to support apps that follow the Model–View–Controller pattern

2. Each Rails model is a resource type whose instances are rows in a particular table of a relational database

Views are presented to the user and contain information about the models with which users can interact. The views serve as the interface between the system’s users and its data;

The actions defined in that controller can handle each type of user interaction

Rails uses convention over configuration a lot!!!

Rails needs a way to map an HTTP route to code in the app that performs the correct action.

#### 4.2 Rails Models: Databases and Active Record 

For SaaS applications, two requirements:

1. The app can store different types of data items
2. The app can express relationships among different kinds of entities



the key questions to address in order to understand the role of the database in the Rails Model–View–Controller architecture are as follows:

1. What is the correspondence between how an instance of a resource is stored in the database and how it is represented in the programming language used by the framework(Ruby)?

2. What software mechanisms mediate between those two representations, and what programming abstractions do those mechanisms expose?

the answer is that Rails implements the Active Record architectural pattern. An Active Record refers to the pattern itself; Active Record refers to the code module that instantiates the pattern in the Rails framework. instance of the class corresponds to a single row in that table. The model has built-in behaviors that directly operate on the database:

• Create a new row in the table (representing a new object),

• Read an existing row into a single object instance, 

• Update an existing row with new attribute values from a modified object instance, 

• Delete a row (destroying the object’s data forever).



(CURD)

ActiveRecord Architectural Pattern:

Rails models are classes that are backed by a table in the RDBMSs such that an instance of the class corresponds to a single row in the table. 

easy interaction between the logic and persistence layers (generate SQL statements at runtime)

built-in functionality to perform CRUDI operations 

1. A **URI is an **identifier of a specific resource. Like a page, or book, or a document.
2. A **URL** is special type of identifier **that also tells you how to access it**, such as `HTTPs`, `FTP`, etc.—like **https://**www.google.com.
3. If the protocol (`https`, `ftp`, etc.) is either present or implied for a domain, **you should call it a URL**—even though it’s also a **URI**.

a class that descends from Rails’ ActiveRecord::Base class provides all the necessary machinery to “connect” the model to the database:

1. The directory app/models is expected to contain one Ruby code file per model.
2. The database table name is determined by converting the model’s class name to lower case and pluralizing it

 the only thing this class definition doesn’t do is create the actual table in the database

##### migration

a Ruby script describing a set of changes to make to the database schema

Migrations can be expressed in a way that is independent of minor syntactic differences between different underlying databases., Migrations allow "versioning" the database schema analogously to how code is versioned.





URI(identifier) contains URN(name) and URL(locator)

Why use migrations rather than directly issuing SQL?

Rails provide 3 environment. development (when you’re coding), production (the live app containing real customer data), and test (running automated tests)

Changing the database schema, including creating the tables needed by your models, is accomplished by creating and running migrations------->

one example of migration:

```
class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
```

This migration adds a table called `products` with a string column called `name` and a text column called `description`. A primary key column called `id` will also be added implicitly, as it's the default primary key for all Active Record models. The `timestamps` macro adds two columns, `created_at` and `updated_at`

#### 4.4 Routes, Controllers, and Views (views that display data to the user)

Routing to controller: Each HTTP request incoming must be mapped to the appropriate controller and action (method). This mapping is called a route.Each controller action is handled by a particular Ruby method in a controller file



Params[] Hash in Rails: Parameters in some routes (like id to show a movie instance, or form of new instance attributes being sent as a post request) can be accessed by the Controller using params[] hash.Params[:movie] itself is a hash of key-value pairs corresponding to the Movie object’s attributes

Routes map incoming URL's CONTROLLER ACTIONS AND EXTRACT ANY OPTIONAL PARAMETERS



Controller action set instance variables, visible to views

Controller action eventually renders a view

Although redirection triggers the browser to start a brand-new HTTP request, the flash can be used to save a small amount of information that will be made available to that new request, for example, to display useful information to the user regarding the redirect

Convention over Configuration: If naming follow certain conventions, no need for config files 

EX:

action show for resource movies is handled by MovieController#show(show method in movie_controller.rb) and renders views/movies/show.<fmt>.<processor>

When that HTML form is submitted, a controller action will need to parse the form data and do something with it

For example, the route for show will appear as GET /movies/:id, which tells us that params[:id] will hold the actual ID value parsed from the URI. Params[:movie], is itself a hash of key/value pairs corresponding to a Movie object’s attributes and their desired values.

The most common way to finish a controller action is to render a view of that action

Seven standard controller actions:Index new create show edit update Destroy

Briefly explain how an HTML form is submitted to a server. What happens when the submit button is clicked and what is the role of a web framework like Rails or Sinatra in handling form submissions?

-When the user types all the information and click to trigger submit, it will submit the form data to the form handler on the server. The handler will process the input data. Rails will help to build the form. When the form is submitted, the name will pass along with form data. Together with user input, they will make their way to the controller. Rails will also provide a series of helpers for generating form elements.

(Rails/Sinatra provides framework to both send the form into to the server and save the form info in a easy to store format such as key-value pairs/json in a useful hash-like collection)

#### 4.6 Forms (views that collect data from the user)

The filename suffixes for these views are different in Rails than they were in the Sinatra app. What information does the rightmost suffix of the filename (e.g.: in foobar.abc.xyz, the suffix .xyz) tell you about the file contents?

nested transformations. File first goes through .xyz parser which replaces the .xyz code with appropriate .abc code.

GET--- index,new,edit,show  POST--create   PUT-update   DELETE-destroy

create HTML form:

movies_path(helper_method)      /movies(URI returned) GET /movies  index(RESTful route and action)

The Index action just shows a list of all the movies

1. The route GET /movies/new names the action, and the route helper new_movie_path will generate the URI portion of the route;
2. The action will be handled by the method MoviesController#new;
3. By default, the controller action will end by rendering a view app/views/movies/ new.html.erb.



• When creating a form, you specify the controller action that will receive the form submission by passing form_tag the appropriate RESTful URI and HTTP method . It’s convenient to use RESTful URI helpers like movies_path and edit_movie_path rather than creating the URIs manually

•form is submitted--> controller action can inspect params[], whose keys are the form field names and whose values are the user-supplied contents of the fields. If you use Rails form helpers, the field names are chosen such that params[:model] is a hash whose keys and values are the user-supplied values for an instance of model.

• When creating or updating a model object, for user friendliness it’s common to simply redirect_to a view such as index.

• When finishing a controller action using a redirect, flash[:notice] or flash[:alert] can be set to a message that will persist until the next request. they get displayed no matter where the redirect points.



!!!!! Each request needs exactly one reply. Render and redirect are two different ways to reply to a request

session[], whose contents persist “forever” across requests from the same browser

Ruby: hash(Class)

A Hash maps each of its unique keys to a specific value.

A Hash has certain similarities to an Array, but:

- An Array index is always an Integer.
- A Hash key can be (almost) any object.



#### 4.8 Debugging: When Things Go Wrong 



TIDE:

1. Trace the source of the error as closely as possible by really examining the error message(s) and log file(s) closely. 

2. Instrument the code near the error, such as by inserting statements to print intermediate values of variables, to see where things go off the rails (so to speak). 

3. Debug interactively using the facilities provided in your language or framework, such as the byebug gem for Ruby, so you can inspect and modify application state around the bug. 

4. Explore question boards such as StackOverflow for similar bugs, and if all else fails, post a question there and ask for help.

   

byebug(ruby interactive debugger):

n  next line

s  step into block or methods

f  finish current method call and return

ps expr  print and evaluate expression

up   go up to caller stack frame

down   go down to callee's stack frame

b  num||method    set a break point or break when method called

c  continue

Best: the developer provided specific information, such as the name and version of their operating system, the specific commands they successfully ran, and the unexpected error that resulted. Other helpful voices chimed in asking for specific additional information, and by 7:10pm, two of the answers had identified the problem



• Use a language-aware editor with syntax highlighting and automatic indentation to help find syntax errors. 

• Instrument your app by inserting the output of debug or inspect into views, or by making them the argument of raise, which will cause a runtime exception that will display message as a Web page. 

• To debug using the interactive debugger, make sure your app’s Gemfile includes byebug and place the statement byebug at the point in your code where you want to break.

logger method is useful to collect instrumentation or diagnostic information once your app is deployed and in production



#### 4.10 Fallacies and Pitfalls 

#### 4.11 Concluding Remarks: Rails as a Service Framework 

# Quiz 3

### JavaScript

#### Approaches

1. add JS to HTML/CSS pages to enhance user experience
2. single page application(it interacts with the user by dynamically rewriting the current web page with new data from the web server
3. write client-side side app, can be worked offline
4. server side app with JS framework
5. ...

|                                          | Ruby                                                         | JS                                                           |
| ---------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
|                                          | Server                                                       | Browser                                                      |
| Frame                                    | Rails                                                        | jQuery                                                       |
| Client-Server architecture               | Controller will receive request, interact with database via model and render the view | Browser fetches JS file from server. JS code executed on specific events eg clicks. JS fetches data from Rails app and updates the browser |
| Specify list of third-party dependencies | Gemfile                                                      | package.js                                                   |
| Test                                     | rspec                                                        | jasmine                                                      |
| Debugging                                | Byebug                                                       | Browser console                                              |
| Access other methods                     | self                                                         | this                                                         |
| Declare functions                        | def ..                                                       | function ..                                                  |

#### types

1 Primitives:

1. String
2. Number
3. undefined
4. null
5. BigInt
6. Boolean
7. Symbol

2 Object(like ruby hash)

#### function

In JS, functions are objects. Thus, they have properties and methods. The only difference with objects is that functions can be called.

They can be anonymous, They always return a value, even if that value might be `undefined`, They can be passed a function as an argument

A JavaScript function is a block of code that will be executed when you call it. Because JavaScript functions are first-class objects, you can pass functions to other functions as variables

```javascript
function name(parameter1, parameter2, parameter3) {
  // code to be executed
}
//you should only capitalise the first character of the name of a function when you need to construct the object by "new" keyword
function Book(type, author) {...}
```

#### Object

```javascript
const car = {type:"Fiat", model:"500", color:"white"};
//let:the variable will be used only in the block it’s defined in
//let can be updated within its scope. Unlike var, a let variable cannot be re-declared #within its scope
    let greeting = "say Hi";
    if (true) {
        let greeting = "say Hello instead";
        console.log(greeting); // "say Hello instead"
    }
    console.log(greeting); // "say Hi"
    
    
//const:like static
//const cannot be updated or re-declared
//var:
```

#### This

In the global execution context (outside of any function), `this` refers to the global object whether in strict mode or not.(like window)

### Filters

Filters are methods that are run "before", "after" or "around" a controller action

'Before' filter

```ruby
class ApplicationController < ActionController::Base
  before_action :require_login

  private
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url # halts request cycle
    end
  end
end
```



### Callback

Callbacks are functions that are passed into other functions as arguments with the intention to execute them later.

```javascript
function greeting(name) {
  alert('Hello ' + name);
}

function processUserInput(callback) {
  var name = prompt('Please enter your name.');
  callback(name);
}

processUserInput(greeting);
```

Callbacks allow you to trigger logic before or after an alteration of an object's state. Need to define some functions

after_save before_save

```ruby
class Movie < ActiveRecord :: Base
before_save : capitalize_title
  def capitalize_title
    self . title = self . title . split (/\ s +/) . map (&: downcase ).
    map (&: capitalize ) . join (' ')
  end
end
# now try in console :
m = Movie . create !(: title => 'STAR wars ', : release_date => '27 -5 -1977 ', :
rating => 'PG ')
m. title # => " Star Wars "
```

### Event

It contains events on arbitrary element and user-editable controls

While some are triggered by user actions on DOM elements, others relate to the operation of the browser itself or to “pseudo-UI” events

If the element has a event handler, the handler run first. If it returns true, the built-in behavior run next. Otherwise, the built-in behavior is suppressed. Then the parent in the DOM will respond the to the event handler

How to do this?

1. Identify the DOM element we want to operate on(make it be selectable with $())(can be achieved by modifying the view)
2. define JS function so that we can operate on them
3. Use setup function to bind the function to the element and do some DOM operation
4. Arrange to call the setup function once the document is loaded.

### Event Loop

In the event loop, we check the call stacks and add new operations if it's empty.  Then it will send call to API and API will send the operation to event queue and start a new loop. 

### Private&Protected

private method in class can only be called within the class but not outside the class(like an instance of class)

### Controller

A controller is a Ruby class which inherits from `ApplicationController`

```ruby
class ClientsController < ApplicationController
  def new
      @client = Client.new # @client instance variable accessible in the view
  end
end
# If a user goes to /clients/new in your application to add a new client, Rails will create an instance of ClientsController and call its new method
# Rails will by default render the new.html.erb view
```

### Parameters

two kinds of parameters possible in a web application.

1) parameters that are sent as part of the URL, called query string parameters

2. The second type of parameter is usually referred to as POST data. This information usually comes from an HTML form which has been filled in by the user

The `params` hash is not limited to one-dimensional keys and values. It can contain nested arrays and hashes.

Inside your **controller action’s** you can call `params` to **access form & URL query data**

```ruby
params[:id]
# you will get id if it exists or nil if not
```

```html
# form_for(@book) with a few fields generates something like this
<form action="/books">
  <input type="text" name="book[title]" id="book_title">
  <input type="text" name="book[author]" id="book_author">
  <input type="text" name="book[cover]" id="book_cover">
  <select name="book[language]" id="book_language">
    <option value="English">English</option>
    <option value="Spanish">Spanish</option>
    <option value="French">French</option>
  </select>
  <button type="submit">Create</button>
</form>
```

```ruby
{
  "book"=>
    {
      "title"=>"",
      "author"=>"",
      "cover"=>"",
      "language"=>"English"
    }
}
# From the controller, we can access data like this
params[:book][:language]
# "English"
params[:book][:author]
```



### form_tag

Starts a form tag that points the action to a url, default to POST

```
form_tag('/posts')
# => <form action="/posts" method="post">

form_tag('/posts/1', method: :put)
# => <form action="/posts/1" method="post"> ... <input name="_method" type="hidden" value="put" /> ...
```

```html
<h2>Create New Movie</h2>

<%= form_tag movies_path, :class => 'form' do %>
  <%= label :movie, :title, 'Title', :class => 'col-form-label' %>
  <%= text_field :movie, :title, :class => 'form-control' %>
  <%= label :movie, :rating, 'Rating', :class => 'col-form-label'  %>
  <%= select :movie, :rating, ['G','PG','PG-13','R','NC-17'], {}, {:class => 'form-control col-1'} %>
  <%= label :movie, :release_date, 'Released On', :class => 'col-form-label'  %>
  <%= date_select :movie, :release_date, {}, :class => 'form-control col-2 d-inline' %>
  <br/>
  <%= submit_tag 'Save Changes', :class => 'btn btn-primary' %>
  <%= link_to 'Cancel', movies_path, :class => 'btn btn-secondary' %>
<% end %>
```

```
<h1> Add a New Book</h1>

<%= form_tag  books_path , method: :post, class: ‘form’ do %>
    <%= label :book, :title, ‘Title’,  class:  ‘form-control’ %>
    <%= text_field  :book, :title, class:  ‘form-control’ %>
    <%= label :book, :status, Status,  class:  ‘form-control’ %>
    <%= select_tag  :book, :status, [:available, :checked_out], class: ‘form-control’ %>
    <%= label :book, :issue_date, ‘Issue Date’,  class: ‘form-control’ %>
    <%= date_select   :book, issue_date, class: ‘form-control’ %>
    <%= submit_tag  ‘Save Changes’ %>
<% end %>
```



### Validation

Where should this exception be raised and rescued? model, controller

validations are run only when the object is saved or call instance method valid?(create or save will use it but new will not)

```ruby
#Validation errors are recorded in the ActiveModel::Errors
university.errors[:name] # => [“cannot be nil”]
```

#### do sth like exception in python

use create! to throw an error

```ruby
def create
  begin
    university = University.create!(uni_params)
    redirect_to :action => “show”, :id => university.id
  rescue ActiveRecord::RecordInvalid
    flash[:alert] = “Please input a valid university!”
    redirect_to :action => “new”
  end
end

#or you don't need to use create! instead just use the valid
def create
  university = University.new(uni_params)
  if university.valid?
    university.save!
    redirect_to :action => “show”, :id => university.id
    if !university.errors[:rank].empty?# if :rank exists
      flash[:alert] = “Rank “ + university.errors[:rank].first
    else # missing required name
      flash[:alert] = “Name “ + university.errors[:name].first
    end
    redirect_to :action => “new”
  end
end

#validation method
class Invoice < ApplicationRecord
  validate :active_customer, on: :create

  def active_customer
    errors.add(:customer_id, "is not active") unless customer.active?
  end
end
```



```ruby
class Person < ApplicationRecord
  validates :name, presence: true
end
```

check if a value is included in an array using the `inclusion:`(or check whether it's not in use `exclusion:`) If not, it will not save to the database

```
class Country < ApplicationRecord
  validates :continent, inclusion: { in: %w(Africa Antartica Asia Australia
                                            Europe North America South America) }
end
```

### %w

Create a array of string split by white space

```
%w[hello billing confirmation]--->["hello", "billing", "confirmation"]
```

### Partial Views

Compared with a normal view(master view), partial view is **only a portion of page or a small markup which don't have** master page

First cut one frequently used part from a view and store it in a new html file. Then use @Html.Partial()

which returns a html string.

```html
</head>
<body>
    
    @Html.Partial("_MenuBar")<---like this
    
    @* you can modify result as below   *@
    @* var result = Html.Partial("_MenuBar") *@
    <div class="container body-content">
```



Convention over configuration:

1. Names must begin with an underscore.(_university_entry.html.erb)
2. syntax to render a view(render partial: 'layouts/footer'-->Render this partial file: app/views/layouts/_footer.html.erb)
3. Has a local variable with the same name as the partial(The variable university_entry in _university_entry.html.erb)

```erb
<%= render partial: 'university_entry', collection: @universities %>
#Render the partial _university_entry.html.erb for every entry in our collection. In index.html.erb
```



### Symbols

It looks like this

```
:testing
```

symbols is to **represent method & instance variable names**.

```
attr_reader :title
```

The `:title` after attr_reader is a symbol that represents the `@title` 

use symbol as **names** or labels for things

### SSO and Third-Party-Authentication

one way to be DRY: avoid implement functionality that provided with other sevices.

SSO process(single source allow them to sign in multiple services):

1. user clicks link
2. go to a login page served securely by the provider(For example, when a third-party website prompts end users to log in with their Google Account, Google Sign-In is the identity provider.)
3. user can login to the provider and decide what privileges to grant the requesting app

The interaction only involves user and provider(no app)

4. If authentication succeeded, provider generates a HTTP route POST to app(the POST contains access token)

Or more precisely

1. A user browses to the application or website they want access to, aka, the Service Provider.
2. The Service Provider sends a token that contains some information about the user, like their email address, to the SSO system, aka, the Identity Provider, as part of a request to authenticate the user.
3. The Identity Provider first checks to see whether the user has already been authenticated, in which case it will grant the user access to the Service Provider application and skip to step 5.
4. If the user hasn’t logged in, they will be prompted to do so by providing the credentials required by the Identity Provider. This could simply be a username and password or it might include some other form of authentication like a One-Time Password (OTP).
5. Once the Identity Provider validates the credentials provided, it will send a token back to the Service Provider confirming a successful authentication.
6. This token is passed through the user’s browser to the Service Provider.
7. The token that is received by the Service Provider is validated according to the trust relationship that was set up between the Service Provider and the Identity Provider during the initial configuration.
8. The user is granted access to the Service Provider.

Then the app can 

	1. assume user has proved identity to the provider and app will record the provider’s persistent user-ID(use sessions)
	2. It can use the token to request further information about the user from the provider

```ruby
class ApplicationController < ActionController :: Base
  before_filter : set_current_user
  protected # prevents method from being invoked by a route
  def set_current_user
    @current_user ||= Moviegoer . where (: id = > session [: user_id ])
    redirect_to login_path and return unless @current_user
  end
end
```

```
1 get 'auth /: provider / callback ' => 'sessions # create '
2 get 'auth / failure ' => 'sessions # failure '
3 get 'auth / twitter ', : as => 'login '
4 post 'logout ' => 'sessions # destroy '

```

If 1 succeed, it will generate a GET to the create action in SessionsController. 3 will trigger a helper(login_path) to route to 3 and redirect to login page

Once successfully login, the create action remembers the user’s ID in the session until the destroy action is called to forget it

### Foreign Keys

a special mechanism relational databases provide to support associations. In rails, an *association* is a connection between two Active Record models

Rails migrations create tables whose primary key is id

The `has_many` association creates a one-to-many relationship with another model

A `has_one :through` association sets up a one-to-one connection with another model

A `has_many :through` association is often used to set up a many-to-many connection with another model

```ruby
class Physician < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments# patient don't need to have physician's id
end

class Appointment < ApplicationRecord
  belongs_to :physician
  belongs_to :patient
end

class Patient < ApplicationRecord
  has_many :appointments
  has_many :physicians, through: :appointments
end
```



```ruby
#association
class Author < ApplicationRecord
  has_many :books, dependent: :destroy #this means book table will save author_id. Specifies that the books belonging to a author should be deleted from the database if the author is destroyed
end
# always the 'owned' side save id
class Book < ApplicationRecord
  belongs_to :author
end
#create a new book 
@book = @author.books.create(published_at: Time.now)
#delete a book
@author.destroy
#if we don't use association, create new book
@book = Book.create(published_at: Time.now, author_id: @author.id)

#foreign keys
class CreateReviews < ActiveRecord :: Migration # this is a many-to-many association
  def change
    create_table 'reviews ' do |t |
      #t. integer 'potatoes '
	  #t. text 'comments '
        .....
	  t. references 'moviegoer '
	  t. references 'movie '
    end
  end
end

class Review < ActiveRecord :: Base
  belongs_to : movie
  belongs_to : moviegoer
end
#each review table has column movie_id, moviegoer_id 
m.reviews<<r1  #insert review r1 into movie m's review
r = m.reviews.create(:potatoes=>5) # build will not save automatically but create will
m = r.movie # get the movie assocaited with this view
r.movie = m # set this view's associated movie to m
```

### Through Association

Moviegoers are related to Movies through their reviews and vice versa

You can similarly add `has_many :moviegoers, :through=>:reviews` to the Movie model, and write `movie.moviegoers` to ask which moviegoers are associated with (wrote reviews for) a given movie.

### RESTful Routes for Associations

#### Helper Method

A helper is a method that is (mostly) used in your Rails views to share reusable code. Helper methods become available to all your views automatically

it's under app/helpers. You can add your own helpers

### DOM

DOM is a platform and language-neutral interface that will allow programs and scripts to dynamically access and update the content, structure and style of documentation. It represents the document as nodes and objects so that the language can interact with the page. It provides some methods like 'querySelectorAll'

It's on the client side

You can modify the DOM structure and any individual node with Javascript

In a browser’s view of a DOM the root of the tree is the “Document Object”

### jQuery

```
#Selector

# they are the same, it returns single element which id is movie
jQuery(’#movies’)
$(’#movies’)
# returns all the h1 elements whose CSS class is title
$(’h1.title’)
#hide an element with id="test"
$("#test").hide();
#hide class named test
$(".test").hide();
#hide all element
$("*").hide();
#hide all elements with an href attribute
$("[href]").hide();

#Events

#Use the on() method to attach a click event handler to all <p> elements
$("p").on("click", function(){  $(this).hide();});
#Use the correct event to hide all <p> elements with a "click"
$("p").click(function(){  $(this).hide();});
```

### jQuery event method

(event handler = callback)

| bind()    | attaches event handlers to elements                          |
| --------- | ------------------------------------------------------------ |
| click()   | trigger the click event                                      |
| on()      | attach event handler to event                                |
| ready()   | Specifies a function to execute when the DOM is fully loaded |
| trigger() | Triggers all events bound to the selected elements           |

```
$( "#foo" ).bind({
  click: function() {
    // Do something on click
  },
  mouseenter: function() {
    // Do something on mouseenter
  }
});

$( "#foo" ).bind( "click", function() {
  alert( "User clicked on 'foo.'" );
});
```

#### this

this is a html element. $(this) convert the DOM element represented by this to jquery element

### AJAX

The first "A" in AJAX stands for Asynchronous. The term "asynchronous" is used in this context to mean:

-->The callback handlers are said to run asynchronously because the server's response to an AJAX request can arrive at any time.

```
<div> is used to display information from a server.
<button> calls a function (if it is clicked)
```

How it works?

Browser(Create an XMLHttpRequest object and send HttpRequest)-->Server(process the HttpRequest create a response and send back to the user)-->Browser(process the returned data using JS and update page content) 

Unlike the normal client-sever mode, all you need to do is basically to expose a service that returns only the required informations to partially update the page.

AJAX uses both a browser built-in XMLHttpRequest object to get data from the web server and JavaScript and HTML DOM to display that content to the user.

jQuery.ajax()

```
ajax the jquery way
$.ajax({type: 'GET',
	url: URL,
	timeout: milliseconds,
	success: function,
	error: function
});
```

An AJAX interaction will usually involve three pieces of code: the handler that initiates the request, the callback that receives the response, and the code in the document.ready function (setup function) to bind the handler

```
var MoviePopup = {
  setup : function () {
  let popupDiv = $('< div id =" movieInfo " > </ div >');
  popupDiv . hide () . appendTo ($('body ')) ;
  $( document ) . on ('click ', '# movies a', MoviePopup . getMovieInfo );
  }
};
 $( MoviePopup . setup );
```



### XML

XML is used to store or transport data, while HTML is used to format and display the same data.

XML does not carry any information about how to be displayed.

### XHR(XMLHttpRequest)

use HTML create the http request

`XMLHttpRequest` (XHR) objects are used to interact with servers. You can retrieve data from a URL without having to do a full page refresh. This enables a Web page to update just part of a page without disrupting what the user is doing.

### SPA(single page application)

There are various techniques available that enable the browser to retain a single page even when the application requires server communication.

1. Document Hashes.
2. JavaScript frameworks.
3. Ajax.
4. WebSockets.
5. Server-sent events.
6. Browser plugins.
7. ...

### AOP(Aspect-oriented programming)

The programming methodology for DRYing out code by separating crosscutting concerns from the main code of the actions to which the concerns apply is called:AOP

# Appendix

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

you're not too confident in having consistent returns from the return value

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

#### Cucumber test

Scenarios are comforting to write and satisfying to run (when they pass) because they closely mimic what a real user would do. Indeed, that is why Cucumber tests have value both as validation—you built the right thing, because the test instantiates a user story created in collaboration with the customer—and verification—you built the thing right, because the test passes. However, one thing such tests don’t reveal is whether your code is well factored—whether the different subsystems exercised in the scenario are easily testable, let alone whether each has been thoroughly tested

#### Difference between cucumber and rspec

```
Cucumber:

	#articles.feature
	Given an article exists called "..."
	When I visit the list of articles
	Then I should see an article called "..."
	...
	#article_steps.rb
	Given /^an article exists called "(.+)"$/ do |title|
	  FactoryGirl.create(:article, title: title)
	end 
	When /^I visit the list of articles$/ do
	  visit articles_path
	end
	Then /^I should see an article called "(.+)"$/ do |title|
	  page.should have_content title
	end
	...	
Rspec

	describe "Articles" do
	  let(:article) { FactoryGirl.create(:article) }
	  context "Index Page" do
	    before { visit articles_path }
	    it { page.should have_content article.title }
	  end
	end
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

understand database schema

looking for available route

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

Or use Travis to eliminate code smell

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

# Quiz 5

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

#### Command pattern

Command pattern is a data driven design pattern and falls under behavioral pattern category. A request is wrapped under an object as command and passed to invoker object. Invoker object looks for the appropriate object which can handle this command and passes the command to the corresponding object which executes the command.

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

eager loading

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

The ability to perform a background request and update the HTML page in-place with the response relies on which of the following?

The browser exposing DOM manipulation methods via JavaScript, The browser exposing an ability to make an HTTP request in JavaScript





2.3

2.4