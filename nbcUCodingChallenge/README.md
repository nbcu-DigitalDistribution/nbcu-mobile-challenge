#  NBCUniversal Mobile Coding Challenge

## About
This application allows users to calculate the total cost of their landline services and data useage charges, dependent on their estimated weekly use and recommends a data plan that suits their needs.

I went ahead and asked the user an additional question as I thought this was critical to accurately determine the data plans to recommend, and the costs of said data plans. See questions below: 

- How many hours of NetFlix, Amazon, Hulu etc, does your household watch in a week?
- How many smart devices are in your home?
- How many devices do you typically want to watch videos on simultaneously?
- Would you like to add landline phone services to your home?
- To add an international plan to your landline phone service please select a region(s) below:
     - Asia
     - Europe
     - Rest Of World
     - World
     
---
## How it works
The User's input gets modelled in a Package object, which captures their projected hourly data usage, total household device count and simultaneous streaming devices count. 

Then the Package's methods assess the hourly data usage cost and any additional charges for surplus data use and devices. 

Separately, the landline charges are calcuated depending on the state of the switches (*on* for opt in and *not-on* for opt out)

Finally, the landline charges; the hourly data usage cost; and the additional data usage and devices charges gets parsed to yield the total cost and plan recommendations.

---
With more time to continue the development of this app I would add some animations to the images; make some additional refinements to enhance the UX; and perhaps some better handling of edges cases currently present
