# Chapter 11 Design Patterns for SaaS Apps

### 11.1 Patterns, Antipatterns, and SOLID Class Architecture 

#### design pattern

a reusable structure, behavior, strategy, or technique that captures a proven solution to a collection of similar problems by separating the things that change from those that stay the same

2 principles for OOD:

Prefer Composition and Delegation over Inheritance

Program to an Interface, not an Implementation

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
| Liskov substitution     | should preserve correct program behavior when substitute a subclass for a class | subclass destructively overrides an inherited method         | Replace inheritance with delegation                          |
| Injection of dependency | Collaborating classes depend on an intermediate “injected” dependency | constructors that hardwire a call to another class’s constructor | Inject a dependency on a shared interface to isolate the classes |
| Demeter principle       | speak only to a range of friends, others are treated as stangers | Inappropriate intimacy                                       | call the delegate methods instead                            |

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

![image-20211127235053085](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211127235053085.png)

![image-20211127235321876](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211127235321876.png)

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

#### Proxy

It implements same method as "real" service object, but "intercepts" each call

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