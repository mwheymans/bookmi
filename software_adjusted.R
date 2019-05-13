---
output:
  pdf_document: default
  html_document: default
---

# (PART) Part I: Working with Software {-}

# Working with SPSS and R

This book is about working with missing data methods in SPSS and R. This chapter shows some data management methods that makes working with both software programs easier as reading in R data in SPSS, reading in SPSS data in R and installing packages in R.   

## Reading and saving data in SPSS

You can Read data in, in SPSS via the menu File: 

> File -> Open -> Data. 

All kind of file types can be selected. Of course the SPSS .sav files, but also .por, .xlsx, .cvs, SAS, Stata, etc. After you have selected a specific file type other than SPSS you may have to go through several steps before you see the data in the Data View window. Saving files in SPSS is possible via the Save Data As option under the menu File. You can choose the same kind of file types.

## Reading in R data into SPSS

When you have used the write.table function (see paragraph 1.4) to save R data you can easily read them in into SPSS by following the next steps:

> File -> Open data -> “All files (*.*)”

than you will see the file you want to import in SPSS, here the “Backpain50 R file”.

```{r fig18, echo = FALSE, fig.cap="Choosing the dataset to import in SPSS", out.width='95%', fig.align='center'}
knitr::include_graphics("images/fig1.18.png")
```

Then click Open (wait a couple of seconds) and click on next. You will see the following window that is part of the Text Import Wizard procedure in SPSS (Figure \@ref(fig:fig19)):

```{r fig19, echo = FALSE, fig.cap="Step 1 of the Text Import Wizard", out.width='95%', fig.align='center'}
knitr::include_graphics("images/fig1.19.png")
```

Then click the “Next >” button 5 times, passing by the following windows:

Step 2 of 6 (Figure \@ref(fig:fig20)):
To change how variables are arranged: here delimited
To include variable names included at the top of the file: here Yes.
To set the decimal symbol: here a comma.

```{r fig20, echo = FALSE, fig.cap="Step 2 of the Text Import Wizard", out.width='95%', fig.align='center'}
knitr::include_graphics("images/fig1.20.png")
```

Step 3 of 6 (Figure \@ref(fig:fig21)):

On which line number begins the first case: here 2
How cases are represented: Each line is a case.
How many cases you want to import: here all cases. 

```{r fig21, echo = FALSE, fig.cap="Step 3 of the Text Import Wizard", out.width='95%', fig.align='center'}
knitr::include_graphics("images/fig1.21.png")
```

Step 4 of 6 (Figure \@ref(fig:fig22)):
The delimiters that appear between variables; here the Semicolon.
The text qualifier: here Double quote.
Remove trailing spaces from string values: skip.

```{r fig22, echo = FALSE, fig.cap="Step 4 of the Text Import Wizard", out.width='95%', fig.align='center'}
knitr::include_graphics("images/fig1.22.png")
```

Step 5 of 6 (Figure \@ref(fig:fig23)):
Here you overwrite the Data format of the variable (you can also change that in the Variable View window, when the data has been read in).

```{r fig23, echo = FALSE, fig.cap="Step 5 of the Text Import Wizard", out.width='95%', fig.align='center'}
knitr::include_graphics("images/fig1.23.png")
```

Step 6 of 6:
To save your specifications of the previous steps into a separate file (Figure \@ref(fig:fig24)).

```{r fig24, echo = FALSE, fig.cap="Step 6 of the Text Import Wizard", out.width='95%', fig.align='center'}
knitr::include_graphics("images/fig1.24.png")
```

Then click finish and the data is imported in a new SPSS file. In that file you can of course change all kind of variable and data settings in the Variable View Window.

You can also skip step 2 to 5 by clicking the Finish button twice when you are at step 1. Than you use all default settings, which is most of the times an efficient option.

## Reading in data in RStudio

There are several procedures in RStudio to read in datasets. 

**Import datasets via “Import Dataset”**

An easy way is via the window at the right site above. There you will find in the Environment tab the button “Import Dataset”. When you click on it you can choose between different kind of file types, i.e. From Text, Excel, SPSS, SAS and Stata. When you apply this procedure for the first time RStudio asks for your permission to download a package called “haven”. This package is built to import and export data from several types. 

Once the `haven` package is installed, you can also read in data directly from the Console window by using:

