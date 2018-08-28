# DASH away day: Vega-lite / open data
29th August 2018, room 1.19, 10 South Colonnade

## Timings for the day
|  Timings | Area        | Description  |
| ------------- |-------------| -----|
| 10:00 - 10:15  | 1.19 | Arrival + introductions |
| 10:15 - 10:30 | 1.19 | Introduction to Vega-lite (Robin) |
| 10:30 - 10:45 | 1.19 | Introduction to Away day plans (Hayden) |
| 10:45 - 11:00  | 1.19 | Choose a dataset & form teams |
| 11:00 - 12:30 | Breakout | Split in to small groups and work on chosen project |
| 12.30 - 13.15 | Lunch | Lunch |
| 13.15 - 15.45  | Breakout | Split in to small groups and work on chosen project |
| 15:45 - 16:30 | 1.16 | Present back, summarise, discuss Vega vs alternatives, next steps |
| 16:30 | The Merchant | Drinks! |

## Aims for the day

The aim of today's away day is to give you a chance to try out Vega-lite and the different ways of producing and embedding vega-lite visualisations. The way we suggest you get started with this is as follows:

1. Copy the code behind one of the Vega-lite examples into the Vega-lite editor code. Make some changes to the vega-lite code, changing the axis, the values, the type of chart ect, to see whats possible.

2. Input new data into your visualisation. This can be done by:
  * directly inputting the data in JSON format into the Vega-lite code; 
  * pointing to a csv file in the Vega-lite code; 
  * using Altair in either python or R; 
  * using this tool to convert csv data to JSON: https://github.com/RobinL/open_data_munge. 

3. Embed the visualisation into a webpage using either python+jinja, or Observable and create your own open data publication like the examples above.

We have provided a detailed breakdown of each of these sections below.

A few examples of what you can to aim for as an output:

* https://s3.amazonaws.com/testdeleterobin/www/index.html
* https://beta.observablehq.com/@robinl/draft-prototype-receipts-disposals-and-cases-outstanding-
* https://www.ethnicity-facts-figures.service.gov.uk/crime-justice-and-the-law/policing/confidence-in-the-local-police/latest
* https://data.justice.gov.uk/prisons


## Dataset options 
Each of the above dashboards or publications could be reproduced from any open dataset. We've provided a few options here which you can use:

#### Prisons data
https://www.gov.uk/government/statistics/safety-in-custody-quarterly-update-to-march-2018 

#### Treasury spending data
https://www.gov.uk/government/publications/hmt-spend-greater-than-25000-march-2018

#### Criminal Court data
https://www.gov.uk/government/collections/criminal-court-statistics 

#### Geographic Deprivation
https://www.gov.uk/government/statistics/english-indices-of-deprivation-2015

#### Crimes by Area
https://data.london.gov.uk/dataset/recorded_crime_summary 

#### Income by Area
https://data.london.gov.uk/dataset/average-income-tax-payers-borough

(Shape files for the geographic regions are list below)

#### Any other datasets

If you have something in mind then please feel free to use any open dataset in addition to or instead of the above.


##### Shape files and geographic lookups (for the geographic datasets)
http://geoportal.statistics.gov.uk/datasets/lower-layer-super-output-areas-december-2011-super-generalised-clipped-boundaries-in-england-and-wales/data

If LSOA is too low level to produce a geographic plot then try mapping up to a higher output area, for example:

http://geoportal.statistics.gov.uk/datasets/lower-layer-super-output-area-2011-to-upper-tier-local-authorities-2017-lookup-in-england-and-wales/data

http://geoportal.statistics.gov.uk/datasets/upper-tier-local-authorities-december-2011-boundaries/data?selectedAttribute=st_area(shape)

## Guidance

### Testing Vega-lite
Vega-lite has a simple interactive editor with a number of different examples. As a first step you can try adapting the existing examples or building one of your own. Once you're happy with your chart you need to look at your dataset and what format you need it to be in to plug into vega.

