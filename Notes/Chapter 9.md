# Chapter 9: Software Maintenance: Enhancing Legacy Software Using Refactoring and Agile Methods

### 9.1 What Makes Code “Legacy” and How Can Agile Help? 

maintenance consists of four categories: Corrective maintenance: repairing defects and bugs; Perfective maintenance: expanding the software’s functionality to meet new customer requirements; Adaptive maintenance: coping with a changing operational environment even if no new functionality is added; for example, adapting to changes in the production hosting environment; Preventive maintenance: improving the software’s structure to increase future maintainability

#### refactoring

a process that changes the structure of code (hopefully improving it) without changing the code’s functionality

1. find places where you will need to make changes in the legacy system
2. add characterization tests that capture how the code works now, to establish a baseline “ground truth” before making any changes
3. Determine whether the change points require refactoring to make the existing code more testable or to accommodate the required changes
4. Once the code around the change points is well factored and well covered by tests, make the required changes

### 9.2  Exploring a Legacy Codebase 

1. check out a scratch branch(you need to run your app on a staging environment that won't affect users. the scratch branch will never be merged with main branch)
2. Learn and replicate the user stories
3. Exam the database
4. skim code to learn the code quality and test coverage

```
You can create an empty development database that has the same schema as the production database and then
populate it with fixtures
# on production computer :
 RAILS_ENV = production rake db : schema : dump
RAILS_ENV = production rake db : fixtures : extract4 
# copy db / schema . rb and test / fixtures /*. yml to development computer
# then , on development computer :
rake db : create # uses RAILS_ENV = development by default
rake db : schema : load
rake db : fixtures : load
```

Unified Modeling Language (UML): a diagram that shows associations

![image-20211114224849368](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211114224849368.png)

A 3-by-5 inch (or A7 size) Class–Responsibility–Collaborator (CRC) card representing the Voucher class from

![image-20211114225737738](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211114225737738.png)

### 9.3   Establishing Ground Truth With Characterization Tests 

To Cover and Modify when we lack tests, we first create characterization tests that capture how the code works now

#### characterization tests

tests written after the fact that capture and describe the actual, current behavior of a piece of software, even if that behavior has bugs

![image-20211114230702752](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211114230702752.png)

trick the method to reveal its behavior and hardware it into the test

### 9.4  Comments and Commits: Documenting Code 

a good comment tells what's not obvious about the code. It's higher level abstraction than code. They tells what the code does but not how to do it

Comments should raise the level of abstraction from the code, describing what a logical block of code does rather than providing line-by-line details.

Commits should include historical information about why the code is the way it is, but information that developers need while using the current code belongs in comments. If this leads to too many comments, your code may need cleanup

### 9.5  Metrics, Code Smells, and SOFA 

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



### 9.6  Method-Level Refactoring: Replacing Dependencies With Seams 

After refactoring, we may fail some testcases since we change the implementation. Make each refactoring step small enough that adjusting the tests to pass is easy.

### 9.7  The Plan-And-Document Perspective on Working With Legacy Code 

P&D 1/3 on development 2/3 on maintenance

Boards decide-Manage estimate cost per change-QA team gives cost of testing for change request-Documentation team gives cost of updating docs-Customer support group decide whether it's urgent

#### RE-Engineer

use automate tools to upgrade as SW ages and maintenance hard 

- change database schema
- improve documentation
- code analysis tools 
- programming language translation tools