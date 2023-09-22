## formatR - Required to format R code in the markdown ----
if (!is.element("formatR", installed.packages()[, 1])) {
  install.packages("formatR", dependencies = TRUE,
                   repos="https://cloud.r-project.org")
}
require("formatR")


## readr - Load datasets from CSV files ----
if (!is.element("readr", installed.packages()[, 1])) {
  install.packages("readr", dependencies = TRUE,
                   repos="https://cloud.r-project.org")
}
require("readr")

student_performance_dataset <-
  readr::read_csv(
    "data/20230412-20230719-BI1-BBIT4-1-StudentPerformanceDataset.CSV", # nolint
    col_types =
      readr::cols(
        class_group =
          readr::col_factor(levels = c("A", "B", "C")),
        gender = readr::col_factor(levels = c("1", "0")),
        YOB = readr::col_date(format = "%Y"),
        regret_choosing_bi =
          readr::col_factor(levels = c("1", "0")),
        drop_bi_now =
          readr::col_factor(levels = c("1", "0")),
        motivator =
          readr::col_factor(levels = c("1", "0")),
        read_content_before_lecture =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        anticipate_test_questions =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        answer_rhetorical_questions =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        find_terms_I_do_not_know =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        copy_new_terms_in_reading_notebook =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        take_quizzes_and_use_results =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        reorganise_course_outline =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        write_down_important_points =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        space_out_revision =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        studying_in_study_group =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        schedule_appointments =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        goal_oriented =
          readr::col_factor(levels =
                              c("1", "0")),
        spaced_repetition =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        testing_and_active_recall =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        interleaving =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        categorizing =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        retrospective_timetable =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        cornell_notes =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        sq3r = readr::col_factor(levels =
                                   c("1", "2", "3", "4")),
        commute = readr::col_factor(levels =
                                      c("1", "2",
                                        "3", "4")),
        study_time = readr::col_factor(levels =
                                         c("1", "2",
                                           "3", "4")),
        repeats_since_Y1 = readr::col_integer(),
        paid_tuition = readr::col_factor(levels =
                                           c("0", "1")),
        free_tuition = readr::col_factor(levels =
                                           c("0", "1")),
        extra_curricular = readr::col_factor(levels =
                                               c("0", "1")),
        sports_extra_curricular =
          readr::col_factor(levels = c("0", "1")),
        exercise_per_week = readr::col_factor(levels =
                                                c("0", "1",
                                                  "2",
                                                  "3")),
        meditate = readr::col_factor(levels =
                                       c("0", "1",
                                         "2", "3")),
        pray = readr::col_factor(levels =
                                   c("0", "1",
                                     "2", "3")),
        internet = readr::col_factor(levels =
                                       c("0", "1")),
        laptop = readr::col_factor(levels = c("0", "1")),
        family_relationships =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        friendships = readr::col_factor(levels =
                                          c("1", "2", "3",
                                            "4", "5")),
        romantic_relationships =
          readr::col_factor(levels =
                              c("0", "1", "2", "3", "4")),
        spiritual_wellnes =
          readr::col_factor(levels = c("1", "2", "3",
                                       "4", "5")),
        financial_wellness =
          readr::col_factor(levels = c("1", "2", "3",
                                       "4", "5")),
        health = readr::col_factor(levels = c("1", "2",
                                              "3", "4",
                                              "5")),
        day_out = readr::col_factor(levels = c("0", "1",
                                               "2", "3")),
        night_out = readr::col_factor(levels = c("0",
                                                 "1", "2",
                                                 "3")),
        alcohol_or_narcotics =
          readr::col_factor(levels = c("0", "1", "2", "3")),
        mentor = readr::col_factor(levels = c("0", "1")),
        mentor_meetings = readr::col_factor(levels =
                                              c("0", "1",
                                                "2", "3")),
        `Attendance Waiver Granted: 1 = Yes, 0 = No` =
          readr::col_factor(levels = c("0", "1")),
        GRADE = readr::col_factor(levels =
                                    c("A", "B", "C", "D",
                                      "E"))),
    locale = readr::locale())

