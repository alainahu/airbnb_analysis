# Airbnb Analysis

## Overview


This repo provides the raw datasets, cleaned datasets, and scripts for the research titled Impact of Reviews and Ratings on Airbnb Pricing in Canada: Analyzing Information Dynamics. The paper analyzes the effect of reviews and ratings such as accuracy, cleanliness, location, and value on rental unit prices.

**Statement on LLM usage: OpenAI ChatGPT was used to generate some of the code involved in the data analysis of this research. The entire chat history is available in inputs/llms/usage.txt.**



## File Structure

The repo is structured as:

-   `input/data` contains the data sources used in analysis including the modified raw data. The original dataset is too large to be added to Github. Smaller subsections of the relevant data from the original data source are included.
-   `input/llm` contacts the LLM chat history
-   `input/sketches` contains the sketches for the data set and graph
-   `outputs/data` contains the cleaned dataset for this analysis.
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to replicate, simulate, download, test, and clean data.
