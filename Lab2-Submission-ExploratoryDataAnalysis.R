# STEP 1. Install and use renv ----
# **Initialization:   Install and use renv ----
# The renv package helps you create reproducible environments for your R
# projects. This is helpful when working in teams because it makes your R
# projects more isolated, portable and reproducible.

# Further reading:
#   Summary: https://rstudio.github.io/renv/
#   More detailed article: https://rstudio.github.io/renv/articles/renv.html

# Install renv:
if (!is.element("renv", installed.packages()[, 1])) {
  install.packages("renv", dependencies = TRUE)
}
require("renv")

# Use renv::init() to initialize renv in a new or existing project.

# The prompt received after executing renv::init() is as shown below:
# This project already has a lockfile. What would you like to do?

# 1: Restore the project from the lockfile.
# 2: Discard the lockfile and re-initialize the project.
# 3: Activate the project without snapshotting or installing any packages.
# 4: Abort project initialization.

# Select option 1 to restore the project from the lockfile
renv::init()

# Loading Datasets ----
## STEP 2: Download sample datasets ----
# Create a folder called "data" and store the following 2 files inside the
# "data" folder:
## Link 1 (save the file as "iris.data"):
# https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data
## Link 2 ("crop.data.csv"):
# https://cdn.scribbr.com/wp-content/uploads/2020/03/crop.data_.anova_.zip
# Extract the "crop.data.csv" file into the data folder

## STEP 3. Load the downloaded sample datasets ----
# Load the datasets


library(readr)
StudentPerformanceDataset <- read_csv("data/StudentPerformanceDataset.csv")
View(StudentPerformanceDataset)

# Dimensions ----
## STEP 5. Preview the Loaded Datasets ----
# Dimensions refer to the number of observations (rows) and the number of
# attributes/variables/features (columns). Execute the following commands to
# display the dimensions of your datasets:
dim(StudentPerformanceDataset)

# Data Types ----
## STEP 6. Identify the Data Types ----
# Knowing the data types will help you to identify the most appropriate
# visualization types and algorithms that can be applied. It can also help you
# to identify the need to convert from categorical data (factors) to integers
# or vice versa where necessary. Execute the following command to identify the
# data types:
sapply(StudentPerformanceDataset, class)

### STEP 7. Identify the number of instances that belong to each class. ----
# It is more sensible to count categorical variables (factors or dimensions)
# than numeric variables, e.g., counting the number of male and female
# participants instead of counting the frequency of each participant’s height
student_dataset_density_freq <- StudentPerformanceDataset$class_group
cbind(frequency = table(student_dataset_density_freq),
      percentage = prop.table(table(student_dataset_density_freq)) * 100)

student_dataset_density_freq <- StudentPerformanceDataset$YOB
cbind(frequency = table(student_dataset_density_freq),
      percentage = prop.table(table(student_dataset_density_freq)) * 100)

student_dataset_density_freq <- StudentPerformanceDataset$drop_bi_now
cbind(frequency = table(student_dataset_density_freq),
      percentage = prop.table(table(student_dataset_density_freq)) * 100)

student_dataset_density_freq <- StudentPerformanceDataset$romantic_relationships
cbind(frequency = table(student_dataset_density_freq),
      percentage = prop.table(table(student_dataset_density_freq)) * 100)

student_dataset_density_freq <- StudentPerformanceDataset$commute
cbind(frequency = table(student_dataset_density_freq),
      percentage = prop.table(table(student_dataset_density_freq)) * 100)