## STEP 5. Preview the Loaded Datasets ----
# Dimensions refer to the number of observations (rows) and the number of
# attributes/variables/features (columns). Execute the following commands to
# display the dimensions of your datasets:

dim(student_performance_dataset)

# Data Types ----
## STEP 6. Identify the Data Types ----
# Knowing the data types will help you to identify the most appropriate
# visualization types and algorithms that can be applied. It can also help you
# to identify the need to convert from categorical data (factors) to integers
# or vice versa where necessary. Execute the following command to identify the
# data types:
sapply(student_performance_dataset, class)

### STEP 7. Identify the number of instances that belong to each class. ----
# It is more sensible to count categorical variables (factors or dimensions)
# than numeric variables, e.g., counting the number of male and female
# participants instead of counting the frequency of each participant’s height.
student_density_freq <- student_performance_dataset$write_down_important_points
cbind(frequency = table(student_density_freq),
      percentage = prop.table(table(student_density_freq)) * 100)

student_density_freq <- student_performance_dataset$read_content_before_lecture
cbind(frequency = table(student_density_freq),
      percentage = prop.table(table(student_density_freq)) * 100)

student_density_freq <- student_performance_dataset$schedule_appointments
cbind(frequency = table(student_density_freq),
      percentage = prop.table(table(student_density_freq)) * 100)

### STEP 9. Measure the distribution of the data for each variable ----
summary(student_performance_dataset)


# Low variability is ideal because it means that you can better predict
# information about the population based on sample data.High variability means
# that the values are less consistent, thus making it harder to make
# predictions.

sapply(student_performance_dataset[, c(97,78,79,81,82,86,91,92,96,99)], sd)


### STEP 11. Measure the variance of each variable ----
sapply(student_performance_dataset[, c(97,78,79,81,82,86,91,92,96,99)], var)

### STEP 12. Measure the kurtosis of each variable ----
# The Kurtosis informs you of how often outliers occur in the results.

# There are different formulas for calculating kurtosis.
# Specifying “type = 2” allows us to use the 2nd formula which is the same
# kurtosis formula used in SPSS and SAS. More details about any function can be
# obtained by searching the R help knowledge base. The knowledge base says:

# In “type = 2” (used in SPSS and SAS):
# 1.	Kurtosis < 3 implies a low number of outliers
# 2.	Kurtosis = 3 implies a medium number of outliers
# 3.	Kurtosis > 3 implies a high number of outliers

if (!is.element("e1071", installed.packages()[, 1])) {
  install.packages("e1071", dependencies = TRUE)
}
require("e1071")

# In “type = 2” (used in SPSS and SAS):
# 1.	Kurtosis < 3 implies a low number of outliers
# 2.	Kurtosis = 3 implies a medium number of outliers
# 3.	Kurtosis > 3 implies a high number of outliers


sapply(student_performance_dataset[,c(97,78,79,81,82,86,91,92,96,99)],  kurtosis, type = 2)

## STEP 14. Measure the covariance between variables ----
# Note that the covariance and the correlation are computed for numeric values
# only, not categorical values.
# only, not categorical values.

student_performance_dataset_cov <- cov(student_performance_dataset[,c(97,78,79,81,82,86,91,92,96,99),])
View(student_performance_dataset_cov)

## STEP 15. Measure the correlation between variables ----
student_performance_dataset_cor <- cor(student_performance_dataset[, c(97,78,79,81,82,86,91,92,96,99),])
View(student_performance_dataset_cor)

# Inferential Statistics ----

## STEP 16. Perform ANOVA on the “student_performance_dataset” dataset ----
# ANOVA (Analysis of Variance) is a statistical test used to estimate how a
# quantitative dependent variable changes according to the levels of one or
# more categorical independent variables.

# The null hypothesis (H0) of the ANOVA is that
# “there is no difference in means”, and
# the alternative hypothesis (Ha) is that
# “the means are different from one another”.

# Dependent variable:	TOTAL= Coursework TOTAL + EXAM(100%)
# Independent variables: studying_in_study_group

# One-Way ANOVA can be used to test the effect of the romantic_relationships on
# TOTAL

