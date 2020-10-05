void main(){

  DateTime bedTime = new DateTime(2020, 10, 1, 23, 0);
  DateTime wakeTime = new DateTime(2020, 10, 2, 7, 0);
  User user = new User(bedTime, wakeTime);

  DateTime internationalFlightStartDate = new DateTime(2020, 10, 3, 15, 0);
  DateTime internationalFlightEndDate = new DateTime(2020, 10, 4, 18, 0);

  DateTime launchDate = new DateTime(2020, 12, 4, 18, 0);
  DateTime dockingDate = new DateTime(2020, 12, 5, 13, 0);
  DateTime undockingDate = new DateTime(2021, 5, 5, 7, 0);
  DateTime landingDate = new DateTime(2021, 5, 5, 10, 0);

  print("International flight:");
      print("   Start: ${internationalFlightStartDate}");
      print("   End: ${internationalFlightEndDate}");
  print("Earth to Space:");
      print("   Launch: ${launchDate}");
      print("   docking: ${dockingDate}");
  print("Space to Earth:");
      print("   undocking: ${undockingDate}");
      print("   landing: ${landingDate}");

  Trip tripLocationToLaunch = Trip(
    flightEndDate: internationalFlightEndDate,
    flightStartDate: internationalFlightStartDate,
    originTimeZone: -7,
    destinationTimeZone: 8
  ); 

  Trip tripEarthToSpace = Trip(
    flightEndDate: launchDate,
    flightStartDate: dockingDate,
    originTimeZone: 8,
    destinationTimeZone: 0
  );

  Trip tripSpaceToEarth = Trip(
    flightEndDate: undockingDate,
    flightStartDate: landingDate,
    originTimeZone: 0,
    destinationTimeZone: -7
  );

  Schedule schedule = new Schedule(tripLocationToLaunch, user);

  print('The schedule starts at : ${schedule.startTrackingDay}');

  print('Is going east? ${schedule.isFlyingEast}');

  for(int i = 0; i < schedule.events.length; i++) {
    if (i == 13) {
      print('New Schedule after traveling. This is adjust to the new time zone.');
    }
    print("Day: #${i}");
    print("   ${schedule.events[i].startDate}");
    print("   ${schedule.events[i].endDate}");
  }
}
// takes a datetime A in a TimeZone "currentTZ" and returns the datetime in a TimeZone "newTZ"
DateTime changeTimeZone(DateTime A, currentTZ, newTZ) {
  int hoursDiff = (currentTZ - newTZ).abs();
  if (currentTZ > newTZ) {
      hoursDiff *= -1;
  }
  return A.add(new Duration(hours: hoursDiff));
}

class EventType {
  final String name;
  final String description;
  final int quantity; 
  // Event Types:
  // takeSunLight,
  // takeArtificialLight,
  // takeMelatonin,
  // wearSunGlasses
  // sleep,
  // flight,
  EventType({ this.name, this.description, this.quantity });
}

class Trip {
  final DateTime flightStartDate;
  final DateTime flightEndDate;
  final int originTimeZone;
  final int destinationTimeZone;
  Trip({
    this.flightEndDate, 
    this.flightStartDate, 
    this.originTimeZone,
    this.destinationTimeZone
  });
}

class User {
  final DateTime bedTime;
  final DateTime wakeTime;
  User(
    this.bedTime,
    this.wakeTime
  );
}

class Event {
  final EventType type;
  final DateTime startDate;
  final DateTime endDate;
  Event({ this.type, this.startDate, this.endDate });
}

class Schedule {
  // An schedule is a list of events
  List<Event> events;
  // This is the first day in the schedule
  DateTime startTrackingDay;
  // This is how many hours the sleep start and end times are moved.
  final int hoursPerDay = 1;
  bool isFlyingEast;
  
  // EventType flightEventType = new EventType(name: 'flight', description:'', quantity: 1);
  // EventType takeSunlightEventType = new EventType(name: 'takeSunlight', description:'', quantity: 1);

