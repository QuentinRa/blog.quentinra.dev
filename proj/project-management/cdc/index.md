# CDC

[Go back](..)

I don't like writing a lot of specifications, only what's
useful so try to think about those who will read it
when writing. That's supposed to help them...

* **present the company**  : name, logo?, background
* **present the project** : client, what we want, ...
* **present the public** : who wil use the product (lang, age, IT
  knowledge, ...)
* **the team** : organization, roles, ...
* **graphic chard** : if you have one

Then the real stuff, write functional specifications
and technical specifications.

## Functional specifications

Write something for each screen of your application

* maybe make a mockup
* description of the screen (what's the button xxx
  is supposed to do?)
* MoSCoW notation for priorities
* maybe add some UML diagrams but that's a waste
of time I think
* add some constraints (ex: check with some REST
  API that the username is available / ... Pretty
  much a follow-up of the description part.
)
  
Add the end, you may add a table like this

<table class="table table-bordered">
<tr>
<th>N°</th>
<th>Task</th>
<th>Duration</th>
<th>HJ</th>
<th>Priority</th>
</tr>
<tr>
<td></td>
<td>Phase1</td>
<td>20d/5w</td>
<td>85 (=60+25)</td>
<td>M</td>
</tr>
<tr>
<td>A</td>
<td>Task1</td>
<td>8d/2w</td>
<td>25</td>
<td>M</td>
</tr>
<tr>
<td>B</td>
<td>Task2</td>
<td>12d/3</td>
<td>60</td>
<td>C</td>
</tr>
</table>

With Task1 and Task2 sub-tasks of Phase1. (and
d is for days and w for weeks)

## Technical specifications

* language of the code, frameworks, versions
* tools for communicating
* database?
* constraints (ex: website working on IE11, Mozilla and, Chrome)
* services (ex: google analytics)
* architecture (files/folders, naming, ...)
* protocols (ex: HTTP, HTTPS, POST, GET, ...)
* security
* domain name (ex: for a website, can be used to simulate
  the final server and directly test the code in good
  conditions)