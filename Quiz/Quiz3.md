# Cheat Sheet

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



### Validation

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
