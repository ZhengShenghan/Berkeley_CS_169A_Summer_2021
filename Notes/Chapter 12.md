# Chapter 12 Dev/Ops

### 12.1 From Development to Deployment

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

### 12.2 Three-Tier Architecture

The three-tier architecture includes a presentation tier, which renders views and interacts with the user; a logic tier, which runs SaaS app code; and a persistence tier, which stores app data

HTTP’s statelessness allows the presentation and logic tiers to be shared-nothing, so cloud computing can be used to add more computers to each tier as demand requires. However, the persistence tier is harder to scale

#### 3-tier shared-nothing architecture

entities with a tier generally don't communicate with each other

#### presentation tier

### 12.3 Responsiveness, Service Level Objectives, and Apdex

### 12.4 Releases and Feature Flags

### 12.5 Monitoring and Finding Bottlenecks

### 12.6 Improving Rendering and Database Performance With Caching

### 12.7 Avoiding Abusive Database Queries

### 12.9 Security: Defending Customer Data in Your App

### 12.10 The Plan-And-Document Perspective on Operations