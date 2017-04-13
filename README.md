## Boris Bikes

A program which replicates the functions of the 'Boris Bikes'  found in London.
This program allows the user to release a working bike, and then dock that bike when finished. Maintenance to the docking stations can be assured in knowing the broken bikes are reported and will not be released to users.

#### Functions of the program:

1. Maintenance can create a docking station with a chosen capacity of bikes
  - User can dock a bike
  - User can release a working bike
2. When a User docks a bike, they can state whether the bike is broken
  - If broken, that bike will stay in the dock and cannot be released
  - Maintenance can get a report from the program to check on the state of bikes


#### The Technical bits

This is a Ruby program written using TDD, with a focus on SOLID and DRY principles.
It has been written considering deeply, the upkeep of the program. By working with DRY methodologies in mind, it is adaptable to change.

The classes within the program have been made with the Single Responsibility Principle in mind. This means they have clear cut responsibilities, meaning that if another developer wants to update the code - they can clearly break down the behaviours of the program.

The unit tests for the program are written in RSpec, following the Test Driven Development practice.


| **Languages**  | **Technique** |
| ------------- | ------------- |
| *Ruby*  | *TDD*  |
| *RSpec* |      |


### How to run...

*Clone the repo*

```
git clone ...
cd boris-bikesV2
rspec --init
```

### Next, start an irb session:

```ruby
irb
require './lib/docking_station'
```

### From here you can create a docking station and use the 'Boris Bikes' program as you wish!

```ruby
station = DockingStation.new # create a new station
station.dock(Bike.new) # dock a working bike
station.dock(Bike.new, false) # docking a broken bike
station.release_bike # release a working bike
station.release_bike # returns 'nil' as there are no working bikes available
```
