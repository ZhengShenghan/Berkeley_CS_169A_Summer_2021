# Module 8 Test-Driven Development

### 8.1 FIRST, TDD, and Red–Green–Refactor

#### Red–Green–Refactor

1. Before you write any code, write a test for one aspect of the behavior you expect the new code will have.
2. Before you write any code, write a test for one aspect of the behavior you expect the new code will have.
3. Before you write any code, write a test for one aspect of the behavior you expect the new code will have.
4. Refactor step: Look for opportunities to refactor either your code or your tests

![image-20211111225039115](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211111225039115.png)

#### FIRST

Fast: should be fast to run a subset of testcase

Independent: the order of the test doesn't matter

Repeatable: test shouldn't be dependable on external factors(like date, temperature)

Self-checking: each test should be able to determine on its own whether it passed or failed, rather than relying on humans to check its output

Timely: tests should be created or updated at the same time as the code being tested

### 8.2 Anatomy of a Test Case: Arrange, Act, Assert

system under test(SUT) refers to a system that is being tested for correct operation. 

leaf method: the method being tested does not call any other methods to help do its job

unit test: call a method, and verify some aspect of its behavior.

![image-20211111231741339](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211111231741339.png)

![image-20211111233839485](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211111233839485.png)

1. Arrange: create any necessary preconditions for the test case, such as setting values of variables that affect the behavior of the SUT. 
2.  Act: exercise the SUT. 
3.  Assert: verify that the result or behavior matches what was expected.

### 8.3 Isolating Code: Doubles and Seams

#### Seams

a place where you can alter behavior in your program without editing in that place

Seams are useful in testing because they let us break dependencies between a piece of code we want to test and its collaborators

#### Doubles

`double` is only useful for dealing with instances of the class, not the class itself

```ruby
  thing = double("thing", :a => "A")
  thing.a == "A" => true

  person = double("thing", :name => "Joe", :email => "joe@domain.com")
  person.name => "Joe"
  person.email => "joe@domain.com"
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
      cr = ClassRoom.new [student1,student2]
      expect(cr.list_student_names).to eq('John Smith,Jill Smith') 
   end 
end
#list_student_names method calls the name method on each Student object in its @students member variable. So we need Double which implements a name method
#It's also helpful for debugging. Since if we only define a 'dummy' class which behaves like student. Then if the test fails, we know that our ClassRoom is wrong
```



#### Mock

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

![image-20211114092246707](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211114092246707.png)

![image-20211114092307826](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211114092307826.png)

![image-20211114092324209](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211114092324209.png)



### 8.4 Stubbing the Internet

### 8.6 Fixtures and Factories

#### Factory

a **factory** is an object for creating other objects – formally a factory is a function or method that returns objects of a varying prototype or class from some method call, which is assumed to be "new".

quickly create valid instances of a class using some default attributes that you can selectively override for testing(you can choose your own attribute, set attribute only you care about. after test, it gets blown away so the test doesn't get polluted)

it's stored in spec / factories / movie. rb

Pros: can keep independent

Cons: complex relation may be hard to setup

![image-20211113202143015](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211113202143015.png)

#### Fixtures

a set of objects whose existence is guaranteed and fixed, and can be assumed by all test cases

a fixture file defines a set of objects that is **automatically loaded** into the test database before tests are run, so you can use those objects in your tests without first setting them up

every test now depends implicitly on the fixture state, so changing the fixtures might change the behavior of tests

Usually test for static data

It's stored in spec/fixtures/movies.yml

Pros: easy to see test data in one place. Truly static data or rarely change

Cons: may introduce dependency(ex: number of objects)

![image-20211113202153799](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211113202153799.png)

![image-20211114092335900](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211114092335900.png)

### 8.7 Coverage Concepts and Types of Tests

#### Code Coverage

a software testing metric that determines the number of lines of code that is successfully validated under a test procedure

S0 or Method coverage: Is every method executed at least once by the test suite?

S1 or Call coverage or Entry/Exit coverage: Has each method been called from every place it could be called?

C0 or Statement coverage: Is every statement of the source code executed at least once by the test suite.(We need to go to every if , but don't need to go into each one of them)

C1 or Branch coverage: Has each branch been taken in each direction at least once?(need to go into each statement)

C2 or Path coverage: Has every possible route through the code been executed?(go through every possibility of inputs)

#### Test

##### unit test

During this first round of testing, the program is submitted to assessments that focus on specific units or components of the software to determine whether each one is fully functional. The main aim of this endeavor is to determine whether the application functions as designed. In this phase, **a unit can refer to a function, individual program or even a procedure**

##### integration test

Integration testing allows individuals the opportunity to combine all of the units within a program and test them as a group. This testing level is designed to **find interface defects between the modules/functions**.(Find how they cooperate with each other)

##### system test

System testing is the first level in which **the complete application is tested as a whole**. The goal at this level is to evaluate whether the system has complied with all of the outlined requirements and to see that it meets Quality Standards.

##### acceptance test

The final level, Acceptance testing (or User Acceptance Testing), is conducted to **determine whether the system is ready for release**. 

![image-20211114095240248](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211114095240248.png)

##### Compatibility test

for testing the app’s UI in different browsers

##### Regression test

It ensures that previously-fixed bugs do not reappear

##### Smoke test

It consists of a minimal attempt to operate the software, to see whether anything is obviously wrong before running the rest of the test suite.

### 8.8 Other Testing Approaches and Terminology

 divide a piece of code into basic blocks, each of which executes from the beginning to the end with no possibility of branching, and then join these basic blocks into a graph in which conditionals in the code result in graph nodes with multiple out-edges

#### Black Box Test

It is based solely on the software’s external specifications

#### White Box Test

Its design reflects knowledge about the software’s implementation that is not implied by external specifications

A black-box test would specify a random set of key/value pairs to test this behavior, whereas a white-box test might exploit knowledge about the hash function to construct worst case test data that results in many hash collisions.

#### Fuzz Test

It consists of throwing random data at your application and seeing what breaks

### 8.10 The Plan-And-Document Perspective on Testing

#### three options on how to integrate the units and perform integration tests

##### 1.Top-Down

Start with the top structure of the tree. You can quickly get the high level function working(ie. UI). But you need to use many stubs since the lower functions haven't been implemented yet

##### 2.Bottom-Up

Start at the bottom of the dependency tree and works up. You don't need stub for this one, but you don't know what will the app be look like before you reach the top

##### 3.Sandwich

mix with 1 and 2. Try to reduce the amount of stubs and make the high level works sooner

#### Prove a formal method

only used when the repair of the cost is very high

##### automatic theorem proving  

Theorem proving uses a set of inference rules and a set of logical axioms to produce proofs from scratch.

##### model checking

Model checking verifies selected properties by exhaustive search of all possible states that a system could enter during execution

![image-20211114112743270](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211114112743270.png)