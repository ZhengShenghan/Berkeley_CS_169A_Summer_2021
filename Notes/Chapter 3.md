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