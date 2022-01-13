# CHEATSHEET



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