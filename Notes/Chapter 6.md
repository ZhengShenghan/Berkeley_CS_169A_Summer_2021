# Chapter 6: Mobile and Desktop SaaS Clients: JavaScript Introduction

## 6.1 JavaScript: The Big Picture 

## 6.2 Introducing ECMAScript 

## 6.3 Classes, Functions and Constructors 

## 6.4 The Document Object Model (DOM) and jQuery 

The World Wide Web Consortium Document Object Model (W3C DOM) is a platform and language-neutral interface that will allow programs and scripts to dynamically access and update the content, structure and style of documentation

Whenever a new page is loaded, a new global window object is created that shares no data with the global objects of other visible pages.

#### Render

------

```python
When a browser sends a request to a server to fetch an HTML document, the server returns an HTML page in binary stream format which is basically a text file with the response header Content-Type set to the value text/html; charset=UTF-8
text/html tells the browser that it is an HTML document
charset=UTF-8 tells the browser that it is encoded in UTF-8 character encoding
Then the browser can convert the binary format into a readable text file
If this header is missing, the browser will render in plain text format.
If everything is OK, after this conversion, the browser can start reading the HTML document. 
```

For DOM

When the browser reads HTML code, whenever it encounters an HTML element like `html`, `body`, `div` etc., it creates a JavaScript object called a [**Node**](https://developer.mozilla.org/en-US/docs/Web/API/Node). Eventually, all HTML elements will be converted to JavaScript objects.

------



## 6.5 The DOM and Accessibility 

Accessibility is about ensuring that your users can interact with your app using a variety of input and output methods

One way to make the page friendly to assistive technologies that accomplish this is to clearly identify the logical role of each element in the page, not just its visual appearance

## 6.6 Events and Callbacks 

## 6.7 AJAX: Asynchronous JavaScript And XML 

## 6.8 Testing JavaScript and AJAX 

## 6.10 Single-Page Apps and JSON APIs 

