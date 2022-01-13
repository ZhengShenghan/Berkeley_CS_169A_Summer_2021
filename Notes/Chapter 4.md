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