  void fillScheduleBeforeTraveling(User user, Trip trip) {
    EventType sleepEventType = new EventType(name: 'sleep', description:'', quantity: 1);

    DateTime currentBedDateTime = new DateTime(
      this.startTrackingDay.year,
      this.startTrackingDay.month,
      this.startTrackingDay.day,
      user.bedTime.hour,
      user.bedTime.minute,
      user.bedTime.second
    );

    Duration sleepHours = user.wakeTime.difference(user.bedTime);

    DateTime currentWakeDateTime = currentBedDateTime.add(new Duration(hours: sleepHours.inHours));

    this.events.add(new Event(type: sleepEventType, startDate: currentBedDateTime, endDate: currentWakeDateTime));

    int index = 0;
    int hoursLessOrMore = 1;
    if (this.isFlyingEast) {
      hoursLessOrMore = -1;
    }

    int hoursLessOrMoreCounter = this.hoursPerDay;

    while(true){
      if (index >= trip.flightStartDate.difference(this.startTrackingDay).inDays) {
        break;
      }
      DateTime newBedDateTime = this.events[index].startDate.add(new Duration(hours: 24 + (hoursLessOrMore * hoursLessOrMoreCounter)));

      DateTime newWakeDateTime = this.events[index].endDate.add(new Duration(hours: 24 + (hoursLessOrMore * hoursLessOrMoreCounter)));
      
       this.events.add(new Event(type: sleepEventType, startDate: newBedDateTime, endDate: newWakeDateTime));
      index ++;
    } 



    // After traveling

    // first, at what time are you supposed to be sleeping in this new country:
    DateTime lastGoToBedTime = this.events[this.events.length - 1].startDate;
    
    DateTime lastGoToBedNewTZ = changeTimeZone(lastGoToBedTime, trip.originTimeZone, trip.destinationTimeZone);
    
    DateTime currentWakeDateTimeNewTZ = lastGoToBedNewTZ.add(new Duration(hours: sleepHours.inHours));

    this.events.add(new Event(type: sleepEventType, startDate: lastGoToBedNewTZ, endDate: currentWakeDateTimeNewTZ));

    int delayHours = trip.destinationTimeZone - trip.originTimeZone;

  }

  // void fillScheduleWhileTraveling(User user, Trip trip)
  //{
    
  //}

  Schedule(Trip trip, User user) {
    this.events = new List<Event>();
    this.isFlyingEast = trip.originTimeZone < trip.destinationTimeZone;

    // difference in hours between time zones
    int days = trip.destinationTimeZone - trip.originTimeZone;
 
    if (days > 12) {
      days = 12;
    }

    this.startTrackingDay = trip.flightStartDate.subtract(new Duration(days:days));

    fillScheduleBeforeTraveling(user, trip);
    // fillScheduleWhileTraveling(user, trip);
  }
}

//    1. Estimate when your body temperature reaches a minimum. If sleeping 7 or fewer hours per night, assume this is 2 hours before your usual wake time. If sleeping more, assume this is 3 hours before your usual wake time.
//
//    2. Determine whether you need to advance or delay your circadian rhythms. If you are flying east (to a later time zone), such as from Los Angeles to New York, you will need to phase advance. Otherwise, if you are flying west, you will need to phase delay.
//
//    3. If you need to phase advance, avoid light for 4 hours before your body temperature minimum, and seek light for 4 hours after it. Otherwise, do the opposite.
//
//    4. Shift your estimated body temperature minimum by one hour earlier per day if phase advancing, or one and a half hours later per day if phase delaying.


// var tMin = user.wakeTime.subtract(new Duration(hours:2));
    // if(user.wakeTime.difference(user.bedTime).inHours > 7){
    //   tMin = user.wakeTime.subtract(new Duration(hours:3));
    // }
    // print(tMin);