https://vega.github.io/editor/#/

https://vega.github.io/vega-lite/examples/

https://vega.github.io/vega-lite/tutorials/getting_started.html 

If you are lucky enough to be using an API or an open data source in JSON format then you’ll be able input this data directly into your vega-lite visualisations as shown in the examples. However this is quite rare and if not you'll need to process the published csv files into something resembling a JSON format. Luckily there are a number of different ways you can do this depending on what language you're most comfortable with.

### Altair & Processing open data

#### Python

If you're comfortable using python there is a module called Altair which acts as a wrapper for vega-lite. It allows you to specify charts at a much higher level and use a pandas dataframe as your data input. An extremely helpful feature of Altair is that any charts you produce will have the option to show the source code created by Altair - this includes both the JSON format data and also the vega-lite code.

This can be run locally using jupyter lab or through the analytical platform.

You'll first need to open up a terminal and input: `pip install -U altair vega_datasets`

This will install altair and the example vega datasets

https://altair-viz.github.io/getting_started/starting.html

You can then follow the examples above to produce some basic charts. As seen below you can use these charts to produce both the vega-lite foundation for further editting and also the data format you'll need for adding the data to an observable notebook. As a next step try grabbing the source code and getting it to work in the vega-lite interactive visualiser.

![Altair Chart](example_altair.png)
![Source code](example_source.png)


#### R

If you'd prefer to use R there is also an R package called altair (notice the lower case A). The R package altair makes use of reticulate to run python code through R and effectively provides the same functionality as the Python Altair package, even if it is a little less user friendly.

There is an R-script `altair-install-example.R` in this repository which should get you going with producing your first altair chart. Online documentation for altair can be found here:

https://github.com/vegawidget/altair
https://vegawidget.github.io/altair/articles/first-example.html 


### Authoring reproducable documents with Vega

#### Observable Notebooks

Vega-lite code, along with Javascript, can be directly entered directly into an Observable notebook. If you want to use Observable, then the data you use needs to be in JSON format and entered directly into the Observable Notebook with the rest of the vega-lite chart code.

A quick introduction to be Observable can be viewed here: https://beta.observablehq.com/@mbostock/five-minute-introduction

You can start entering your own code here: https://beta.observablehq.com/scratchpad

Try inputting this as an example:

```javascript
vega_embed = require("vega-embed@3");
```

```javascript
viewof chart =  vega_embed(
 {
  "$schema": "https://vega.github.io/schema/vega-lite/v2.json",
  "description": "A simple bar chart with embedded data.",
  "data": {
    "values": [
      {"a": "A","b": 28}, {"a": "B","b": 55}, {"a": "C","b": 43},
      {"a": "D","b": 91}, {"a": "E","b": 81}, {"a": "F","b": 53},
      {"a": "G","b": 19}, {"a": "H","b": 87}, {"a": "I","b": 52}
    ]
  },
  "mark": "bar",
  "encoding": {
    "x": {"field": "a", "type": "ordinal"},
    "y": {"field": "b", "type": "quantitative"}
  }
});
```


Here is an example of embedding visualisations in Observable that Robin has produced: https://beta.observablehq.com/@robinl/draft-prototype-receipts-disposals-and-cases-outstanding- 


#### Authoring HTML with Jinja

This is a good template to start with: https://github.com/moj-analytical-services/kpi-dashboard

www/chart_specs is where the Vega-lite code for the visualisation is stored. 

If you are using csv data you can put it in www/data, and point to it in the www/chart_specs file).

Next point to the name of the chart_specs file name in main.py 'charts' section.

Run main.py, which will then generate dashboard.html. 

Lastly run a python web server ```python3 -m http.server``` in /www to view the website.


#### R-Shiny with Vega

Rather than producing an HTML output document, if you're more comfortable using Rshiny then you can use shiny and altair to produce your dashboard. There is an example of using altair with RShiny in this repository `altair-shiny-example`.

The shiny interface should otherwise work as expect.

