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

(COPY&PASTE michael says we are allowed to copy a few pages

• Web’s heritage as a fundamentally client-server architecture.

• Web apps use open standards-->anyone can implement royalty-free, different from proprietary standards used by older client-server apps.

 • An alternative to client-server is peer-to-peer. While arguably more flexible, this architecture makes it difficult to specialize the software to do either job really well

)

#### 3.2 SaaS Communication Uses HTTP Routes 

network protocol: a set of communication rules on which agents participating in a network agree

The fundamental protocol: TCP/IP. It allows a pair of communicating agents to exchange ordered sequences of bytes in both directions simultaneously(TCP/IP doesn’t distinguish the roles of the agents)

It is up to the individual programs communicating over a TCP/IP connection to determine the rules of communication. The rules are defined by HTTP, the HyperText Transfer Protocol

By TCP/IP , Each computer is assigned an IP address consisting of four bytes separated by dots(136.152.143.69)

Use a service called Domain Name system to avoid using IP address directly. It will map hostname to IP address. When you type a site name ('www.shanghaitech.edu') into your browser’s address bar, the browser automatically contacts a DNS server to translate that name into an IP address(So DNS is a client–server protocol)

Because multiple TCP/IP-based programs can be running on the same computer simultaneously-->IP is not enough to distinguish-->establishing a TCP/IP connection also requires a port number to indicate which program on the server is the intended communication partner. Some program must be listening to that port number on the server in order to accept connections

The default ports for production Web servers are 80 for HTTP and 443 for HTTPS

(COPY&PASTE

HTTP protocol:

1. The client initiates a TCP/IP connection to a server by specifying the IP address and port number. If the computer at that IP address does not have an HTTP server process listening on the specified port, the client immediately experiences an error(like  “Connection refused.”)

2. if connection succeeds, the client will sends an HTTP request describing its intention to perform some operation on a resource. A resource is any entity that the server app manipulates(like image, form submmision)

3. The server delivers an HTTP response-->satisfying the client’s request or reporting any errors that prevented the request from succeeding. 

   )

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

(COPY&PASTE

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

   )

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

(COPY&PASTE 

RESTful APIs observe several conventions for how those parts of the URI are constructed when making an API call:

1. hostname component of the URI--->which server provides the service

2. servers providing RESTful API usually have base URI prepended to all API calls

3. The URI path components following the prefix specify the operation to be performed and the resource on which to perform it

4. provide version number allows the API to evolve while preserving compatibility with older clients

   )

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

(COPY&PASTE michael says we are allowed to copy a few pages

the key questions to address in order to understand the role of the database in the Rails Model–View–Controller architecture are as follows:

1. What is the correspondence between how an instance of a resource is stored in the database and how it is represented in the programming language used by the framework(Ruby)?

2. What software mechanisms mediate between those two representations, and what programming abstractions do those mechanisms expose?

the answer is that Rails implements the Active Record architectural pattern. An Active Record refers to the pattern itself; Active Record refers to the code module that instantiates the pattern in the Rails framework. instance of the class corresponds to a single row in that table. The model has built-in behaviors that directly operate on the database:

• Create a new row in the table (representing a new object),

• Read an existing row into a single object instance, 

• Update an existing row with new attribute values from a modified object instance, 

• Delete a row (destroying the object’s data forever).

)

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

migration: a Ruby script describing a set of changes to make to the database schema

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

(COPY&PASTE 

Params[] Hash in Rails: Parameters in some routes (like id to show a movie instance, or form of new instance attributes being sent as a post request) can be accessed by the Controller using params[] hash.Params[:movie] itself is a hash of key-value pairs corresponding to the Movie object’s attributes

Routes map incoming URL's CONTROLLER ACTIONS AND EXTRACT ANY OPTIONAL PARAMETERS

)

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

（COPY&PASTE 

• When creating a form, you specify the controller action that will receive the form submission by passing form_tag the appropriate RESTful URI and HTTP method . It’s convenient to use RESTful URI helpers like movies_path and edit_movie_path rather than creating the URIs manually

•form is submitted--> controller action can inspect params[], whose keys are the form field names and whose values are the user-supplied contents of the fields. If you use Rails form helpers, the field names are chosen such that params[:model] is a hash whose keys and values are the user-supplied values for an instance of model.

• When creating or updating a model object, for user friendliness it’s common to simply redirect_to a view such as index.

• When finishing a controller action using a redirect, flash[:notice] or flash[:alert] can be set to a message that will persist until the next request. they get displayed no matter where the redirect points.

）

!!!!! Each request needs exactly one reply. Render and redirect are two different ways to reply to a request

session[], whose contents persist “forever” across requests from the same browser

Ruby: hash(Class)

A Hash maps each of its unique keys to a specific value.

A Hash has certain similarities to an Array, but:

- An Array index is always an Integer.
- A Hash key can be (almost) any object.



#### 4.8 Debugging: When Things Go Wrong 

(COPY&PASTE

TIDE:

1. Trace the source of the error as closely as possible by really examining the error message(s) and log file(s) closely. 

2. Instrument the code near the error, such as by inserting statements to print intermediate values of variables, to see where things go off the rails (so to speak). 

3. Debug interactively using the facilities provided in your language or framework, such as the byebug gem for Ruby, so you can inspect and modify application state around the bug. 

4. Explore question boards such as StackOverflow for similar bugs, and if all else fails, post a question there and ask for help.

   )

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

(COPY&PASTE

• Use a language-aware editor with syntax highlighting and automatic indentation to help find syntax errors. 

• Instrument your app by inserting the output of debug or inspect into views, or by making them the argument of raise, which will cause a runtime exception that will display message as a Web page. 

• To debug using the interactive debugger, make sure your app’s Gemfile includes byebug and place the statement byebug at the point in your code where you want to break.

logger method is useful to collect instrumentation or diagnostic information once your app is deployed and in production

)

#### 4.10 Fallacies and Pitfalls 

#### 4.11 Concluding Remarks: Rails as a Service Framework 