```{r, echo = T, eval=F} 
library(haven)
dataset <- read_sav(file= "data/Backpain50.sav")
```

**Using the foreign package**

Another way to import an dataset is by making use of the foreign package. You find this package under the Packages Tab in the window at the right site below under the heading “System Library”. Install that package first. The `foreign` package includes the function `read.spss` to read in SPSS files, or read.cvs to read in tabular data. 

You use the following code to import an SPSS dataset:

```{r, echo = T, eval=F} 
library(foreign)
dataset <- read.spss(file= "data/Backpain50.sav", to.data.frame = T)
```

**Read.table**

You can use the read.table function to read in matrices and data frames by using:

```{r, echo = T, eval=F} 
dataset <- read.table(file="data/Backpain50 R file")
```

**Load**

You can Load a dataset or other objects as lists by using:

```{r, echo = T, eval=FALSE} 
load(file="data/listsave.RData")
```

## Saving data in RStudio

Datasets can be saved and read in by using different commands.

**write.table** 

You can use the write.table function to save data frames (datasets):

```{r, echo = T, eval=FALSE} 
library(foreign)
dataset <- read.spss(file= "data/Backpain50.sav", to.data.frame = T)
write.table(dataset, file="data/Backpain50 R file")
```

Before you can read in the dataset in SPSS you have to use write.table in the following way:

```{r, echo = T, eval=FALSE} 
write.table(dataset, file="data/Backpain50 R file", sep=";", dec=",", row.names=F)
```

The extra parameter settings, mean:
sep=";", separate each variable by an “;” indicator.
dec=",", use for decimals a “,” instead of an “.”.
row.names=F , Do not add an extra column with row.names.

These files can then be easily imported in SPSS by using the steps that were explained in paragraph 1.1. 

**Save**

You can also use the command save to save datasets, according to (notice the .RData extension):

```{r, echo = T, eval=FALSE} 
library(foreign)
dataset <- read.spss(file= "data/Backpain50.sav", to.data.frame = T)
save(dataset, file="data/Backpain50 R file.RData")
```

You can also use save without the .Rdata extension:

```{r, echo = T, eval=FALSE} 
library(foreign)
dataset <- read.spss(file= "data/Backpain50.sav", to.data.frame = T)
save(dataset, file="data/Backpain50 R file")
```

To get direct access to the data that you have saved, you can use the get function in combination with the load function like this:

```{r, echo = T, eval=FALSE} 
library(foreign)
dataset <- read.spss(file= "data/Backpain50.sav", to.data.frame = T)
save(dataset, file="data/Backpain50 R file")
get(load(file="data/Backpain50 R file"))
```

With save, you can save any R object, also lists such as:

```{r, echo = T, eval=FALSE} 
x <- list(a=1, b="example", c=3)
save(x, file="data/listsave.RData")
```

## Installing R Packages

