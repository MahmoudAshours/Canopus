# Canopus

![canopus_logo](https://user-images.githubusercontent.com/50237142/135719157-43213b6b-198a-4649-82a7-5c6d0a81f23e.png)

# Download through google drive

You can download the application for android from [here](https://drive.google.com/file/d/16pNjJN4pSKr_QmXNaUW8vQlz2_j4eKJw/view?usp=sharing)

## Explain your solution/idea in 300 words
Solar energy is more widespread in some countries than others, and it is the fastest growing and most affordable source of new electricity in the United States according to the U.S. Department of Energy. NASA produces a variety of surface solar and meteorological data parameters that are useful to commercial renewable energy and sustainable building ventures, but this information is not easily accessible to the typical homeowner.

The challenge is to develop a mobile application that accesses the information available via the NASA POWER web services portal and provides useful data associated with sunshine to the general public in an accessible manner, in addition to monitoring the electrical output of the home’s current system relative to satellite-based estimates of sunshine reaching the home’s location.

CANOPUS has been designed with Flutter and Firebase and offers an easy-to-use application that runs on both iOS and Android.
It aims to make quick and easy access to NASA-POWER global meteorology, surface solar energy, and climatology data with several temporal resolutions (depending on the POWER parameter and community) for analysis and use in modeling or other purposes.
With a focus on the most user-friendly datasets and graphs. In addition to allowing the end-user to manage their parameters and understand the hazards posed by environmental or climate change.

CANOPUS brings a lot of benefits to the end-user so it can be easily interact with, like:
-seeking historical data: to enable more informed solar panel purchasing decisions for homeowners.
- monitoring the electrical output of the home’s current system reaching the user's home location.
- voice data entry: control entering the latitude and longitude GPS coordinates and other parameters' values by voice.
- Finding location: helps to find the exact longitude and latitude of the exact location of the user.
-  interactive map: with zooming and recentering functions.


## Problem Definition
NASA's Prediction of Worldwide renewable Energy Resources (POWER) web services portal ​is not streamlined or simplified for use by the general public due to the vast number of parameters, time averages, and statistical reports available.

## Background & literature review
Summary of previous solutions to the challenge:

### SUN IS FUN
It shows how someone can switch his current power usage with solar energy. It also predicts day-to-day solar energy someone will get so he can plan his everyday activities while doing the right thing for the planet.
Within SUN IS FUN project there are two tools – one for calculation on needed solar equipment in order to move to solar energy supply and one for users that already have solar panel systems in place which allows them to predict energy output and plan their activities.

### GO SOLAR: is a tool that allows people to check if and how they can switch their current household electricity consumption to solar energy. Tool as well estimates total cost of that investment and calculates return of investment based on electricity bill savings.

### SUN PLAN: is intended to be used as a solar energy levels prediction tool based on meteorological data and solar system in use, as well as a tool for detailed planning of daily activities based on expected energy levels and appliances in-home/science station.

### PROXIMA
Proxima is an intelligent energy management system that combines the data, looks for patterns, and makes predictions about the habitat’s total energy budget. Energy information, driven by Proxima’s machine learning system, is available to crew members through dashboards and mobile or wearable devices. Finally, Proxima makes recommendations based on the observed and predicted conditions. 

### STARLYTE
STARLYTE is an artificial intelligence system developed to assist the HI-SEAS crew by monitoring habitat solar energy output and use. It also helps others understand solar energy production through interactive demonstrations and simulations. It utilizes real-time weather data and forecasts to predict short-term energy production expectations and will guide users in energy consumption and conservation. During times of expected decreases in solar energy output, STARLYTE can ensure energy efficiency is maximized by recommending changes in energy use. A map of the HI-SEAS habitat with a color-based data overlay displays current energy use and allows users to easily visualize energy consumption. STARLYTE MOBILE, a unit integrated into the spacesuit helmets can further simplify maintenance by quickly identifying the specific panel that requires repair, and giving real-time feedback about the energy output to ensure the repair is complete.

## Methodology (the science behind the idea)
CANOPUS was created to assist users all around the world in becoming more environmentally conscious and mindful of their energy usage throughout the day. By using CANOPUS, users will gain a better understanding of how much energy can be generated from their solar panels at a given location.
Users can enter their location by typing, grab their location by GPS, or simply by entering the parameters' values by voice. Using this information, CANOPUS gets energy and sun radiation data.
This information is viewed on the main graph, which shows users when they can get the most energy, how much energy they can get.


## Value Proposition
For users and homeowners who can’t find an easy way to access the information on NASA POWER web services portal, We offer an easy-to-use application that runs on both iOS and Android that provides useful information about sunshine in their location by typing, grab their location by GPS or simply by entering the parameters' values by voice. These data can be visualized easily on the main graph which provides an easy interaction of users with CANOPUS.


#### Resources (hardware & software, Data, references)
Flutter - Beautiful native apps in record time. (2021). Flutter. https://flutter.dev/
Stackhouse, P. (2021). NASA POWER | Prediction Of Worldwide Energy Resources. NASA POWER. https://power.larc.nasa.gov/#resources
Stackhouse, P. (2021a). NASA POWER | Docs | Data Services - NASA POWER | Docs. NASA POWER. https://power.larc.nasa.gov/docs/services/
Space Apps data. (2021). Dropbox. https://www.dropbox.com/sh/g0gf1awqqaumyqt/AAB1G07PaBYjUnOYnXOLx9eua?dl=0