student_performance_dataset_one_way_anova <- aov(`TOTAL = Coursework TOTAL + EXAM (100%)`   ~ studying_in_study_group, data = student_performance_dataset)
summary(student_performance_dataset_one_way_anova)

sapply(student_performance_dataset, class)

# We can also have a situation where the TOTAL depends not only on
# space out revision but also on the studying in study group. A two-way ANOVA
# can then be used to confirm this. Execute the following for a two-way ANOVA
# (two independent variables):

student_performance_dataset_additive_two_way_anova <- aov(`TOTAL = Coursework TOTAL + EXAM (100%)` ~ studying_in_study_group + space_out_revision, # nolint
                                           data = student_performance_dataset)
summary(student_performance_dataset_additive_two_way_anova)


# Specifying a (+) between the two independent
# variables (studying_in_study_group + space_out_revision) implies that they have 
# an additive effect.

# Execute the following to perform a two-way ANOVA with the assumption that
# fertilizer and density have an interaction effect:

student_performance_dataset_interactive_two_way_anova <- aov(`TOTAL = Coursework TOTAL + EXAM (100%)` ~ studying_in_study_group * space_out_revision, # nolint
                                              data = student_performance_dataset)
summary(student_performance_dataset_interactive_two_way_anova)

### STEP 18. Create Box and Whisker Plots for Each Numeric Attribute ----
# Box and whisker plots are useful in understanding the distribution of data.

# Execute the following code to create box and whisker plots for the
# “BostonHousing” dataset:
# This considers the last 3 attributes which are numeric. The fourth attribute
# in the dataset is of the type “factor”, i.e., categorical.


boxplot(student_performance_dataset[, 96], main = names(student_performance_dataset)[96])

### STEP 19. Create Bar Plots for Each Categorical Attribute ----
# Categorical attributes (factors) can also be visualized. This is done using a
# bar chart to give an idea of the proportion of instances that belong to each
# category.

# The features (attributes) in the “crop_dataset” dataset are:
# 1.	studying_in_study_group
# 2.	TOTAL= Coursework TOTAL + EXAM(100%)

# Execute the following to create a bar plot for the categorical attributes
# 96 in the “student_performance_dataset” dataset:

barplot(table(student_performance_dataset[, 96]), main = names(student_performance_dataset)[96])

### STEP 20. Create a Missingness Map to Identify Missing Data ----
# Some machine learning algorithms cannot handle missing data. A missingness
# map (also known as a missing plot) can be used to get an idea of the amount
# missing data in the dataset. The x-axis of the missingness map shows the
# attributes of the dataset whereas the y-axis shows the instances in the
# dataset.
# Horizontal lines indicate missing data for an instance whereas vertical lines
# indicate missing data for an attribute. The missingness map requires the
# “Amelia” package.

# Execute the following to create a map to identify the missing data in each
# dataset:
if (!is.element("Amelia", installed.packages()[, 1])) {
  install.packages("Amelia", dependencies = TRUE)
}
require("Amelia")

missmap(student_performance_dataset, col = c("red", "grey"), legend = TRUE)

## Multivariate Plots ----

### STEP 21. Create a Correlation Plot ----
# Correlation plots can be used to get an idea of which attributes change
# together. The function “corrplot()” found in the package “corrplot” is
# required to perform this. The larger the dot in the correlation plot, the
# larger the correlation. Blue represents a positive correlation whereas red
# represents a negative correlation.

# Execute the following to create correlation plots for the datasets
# loaded :
if (!is.element("corrplot", installed.packages()[, 1])) {
  install.packages("corrplot", dependencies = TRUE)
}
require("corrplot")
corrplot(cor(student_performance_dataset[, 96:97]), method = "circle")

# Alternatively, the 'ggcorrplot::ggcorrplot()' function can be used to plot a
# more visually appealing plot.
# The code below shows how to install a package in R:
if (!is.element("ggcorrplot", installed.packages()[, 1])) {
  install.packages("ggcorrplot", dependencies = TRUE)
}
require("ggcorrplot")
ggcorrplot(cor(student_performance_dataset[, 96:97]))



