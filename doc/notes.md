# notes

---

# design approaches

embedded synchronous sqlite
embedded asynchronous sqlite
embedded event-sourced sqlite
drb sqlite service
drb event-sourced sqlite service

---

# continued

rest api

- why: you can easily load test it with existing tools
- embedded sqlite
- event-sourced embedded sqlite
  - a single database with both messages and view data
  - two databases, one for messages and another for view data

sqlite drb service

- synchronous calls to service
- asynchronous calls to service

event-sourced sqlite drb service

- synchronous calls to service
- asynchronous calls to service

other implementations

- fiber based
- ractor based

---

