Business Intelligence Lab Submission Markdown
================
<Specify your group name here>
<Specify the date when you submitted the lab>

- [Student Details](#student-details)
- [Setup Chunk](#setup-chunk)
- [Loading the Student Performance
  Dataset](#loading-the-student-performance-dataset)
  - [Description of the Dataset](#description-of-the-dataset)
  - [Identifying Data Types](#identifying-data-types)
  - [Measures of Frequency](#measures-of-frequency)
  - [Measure of Distribution](#measure-of-distribution)
  - [\<You Can Have Another Sub-Title Here if you
    wish\>](#you-can-have-another-sub-title-here-if-you-wish)

# Student Details

<table>
<colgroup>
<col style="width: 53%" />
<col style="width: 46%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong>Student ID Numbers and Names of Group Members</strong></td>
<td><ol type="1">
<li><p>133996 - B - Trevor Ngugi</p></li>
<li><p>133996 - B - Immaculate Haayo</p></li>
<li><p>135859 - B - Pauline Wairimu</p></li>
<li><p>127701 - B - Clarice Gitonga</p></li>
<li><p>126761 - B - Virginia Wanjiru</p></li>
</ol></td>
</tr>
<tr class="even">
<td><strong>GitHub Classroom Group Name</strong></td>
<td>Champions</td>
</tr>
<tr class="odd">
<td><strong>Course Code</strong></td>
<td>BBT4206</td>
</tr>
<tr class="even">
<td><strong>Course Name</strong></td>
<td>Business Intelligence II</td>
</tr>
<tr class="odd">
<td><strong>Program</strong></td>
<td>Bachelor of Business Information Technology</td>
</tr>
<tr class="even">
<td><strong>Semester Duration</strong></td>
<td>21<sup>st</sup> August 2023 to 28<sup>th</sup> November 2023</td>
</tr>
</tbody>
</table>

# Setup Chunk

We start by installing all the required packages

``` r
## formatR - Required to format R code in the markdown ----

# Installed  renv package:
if (!is.element("renv", installed.packages()[, 1])) {
  install.packages("renv", dependencies = TRUE)
}
require("renv")
```

------------------------------------------------------------------------

**Note:** the following “*KnitR*” options have been set as the defaults
in this markdown:  
`knitr::opts_chunk$set(echo = TRUE, warning = FALSE, eval = TRUE, collapse = FALSE, tidy.opts = list(width.cutoff = 80), tidy = TRUE)`.

``` r
knitr::opts_chunk$set(
    eval = TRUE,
    echo = TRUE,
    warning = FALSE,
    collapse = FALSE,
    tidy = TRUE
)
```

------------------------------------------------------------------------

**Note:** the following “*R Markdown*” options have been set as the
defaults in this markdown:

> output:  
>   
> github_document:  
> toc: yes  
> toc_depth: 4  
> fig_width: 6  
> fig_height: 4  
> df_print: default  
>   
> editor_options:  
> chunk_output_type: console

# Loading the Student Performance Dataset

StudentPerformanceDataset is then loaded. The dataset and its metadata
are available here:
<https://drive.google.com/drive/folders/1-BGEhfOwquXF6KKXwcvrx7WuZXuqmW9q?usp=sharing>

``` r
## We loaded the dataset from a csv file

if (!is.element("readr", installed.packages()[, 1])) {
    install.packages("readr", dependencies = TRUE, repos = "https://cloud.r-project.org")
}
require("readr")
```

    ## Loading required package: readr

``` r
student_performance_dataset <- readr::read_csv("C:/Users/Virginia/OneDrive - Strathmore University/Desktop/Business Intelligence/BBT4206-R-Lab2of15-ExploratoryDataAnalysis-champions/data/StudentPerformanceDataset.csv",
    col_types = readr::cols(class_group = readr::col_factor(levels = c("A", "B",
        "C")), gender = readr::col_factor(levels = c("1", "0")), YOB = readr::col_date(format = "%Y"),
        regret_choosing_bi = readr::col_factor(levels = c("1", "0")), drop_bi_now = readr::col_factor(levels = c("1",
            "0")), motivator = readr::col_factor(levels = c("1", "0")), read_content_before_lecture = readr::col_factor(levels = c("1",
            "2", "3", "4", "5")), anticipate_test_questions = readr::col_factor(levels = c("1",
            "2", "3", "4", "5")), answer_rhetorical_questions = readr::col_factor(levels = c("1",
            "2", "3", "4", "5")), find_terms_I_do_not_know = readr::col_factor(levels = c("1",
            "2", "3", "4", "5")), copy_new_terms_in_reading_notebook = readr::col_factor(levels = c("1",
            "2", "3", "4", "5")), take_quizzes_and_use_results = readr::col_factor(levels = c("1",
            "2", "3", "4", "5")), reorganise_course_outline = readr::col_factor(levels = c("1",
            "2", "3", "4", "5")), write_down_important_points = readr::col_factor(levels = c("1",
            "2", "3", "4", "5")), space_out_revision = readr::col_factor(levels = c("1",
            "2", "3", "4", "5")), studying_in_study_group = readr::col_factor(levels = c("1",
            "2", "3", "4", "5")), schedule_appointments = readr::col_factor(levels = c("1",
            "2", "3", "4", "5")), goal_oriented = readr::col_factor(levels = c("1",
            "0")), spaced_repetition = readr::col_factor(levels = c("1", "2", "3",
            "4")), testing_and_active_recall = readr::col_factor(levels = c("1",
            "2", "3", "4")), interleaving = readr::col_factor(levels = c("1", "2",
            "3", "4")), categorizing = readr::col_factor(levels = c("1", "2", "3",
            "4")), retrospective_timetable = readr::col_factor(levels = c("1", "2",
            "3", "4")), cornell_notes = readr::col_factor(levels = c("1", "2", "3",
            "4")), sq3r = readr::col_factor(levels = c("1", "2", "3", "4")), commute = readr::col_factor(levels = c("1",
            "2", "3", "4")), study_time = readr::col_factor(levels = c("1", "2",
            "3", "4")), repeats_since_Y1 = readr::col_integer(), paid_tuition = readr::col_factor(levels = c("0",
            "1")), free_tuition = readr::col_factor(levels = c("0", "1")), extra_curricular = readr::col_factor(levels = c("0",
            "1")), sports_extra_curricular = readr::col_factor(levels = c("0", "1")),
        exercise_per_week = readr::col_factor(levels = c("0", "1", "2", "3")), meditate = readr::col_factor(levels = c("0",
            "1", "2", "3")), pray = readr::col_factor(levels = c("0", "1", "2", "3")),
        internet = readr::col_factor(levels = c("0", "1")), laptop = readr::col_factor(levels = c("0",
            "1")), family_relationships = readr::col_factor(levels = c("1", "2",
            "3", "4", "5")), friendships = readr::col_factor(levels = c("1", "2",
            "3", "4", "5")), romantic_relationships = readr::col_factor(levels = c("0",
            "1", "2", "3", "4")), spiritual_wellnes = readr::col_factor(levels = c("1",
            "2", "3", "4", "5")), financial_wellness = readr::col_factor(levels = c("1",
            "2", "3", "4", "5")), health = readr::col_factor(levels = c("1", "2",
            "3", "4", "5")), day_out = readr::col_factor(levels = c("0", "1", "2",
            "3")), night_out = readr::col_factor(levels = c("0", "1", "2", "3")),
        alcohol_or_narcotics = readr::col_factor(levels = c("0", "1", "2", "3")),
        mentor = readr::col_factor(levels = c("0", "1")), mentor_meetings = readr::col_factor(levels = c("0",
            "1", "2", "3")), `Attendance Waiver Granted: 1 = Yes, 0 = No` = readr::col_factor(levels = c("0",
            "1")), GRADE = readr::col_factor(levels = c("A", "B", "C", "D", "E"))),
    locale = readr::locale())
```

## Description of the Dataset

We then display the number of observations and number of variables. We
have 101 observations and 100 variables in our dataset.

``` code
dim(student_performance_dataset)
```

In this step, we identify the data types in the datasets which will help
us in determining which visualization types are most appropriate to be
used.

## Identifying Data Types

``` r
sapply(student_performance_dataset, class)
```

    ##                                                                                                                                                                                                                                                                                   class_group 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                        gender 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                           YOB 
    ##                                                                                                                                                                                                                                                                                        "Date" 
    ##                                                                                                                                                                                                                                                                            regret_choosing_bi 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                   drop_bi_now 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                     motivator 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                   read_content_before_lecture 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                     anticipate_test_questions 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                   answer_rhetorical_questions 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                      find_terms_I_do_not_know 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                            copy_new_terms_in_reading_notebook 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                  take_quizzes_and_use_results 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                     reorganise_course_outline 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                   write_down_important_points 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                            space_out_revision 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                       studying_in_study_group 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                         schedule_appointments 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                 goal_oriented 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                             spaced_repetition 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                     testing_and_active_recall 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                  interleaving 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                  categorizing 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                       retrospective_timetable 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                 cornell_notes 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                          sq3r 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                       commute 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                    study_time 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                              repeats_since_Y1 
    ##                                                                                                                                                                                                                                                                                     "integer" 
    ##                                                                                                                                                                                                                                                                                  paid_tuition 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                  free_tuition 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                              extra_curricular 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                       sports_extra_curricular 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                             exercise_per_week 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                      meditate 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                          pray 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                      internet 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                        laptop 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                          family_relationships 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                   friendships 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                        romantic_relationships 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                             spiritual_wellnes 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                            financial_wellness 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                        health 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                       day_out 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                     night_out 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                          alcohol_or_narcotics 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                                        mentor 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                               mentor_meetings 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                              A - 1. I am enjoying the subject 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                          A - 2. Classes start and end on time 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                               A - 3. The learning environment is participative, involves learning by doing and is group-based 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                             A - 4. The subject content is delivered according to the course outline and meets my expectations 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                           A - 5. The topics are clear and logically developed 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                             A - 6. I am developing my oral and writing skills 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                            A - 7. I am developing my reflective and critical reasoning skills 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                       A - 8. The assessment methods are assisting me to learn 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                            A - 9. I receive relevant feedback 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                             A - 10. I read the recommended readings and notes 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                   A - 11. I use the eLearning material posted 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                         B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                             B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                     C - 2. Quizzes at the end of each concept 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                           C - 3. Lab manuals that outline the steps to follow during the labs 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                           C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                          C - 5. Supplementary videos to watch 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                    C - 6. Supplementary podcasts to listen to 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                          C - 7. Supplementary content to read 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                                        C - 8. Lectures slides 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                            C - 9. Lecture notes on some of the lecture slides 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ## C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/comical/lively the lectures are) 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                              C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                      C - 12. The recordings of online classes 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                     D - 1. \r\nWrite two things you like about the teaching and learning in this unit so far. 
    ##                                                                                                                                                                                                                                                                                   "character" 
    ##                                                                                                                                                          D - 2. Write at least one recommendation to improve the teaching and learning in this unit (for the remaining weeks in the semester) 
    ##                                                                                                                                                                                                                                                                                   "character" 
    ##                                                                                                                                                                                                                                                              Average Course Evaluation Rating 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                     Average Level of Learning Attained Rating 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                             Average Pedagogical Strategy Effectiveness Rating 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                              Project: Section 1-4: (20%) x/10 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                             Project: Section 5-11: (50%) x/10 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                                Project: Section 12: (30%) x/5 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                              Project: (10%): x/30 x 100 TOTAL 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                       Quiz 1 on Concept 1 (Introduction) x/32 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                             Quiz 3 on Concept 3 (Linear) x/15 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                         Quiz 4 on Concept 4 (Non-Linear) x/22 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                       Quiz 5 on Concept 5 (Dashboarding) x/10 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                               Quizzes and  Bonus Marks (7%): x/79 x 100 TOTAL 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                 Lab 1 - 2.c. - (Simple Linear Regression) x/5 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                Lab 2 - 2.e. -  (Linear Regression using Gradient Descent) x/5 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                               Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                             Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                          Lab 5 - Chart JS Dashboard Setup x/5 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                                      Lab Work (7%) x/25 x 100 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                                        CAT 1 (8%): x/38 x 100 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                                       CAT 2 (8%): x/100 x 100 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                    Attendance Waiver Granted: 1 = Yes, 0 = No 
    ##                                                                                                                                                                                                                                                                                      "factor" 
    ##                                                                                                                                                                                                                                                                        Absenteeism Percentage 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                                  Coursework TOTAL: x/40 (40%) 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                                              EXAM: x/60 (60%) 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                        TOTAL = Coursework TOTAL + EXAM (100%) 
    ##                                                                                                                                                                                                                                                                                     "numeric" 
    ##                                                                                                                                                                                                                                                                                         GRADE 
    ##                                                                                                                                                                                                                                                                                      "factor"

## Measures of Frequency

In the code illustrated below will be checking the frequency of students
who take down important points, read content before the lecture and
schedule appointments to consult.

``` r
student_density_freq <- student_performance_dataset$write_down_important_points
cbind(frequency = table(student_density_freq), percentage = prop.table(table(student_density_freq)) *
    100)
```

    ##   frequency percentage
    ## 1         4   3.960396
    ## 2         8   7.920792
    ## 3        20  19.801980
    ## 4        38  37.623762
    ## 5        31  30.693069

``` r
student_density_freq <- student_performance_dataset$read_content_before_lecture
cbind(frequency = table(student_density_freq), percentage = prop.table(table(student_density_freq)) *
    100)
```

    ##   frequency percentage
    ## 1        11  10.891089
    ## 2        25  24.752475
    ## 3        47  46.534653
    ## 4        14  13.861386
    ## 5         4   3.960396

``` r
student_density_freq <- student_performance_dataset$schedule_appointments
cbind(frequency = table(student_density_freq), percentage = prop.table(table(student_density_freq)) *
    100)
```

    ##   frequency percentage
    ## 1        42  41.584158
    ## 2        35  34.653465
    ## 3        16  15.841584
    ## 4         5   4.950495
    ## 5         3   2.970297

## Measure of Distribution

``` r
sapply(student_performance_dataset[, 99], sd)
```

    ## TOTAL = Coursework TOTAL + EXAM (100%) 
    ##                               15.72533

``` r
sapply(student_performance_dataset[, 92], sd)
```

    ## Lab Work (7%) x/25 x 100 
    ##                 19.30313

``` r
sapply(student_performance_dataset[, 91], sd)
```

    ## Lab 5 - Chart JS Dashboard Setup x/5 
    ##                              2.33272

``` r
sapply(student_performance_dataset[, 90], sd)
```

    ## Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5 
    ##                                                NA

``` r
sapply(student_performance_dataset[, c(99, 92, 91)], sd)
```

    ## TOTAL = Coursework TOTAL + EXAM (100%)               Lab Work (7%) x/25 x 100 
    ##                               15.72533                               19.30313 
    ##   Lab 5 - Chart JS Dashboard Setup x/5 
    ##                                2.33272

## \<You Can Have Another Sub-Title Here if you wish\>

``` r
# Fill this with other R related code that will be executed when the R markdown
```

**etc.** as per the lab submission requirements. Be neat and communicate
in a clear and logical manner.
