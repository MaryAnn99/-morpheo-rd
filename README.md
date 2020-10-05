# Gosleep

![Alt text](img/logo.png?raw=true)

It's a mobile application that indicates sleep shifts taking into consideration exercise and nutrition, in order to reduce circadian misalignment when changing time zones, as when astronauts travel to launch site and then to the ISS.

The name of the project is the union of two words: "Goldberg" and "sleep".

This repo contains the implementation of the scheduling algorithm that will be used on the app.

[Project presentation](https://docs.google.com/presentation/d/1PecixftjuvF6Sc_vVn1cZ1xvCyqgzHFQ2GMoHYbDuhk/edit?usp=sharing)

# Project presentation:

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

1. The tMin* time is computed based on regular bed and wake time. If sleeping 7 or fewer hours per night, it’s assumed this is 2 hours before the usual wake time. If sleeping more, it’s assumed this is 3 hours before the usual wake time.
2. The adjustment direction to be applied to the circadian rhythms is determined. If the destination has a greater time zone in the Greenwich Mean Time (GMT), phase advance will be needed, otherwise, phase delay.
3. If phase advance is needed, sunlight or/and artificial light exposure will take place before going to sleep. Otherwise, the opposite will be done but, in this case, using melatonin 2 hours before DLMO (Dim Light Melatonin Onset).
4. The tMin* is shifted by shifting the bedtime and wake time by one hour and a half later each day if phase advancing, or one hour earlier per day if phase delaying.


*It is the sleeping moment where the body temperature is minimum. It is usually 3 hours before you wake up.

| ![space-1.jpg](img/algorithm_image_example.png?raw=true) |
|:--:|
| *Figure 4. Eastman, C. I., & Burgess, H. J. (2009). How To Travel the World Without Jet lag.* |

## Docs

- [Documentación (Word)](https://docs.google.com/document/d/1zDccoXDcLqYby8P1Qap7GuRd9sET5B3dVq53qzZNRKo/edit?usp=sharing)
- [Treatments (Excel)](https://docs.google.com/spreadsheets/d/14SqCXEcUrHdp1wv3NaR8rFc2M1XSEwa0CBx99DemLyM/edit?usp=sharing)
- [FLow diagram](https://lucid.app/documents/view/411b73e1-30dd-4ed8-8d8c-4dd9f1ddd910)
- [Mockups](https://balsamiq.cloud/sa6o2rw/pqma720)

## References

- [Jet Lag Rooster (example)](https://www.jetlagrooster.com/example)
- [Paper 1 - How To Travel the World Without Jet lag](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2829880/)
- [Paper 2 - Preflight Adjustment to Eastward Travel: 3 Days of Advancing Sleep with and without Morning Bright Light](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1262683/?tool=pmcentrez&report=abstract)
- [About NASA's space scheduling](https://space.stackexchange.com/questions/20821/what-kind-of-time-regiment-schedule-do-iss-astronauts-have)
