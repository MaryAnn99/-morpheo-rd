# Gosleep

![Alt text](img/logo.png?raw=true)

It's a mobile application that indicates sleep shifts taking into consideration exercise and nutrition.

The name of the project is the union of two words: "Goldberg" and "sleep".

## Mission management

It’s a Web-based application where an administrative-personnel member will give the missions inputs and assign users. The optimal schedule will be created.

![Alt text](img/missions_part1.png?raw=true)
![Alt text](img/new_mission.png?raw=true)
![Alt text](img/add_members.png?raw=true)

## Schedule

The user will be able to see its schedule. The times when he or she will take the metalin, light exposure, sleeping, and any the events related to the mission such as the international flights, launching, docking.

Schedule            |  Complete activity
:-------------------------:|:-------------------------:
![Alt text](img/schedule_part1.png?raw=true)  |  ![Alt text](img/schedule_part2.png?raw=true)

## Logging

The user will perform logging of its meals, exercises, and the when sleep is started and finished.

Exercise            |  Eat | Principal Page
:-------------------------:|:-------------------------:|:-------------------------:
![Alt text](img/exercise_time.png?raw=true)  |  ![Alt text](img/eat_time.png?raw=true) | ![Alt text](img/principal_page.png?raw=true)

## Information gathering

The user will answer several questions along the day based on the Columbia Jet Scale, the Liverpool jetlag questionnaire, and the Stanford sleepiness scale, in order to gather information about how well the user has slept and adjust the schedule accordingly.

![Alt text](img/how_do_you_feel_form.png?raw=true)
![Alt text](img/how_well_did_you_sleep_form.png?raw=true)
![Alt text](img/how_tired_do_you_feel_form.png?raw=true)
![Alt text](img/how_motivated_do_you_feel.png?raw=true)

## Complete App Design

[click here](https://xd.adobe.com/view/a37f8d03-4164-4073-54f8-82861b6c3890-d54e/)

or scan the QR code:

![Alt text](img/design_QR_code.png?raw=true "QR code")

![Alt text](img/app_flow.gif?raw=true "App Flow")

## The scheduling algorithm

The algorithm is based on the article [How To Travel the World Without Jet lag](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2829880/) by Charmane I. Eastman and Helen J. Burgess, and the experiments described in [Advancing Human Circadian Rhythms with Afternoon Melatonin and Morning Intermittent Bright Light](https://academic.oup.com/jcem/article/91/1/54/2843255)

1. The tMin* time is computed based on regular bed and wake time. If sleeping 7 or fewer hours per night, assume this is 2 hours before your usual wake time. If sleeping more, assume this is 3 hours before your usual wake time.
2. Determine the adjustment direction to be applied to the circadian rhythms. If your destination has a greater time zone in the Greenwich Mean Time (GMT), you will need to phase advance, otherwise, you will need to phase delay.
3. If you need to phase advance, expose yourself to sunlight or/and artificial light before going to sleep. Otherwise, do the opposite but, in this case, using melatonin 2 hours before DLMO (Dim Light Melatonin Onset)
4. Shift your tMin by shifting you bedtime and wake time by one hour and a half later each day if phase advancing, or one hour earlier per day if phase delaying.

*It is the sleeping moment where the body temperature is minimum. It is usually 3 hours before you wake up.

| ![space-1.jpg](img/algorithm_image_example.png?raw=true) |
|:--:|
| *Figure 4. Eastman, C. I., & Burgess, H. J. (2009). How To Travel the World Without Jet lag.* |

## References

- [Jet Lag Rooster (example)](https://www.jetlagrooster.com/example)
- [Paper 1 - How To Travel the World Without Jet lag](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2829880/)
- [Paper 2 - Preflight Adjustment to Eastward Travel: 3 Days of Advancing Sleep with and without Morning Bright Light](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1262683/?tool=pmcentrez&report=abstract)
- [About NASA's space scheduling](https://space.stackexchange.com/questions/20821/what-kind-of-time-regiment-schedule-do-iss-astronauts-have)