Specific for R is that you use functions that are stored in packages to perform (statistical) analyses. When R is installed on your computer a folder called library is created. This folder contains packages that are part of the basic installation. There are also packages that are not part of the basic installation but are written by others. These are called add-on packages. These packages can be downloaded from the CRAN website (https://cran.r-project.org/). 

In this manual we will use the mice package to do all kind of imputation procedures, such as multiple imputation. mice is not part of the R basic installation which means that you have to install it first. One way to install packages is by using the `install.packages` function.

```{r, echo = T, eval=FALSE} 
install.packages("mice")
```

Another way is to use the window on the right site below and go to the Packages tab. When you click “Install” a new window will open. Than you can type “mice” on the blank line under “Packages (separate multiple with space or comma):” (Figure \@ref(fig:fig25) and Figure \@ref(fig:fig26)).   

```{r fig25, echo = FALSE, fig.cap="Install packages Window in RStudio to install packages from the CRAN website", out.width='95%', fig.align='center'}
knitr::include_graphics("images/fig1.25a.png")
```

```{r fig26, echo = FALSE, fig.cap="Enlarged Install packages Window in RStudio to install packages from the CRAN website", out.width='95%', fig.align='center'}
knitr::include_graphics("images/fig1.25b.png")
```

After you have clicked on “Install” the package will be downloaded from the CRAN website automatically and will be listed in the Package list named “User Library”.

Another way is to go to the CRAN website and download the package as a zip file in a directory on your computer. Again use the window on the right site below and go to the Packages tab. When you choose Install a new window is opened. Now under “Install from:” choose for “Package Archive File (.zip; .tar.gz)”  (Figure \@ref(fig:fig27) and Figure \@ref(fig:fig28)).  Than you can browse to the zip file and install the package.

```{r fig27, echo = FALSE, fig.cap="Install packages Window in RStudio to install packages from zip files", out.width='95%', fig.align='center'}
knitr::include_graphics("images/fig1.26a.png")
```

```{r fig28, echo = FALSE, fig.cap="Enlarged Install packages Window in RStudio to install packages from zip files", out.width='95%', fig.align='center'}
knitr::include_graphics("images/fig1.26b.png")
```

## Loading R Packages

Once an add-on R package has been installed you have to load it to get access to all functions that are part of that package. To load a library, you can use the function library() or require(). 

```{r, echo=FALSE, eval=FALSE} 
library(mice)
```

You have to load add-on packages each time you start a new R session. 

## Updating R Packages

To keep the add-on packages up to date you can use the update.packages() function.

```{r, echo=T, eval=FALSE} 
update.packages()
```

R will ask you if you want to update each package. If you type “y” in the Console window, R will update the packages.

In RStudio updating packages can be done in the Package tab as well. You can click on the Update button. A new window will open that contains a list of all packages that need to be updated. Subsequently you can select the packages you want to update. 

## Useful Missing data Packages and links

The main package that we will use in this manual is mice which stand for Multivariate Imputation by Chained Equations (MICE) (Van Buuren, 2009). Other packages that can be used to impute data or that can be used to do analyses after imputation are listed below.

**miceadds**
Package contains some additional multiple imputation functions (Robitzsch et al., 2017).
[See for more information.](https://cran.r-project.org/web/packages/miceadds/index.html)
 
**micemd** 
Package contains additional functions for the mice package to perform multiple imputation in two-level (Multilevel) data (Audigier & Resche-Rigon, 2017).
[See for more information.](https://cran.r-project.org/web/packages/micemd/index.html)

**mi**
Provides functions for data manipulation, imputing missing values in an approximate Bayesian framework, diagnostics of the models used to generate the imputations, confidence-building mechanisms to validate some of the assumptions of the imputation algorithm, and functions to analyze multiply imputed data sets (Gelman et al., 2015). 
[See for more information.](https://cran.r-project.org/web/packages/mi/index.html)

**MItools**
Small package to perform analyses and combine results from multiple-imputation datasets (Lumley, 2015).
[See for more information.](https://cran.r-project.org/web/packages/mitools/index.html)

**norm**
Package is for the Analysis of multivariate normal datasets with missing values. It contains the mi.inference function. This function combines estimates and standard errors to produce a single inference. Uses the technique described by Rubin (1987), which are called the Rubin’s Rules (RR) (Novo, 2015).
[See for more information.](https://cran.r-project.org/web/packages/norm/index.html)

**vim (visualization and imputation of missing values)**
Package includes tools for the visualization of missing and/or imputed values. In addition, the quality of imputation can be visually explored using various univariate, bivariate, multiple and multivariate plot methods (Templ et al., 2017).
[See for more information.](https://cran.r-project.org/web/packages/mi/index.html)

**BaylorEdPsych**
Package for Baylor University Educational Psychology Quantitative Courses. This package included Little’s MCAR test (Beaujean, 2015).
[See for more information.](https://cran.r-project.org/web/packages/BaylorEdPsych/index.html)

**MKmisc**
Contains several functions for statistical data analysis; e.g. for sample size and power calculations, computation of confidence intervals, and generation of similarity matrices. This package contains the mi.t.test function for pooling t-tests after multiple imputation (Kohl, 2016).
[See for more information.](https://cran.r-project.org/web/packages/MKmisc/index.html)

**mvnmle**
Package estimates the maximum likelihood estimate of the mean vector and variance-covariance matrix for multivariate normal data with missing values. This package is needed for the mlest function this is used for Little’s MCAR test in Cahpter 2.
[See for more information.](https://cran.r-project.org/web/packages/mvnmle/index.html)

**naniar**
This package provides tidy ways to summarise, visualise, and manipulate missing data.
[See for more information.](http://naniar.njtierney.com/index.html)
