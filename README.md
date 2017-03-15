# Homework 3 - *CoderTicket*

**CoderTicket** is a Ruby on Rails application that allows users to create and buy tickets to cool events.

- Submitted by: **Tim Wheelock**
- Time spent: **16** hours **so far**, I'm still working on this app
<!-- - URL: **Insert your Heroku URL here** -->
- SimpleCov Test Coverage: 96.44% covered [coverage/index.html](coverage/index.html)

## User Stories

The following **required** functionality is complete:

* [x] Implement required user stories
* [x] 10 model tests (10)
* [x] 2 route tests (3)
* [x] 2 controller tests (4 -- 1 controller and 3 request)
* [x] 2 view tests (+1 pending in events/show)

The person with best test coverage will win a small present from the instructor :)

#### Events

* [x] Users can see a list of upcoming events. Past events should not be shown.
    * **HINT**: Good candidate for a test. You can write test first --> fail --> fast similar to demo
    * Suggestions:
        * Implement `/upcoming` route test to go to 'events#index'
        * Implement `Event.upcoming` class method (with a test)
        * Implement `EventsController#index` action test
* [x] Users can search for events from the homepage.
    * Author notes:
        * Tests written _first_
        * Search is case-insensitive, and there's a test for that
* [x] Users can click on an event to see details about the event.
* [x] Users can click on "Book Now" to go to a page to purchase tickets.

#### Tickets

* [x] Each event can have multiple types of tickets, each with a different `price` and `max_quantity`.
* [x] Users can buy tickets to an event, choose the types of tickets, and the quantity of tickets.
* [x] Users cannot buy more tickets than the quantity available.
* [x] Users can only buy up to 10 of a ticket type at a time. Show a nice flash message.

#### Users

* [x] User can sign up by providing their email, password, and name.
* [x] User can login using an email and password.
* [x] Users can create events.
* [x] Users must click "publish event" before an event becomes viewable to other users.
    * **HINT**: use `published_at:datetime` and `Event.published` scope (class method)
    * Suggestions:
        * See [Add More RESTful Actions](http://guides.rubyonrails.org/routing.html#adding-more-restful-actions) to add a `publish` POST action (member type)
        * **Write a test to make sure only an event creator can publish an event**
* [x] Users can create ticket types for that event.
* [x] Users can create venues.
* [x] An event must have at least one `ticket_type` defined before it can be published.
    * **HINT**: add `Event#have_enough_ticket_types?` (and test it)
* [x] User can see a list of events he or she has created.
    * Suggestions
        * You can use `/events/mine` [collection routes](http://guides.rubyonrails.org/routing.html#adding-more-restful-actions)
* [x] Users can edit their event after creation. But only the user who created the event can edit the event.
    * **HINT**: use a `before_action :check_event_changing_permission` to redirect users to event page with a flash error if applicable.

### Optional Stories

* [ ] Users cannot buy tickets to events that occur in the past.
* [ ] Users can log in with Facebook.
* [ ] Users receive an email when they have purchased a ticket.
* [ ] Users can see "related events" when browsing an event. Related events should belong to the same category and be in the same region.
* [ ] User A can allow User B to edit User A's event. In other words, an event owner can assign other people to be "event admins".
* [ ] Ticket types have an optional "minimum" purchase quantity. ([Example Screenshot](http://i.imgur.com/DOYtAR0.png))
* [ ] Events are automatically labeled as "Hot". "Hot" events should have a red border or some sort of visual flourish. The event title should also be prefixed with "**HOT:**".
* [ ] Instead of showing all of the events on the main page, an "admin" user can dictate the events that show up on the main page.

### Additional Stories

* [x] User ticket purchase screen shows ticket\_type price and calculates total price in real time on change to ticket\_type or quanity select fields

## Notes

I had a difficult time with the more advanced relationships between models in this example. Reading others' code as an addition to the lecture instruction was critical.

This is partly because the lecture was mainly focused on testing. While some of the optional exercises focused nested models or more advanced model relationships, they weren't part of the required stories of previous assignments. Because of this, they were touched on a bit briefly during class. However, reading code of successful past examples was instrumental, and all is now clear.

Before actions, validation, etc was straightforward, it was knowing what 'rails magic' would work where when setting up controller and forms that tripped me up. However, since I completed this homework late, some of the nested model stuff was more clear by the time I worked through ticket types and tickets/purchases.

On the testing side, see the Pending test in "spec/views/show.html.erb\_spec.rb" I don't understand why I can't test a view which requires the 'ticket\_types' method.

Something weird I noticed was that when chrome tries to automatically translate from vietnamese to english (on ticket purchase page, venue address has many vn characters), it ends up messing up the markup on the submit buttons. Thats a weird bug.

## License

    Copyright [2017] [Timothy Wheelock]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
