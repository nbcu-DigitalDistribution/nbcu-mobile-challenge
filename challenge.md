# Coding Challenge

## Objective

We want to build an application that let’s users find the best Cable, Internet and Phone package recommendation and cost of the package based on their requirements/selections. Note that the pricing and recommendations here are purely fictitious (and don't really make sense) and are only being used to test your coding skills.

## Questions for the User

- How many hours do they watch in a week on Netflix/Amazon/Hulu/Etc.?
- How many devices they typically have at home?
- How many devices they want to watch videos on simultaneously?
- Do you like to have a phone service at home?
- Do you like to make international calls using your home phone?
  - User should be allowed to select any of the following options unless otherwise noted:
      - Asia
      - Europe
      - Rest of the World
      - World (cannot be selected if any of the other plans are selected)

NOTE: Assume the user only enters valid inputs for questions without predefined choices

## Data

**Internet Usage Data Recommendations and Costs**

| Hours of Video Streaming | Data Recommended in GB                             | Cost                                     |
|--------------------------|----------------------------------------------------|-------------------------------------------|
| 1                        | 1                                                  | $3                                        |
| 2-3                      | 2                                                  | $5                                        |
| 3-5                      | 5                                                  | $8                                        |
| 5-8                      | 8                                                  | $15                                       |
| 8+                       | 8 + (1GB for every additional 1hr above 8hrs)      | $15 + ($1 for every additional 2GB)       |

- A flat rate of $25.99 is added if the user intends to have a phone service
- For international plans:
  - A flat rate of $11.99 for the World plan
  - A flat rate of $4.99 for Asia, Europe or Rest of the World respectively

**NOTE**: You do _not_ need to recommend the World Plan if they choose Asia, Europe and Rest of the World.

**Additional Device Recommendations**: (Anything above 2 devices are considered additional)

- For every additional device, a 1 GB additional data should be recommended.
- For watching videos simultaneously on these devices, an additional 1 GB should be recommended per device. The cost for additional data from these additional devices should be based on the table above and if there is no direct mapping to additional data to cost then choose the closest applicable cost.

**Device Examples**:

1. Say you have 2 devices and you want to watch video simultaneously on 2 devices for 4 hours. The recommendation should be 5 GB which comes out to $8 as per the table above.

2. Say you have 3 additional devices (so a total of 5 devices at home) and you want the ability to watch videos simultaneously on 3 devices for 4 hours. The recommendation should be: **5 GB** (2 devices at 4 hours of streaming) + **3 GB** (3 *additional* devices) + **1 GB** (Streaming on 1 *additional* device). The cost for additional 9GB is $15.50 as per the table above.

## Project Requirements

Please keep in mind that these are baseline requirements. If you find that you have extra time and want to add a little more pizzazz feel free to do so.

**Language**:

We'd like you to use the most up to date/modern language for your respective platform that you're most comfortable with. There are some platforms where we'd like to see specific languages, though. These are:

- iOS: Swift
- Android: Kotlin

Otherwise, feel free to use whatever platform you're most comfortable with.

**App**:

- 1 screen where a user can fill out their answers to the questions above and submit them
- 1 screen where a user will see their recommended package(s) and cost
- A user should be able to go back and edit their preferences and see an updated recommendation upon resubmission

**Other**:

Feel free to use any dependency manager you're most comfortable with if necessary.

Please include a README with your project that provides instructions on how to run your project, a brief explanation of any dependencies you decided to utilize and why, and any other notes you feel are important (e.g. architectural decisions, shortcomings, things you didn't get to complete, things you think you could improve on, etc.).

**We are looking for**:

- Ability to write working, readable and testable code
- Knowledge of the platform/language patterns and idioms + the ability to use them efficiently
- Tests to accompany your code

**Submission**

Upon completion of your project, please send us a GitHub link so we can clone and review your project.
