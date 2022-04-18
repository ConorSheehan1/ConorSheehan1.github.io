---
layout: blog
categories: blog
tags: devto
---

OK, that title sounds fancy and complicated. What did I actually do?
First I should probably explain why I did anything in the first place.


### Background
I've been using [uhabits](https://github.com/iSoron/uhabits) for years. I noticed a new [numeric habit type](https://github.com/iSoron/uhabits/discussions/42) was added in [v2.0.0](https://github.com/iSoron/uhabits/releases/tag/v2.0.0-alpha). Previously you could only track habits in a boolean way. Now instead of a checkbox per day, you had a numeric input to track how many times per day you did something.

I had lots of habits in the old boolean format that would benefit from the new format. E.g. I was tracking my coffee and alcohol consumption using days per week, rather than number of units per week. I looked around, but couldn't find a way to convert between the habit types. I found [this feature request](https://github.com/iSoron/uhabits/discussions/934), but no replies yet. I had a quick look through the codebase, and realized it'd be a lot of work to make a pr since I didn't know the main language, kotlin. So I decided to try and make my own little utility to convert between the habit types.

I know uhabits supports importing / exporting it's internal sqlite database. I don't know kotlin, but I do now SQL, so instead of trying to figure out the logic from the sourcecode, I created a few habits with the new numeric type, and exported everything. I opened up the exported db and compared the differences between the old and new habits.


### Reverse engineering the datamodel
I could see the tables and fields pretty easily, but that didn't tell me what they were actually used for. I figured out that the habits and repetitions tables were what I needed to work on, because the others were either empty (events), or metadata tables (android_metadata, sqlite_sequence).
![tables]({{site.url}}/assets/images/uhabits/tables.png)
![table_schema]({{site.url}}/assets/images/uhabits/table_schema.png)

I needed to start messing with the data to see what would happen. I started with the habits table. 
![habit_data]({{site.url}}/assets/images/uhabits/habit_data.png)
I noticed `type` is 0 for boolean habits and 1 for numeric habits. `freq_num` only changes for boolean habits. For numeric habits, it's always 1. That makes sense since `target_value` is generally 0 for boolean habits, but can be any number for numeric habits. `freq_den` seems to refer to the time unit. e.g. If I make a boolean habit with a target of 5 times per week I'd get the following for each type:
```javascript
// boolean, aim to do something 5 days every 7 days
{freq_den: 7, freq_num: 5, target_value: 0, type: 0}

// numeric, aim to do something 5 times every 7 days
{freq_den: 7, freq_num: 1, target_value: 5, type: 1}
```

Next I looked at the `repetitions` table. I noticed boolean habits generally got a value of 2 when checked, while numeric habits went up in multiples of `1000`. It looks like 1000 is used to represent 1.00, so decimals can be added too. e.g. 1.5 would be 1500.
![repetitions_data]({{site.url}}/assets/images/uhabits/repetitions_data.png)

Once I had identified the differences between habit types in the 2 main tables, I was able to create some python functions to convert from the old boolean type to the new numeric type.

After converting and re-importing my habits, I noticed that the graphs for boolean and numeric habits didn't quite match. I decided to add 2 options; 1 to try to preserve the graphs, and another to preserve the data the way uhabits would generate it.

### Creating a CLI to convert between types
After I was confident my converter worked, I made a little CLI layer to call it from, and published it on github. [https://github.com/ConorSheehan1/uhabits_converter](https://github.com/ConorSheehan1/uhabits_converter) 

The end results look like this:

| Before                                          | After                                         |
| ----------------------------------------------- | --------------------------------------------- |
| <img src="{{site.url}}/assets/images/uhabits/coffee_bool.jpg" width="500" height="600" alt="coffee_bool"/>  |  <img src="{{site.url}}/assets/images/uhabits/coffee_num.jpg" width="500" height="600" alt="coffee_num"/>  |
