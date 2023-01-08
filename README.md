# Clean VIP

An Example of Clean VIP Architecture.

We will discuss Uncle Bob’s Clean architecture here followed by a sample project. As we have seen, MVC architecture turned into massive view controllers with respect to time to a time change requests that lead us to difficulties from a testing perspective for each module.

Below are the components of this Architecture :

* View Controller
* Interactor
* Presenter
* Worker
* Router
* Models

## Flow chart

![Untitled Diagram drawio(2)](https://user-images.githubusercontent.com/97470591/211023011-30890c67-7ed4-48ba-8e99-df0566dbf6cd.png)


## View Controller

* Defines a scene and contains a view or views.

* Keeps instances of the interactor and router.

* Passes the actions from views to the interactor (output) and takes the presenter actions as input

## Interactor 

* Contains a Scene’s business logic.

* Keeps a reference to the presenter.

* Runs actions on workers based on input (from the View Controller), triggers and passes the output to the presenter.

* The interactor should never import the UIKit.

## Presenter

* Keeps a weak reference to the view controller that is an output of the presenter.

* After the interactor produces some results, it passes the response to the presenter. Next, the presenter marshals the response into view models suitable for display and then passes the view models back to the view controller for display to the user.

## Worker

* The Worker component will handle all the API/CoreData requests and responses. The Response will get the data ready for the Interactor. It will handle the success/error response, so the Interactor would know how to proceed.

* Should follow the Single Responsibility principle (an interactor may contain many workers with different responsibilities).

## Router

* Extracts this navigation logic out of the view controller.

* Keeps a weak reference to the source (View Controller).

## Configurator

* Takes the responsibility of configuring the VIP cycle by encapsulating the creation of all instances and assigning them where needed.

## Model

* Decoupled data abstractions.

## When and why We should use it 

* Projects where unit testing is expected.

* Long-term and big projects.

* Projects with a generous amount of logic.

* Projects you want to reuse in the future.

## Strengths 

* Easy to maintain and fix bugs.

* Enforces modularity to write shorter methods with a single responsibility.

* Nice for decoupling class dependencies with established boundaries.

* Extracts business logic from view controllers into interactors.

* Applies to existing projects of any size.

* Modular: Interfaces may be easy to change without changing the rest of the system due to using protocol conformant business logic

## Disadvantages

* Many protocols with complicated naming and responsibilities

* Large app size due to many protocols.

* Despite the fact that there is an official website of Clean Swift architecture, it changes often and implementations may differ between projects. (https://clean-swift.com/clean-swift-ios-architecture/)


## Official implementation Link 

https://clean-swift.com/clean-swift-ios-architecture/


