# My Steps


## Mini coding assignment

Disclaimer:
This document is strictly private, confidential and personal to its recipients and should not be copied, distributed or reproduced in whole or in part, nor passed to any third party.

## Quick Overview

This is a simple hypothetical app to track your steps and reward you along the way.

## About the app

The name of this hypothetical app is: MySteps. The app uses Healthkit to retrieve the amount of steps in Apple Health, and shows a graph of the the amount of steps taken for the current month along with a set of achievements at the bottom. 

The app should query Apple Health for the Steps category for the current month and then:

- Plot a line chart depicting the steps. (x-axis day of month / y-axis step count/per day)
- Display all the achievements earned for the current month based on the total sum of steps taken for the current month. (i.e. If the user has walked 0-9999 steps show the “No achievements” state, if the user has walked 10k show the first badge, if the user has walked 20k show the first and second badge etc.  )
- The y-axis of the chart should start from zero and adjust dynamically  depending on the total amount of steps returned by Apple Health for the current month.

The achievements view is scrollable horizontally and the entire view should be scrollable vertically.

All strings should be marked as localisable and the UI elements should expand and contract to accommodate larger or smaller strings, depending on the hypothetical translation

## Design & Assets
You will receive an invitation to Figma via email.

## Animation prototype
This an animation prototype where you can see how UI elements animate. When the app launches the achievements animate sequentially. 

**Note:** Press anywhere in the background to view the animation. The app should animate all achievements on launch without any tapping required.

[https://framer.cloud/PMbgI](https://framer.cloud/PMbgI)



## Implementation notes

### Project configuration
1. The app should be developed in Swift
2. The deployment target is iOS 13 - iPhone only
3. The supported interface orientations for the app should be Portrait Only
4. The app should run properly on all available iPhone size classes (no iPad version)


### Data & Backend
1. The chart should display the total number of steps for each of the current month - displayed data should adapt when day changes
2. The app should ask for permission to access the user’s “Steps” Apple Health category.
3. The total number of steps for each day should be also stored locally in the app, using a Core Data Persistent store (a local cache).
4. The data for the chart should be retrieved directly from HealthKit every time the app is launched.
5. The data for the achievements view should be retrieved from the local cache.

### UI & Libraries
1. The chart itself can be implemented with either CorePlot (https://github.com/core-plot/core-plot) or CoreGraphics or any other third-party chart library you prefer.
2. Animations can be implemented using UIView animations, CoreAnimation or Facebook Pop (https://github.com/facebook/pop)

### Localization
1. All dates appearing should be adapting to the user’s locale (in terms of language and formatting)
2. The app is considered to be localised, so all text UI elements used should be able to accommodate strings of variable length without breaking the app’s layout - All strings used should be treated as `NSLocalizedStrings`

### What we’ll evaluate
1. Clean and well documented code
2. Performance of the app
3. Attention to detail in the implementation of the UI (Distances, sizes, typography, animation etc.)
4. Accuracy of the estimate of the implementation

### Code submission
You will receive an invitation to a private repository on Github.

## Delivery time
The coding assignment must be completed within 7 calendar days.
