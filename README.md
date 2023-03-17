# Setting up the environment

## Installing Python and packages

##### 1. Install Python from https://www.python.org/downloads/
##### 2. Add the path into your shell profile
```
alias python='/usr/local/bin/python3'
```
##### 3. Check the default python used
```
which python
```
##### 4. Install robotframework and robotframework-seleniumlibrary package using pip3
```
pip3 install robotframework
pip3 install robotframework-seleniumlibrary
pip3 install robotframework-requests
pip3 install robotframework-datadriver
pip3 install robotframework-csvlibrary
```
##### 5. Check is the packages installed correctly
```
pip3 show robotframework
pip3 show robotframework-seleniumlibrary
pip3 show robotframework-requests
pip3 show robotframework-datadriver
pip3 show robotframework-csvlibrary
```
#### Setting up PyCharm
##### 6. Install PyCharm from https://www.jetbrains.com/pycharm/
##### 7. Open the project
##### 8. Go to PyCharm preferences and search for Python Interpreter
##### 9. Select/add your Python interpreter. In my case, it is as below
```
Adding existing interpreter at this path /usr/local/bin/python3
```
##### 10. If the correct interpreter is added, the packages that you had installed at step 4 will be shown
##### 11. Go to PyCharm preferences and go to plugin
##### 12. (OPTIONAL) Search and install Hyper RobotFramework Support
#### Setting up Chromedriver
##### 13. Check your Chrome version
##### 14. Download the respective version of Chromedriver from https://chromedriver.chromium.org/downloads
##### 15. Extract and replace chromedriver in this path <RepoName>/drivers/chromedriver

# To execute test suite created:
##### 1. Open project with PyCharm
##### 2. In the built in terminal in PyCharm, make sure you are in the root of the project folder 
##### 3. In the terminal, run this command to run the test suite. Running from terminal allow us to specify where would the reports/output saved in. In this case, it will be saved in reports. Alternatively you can run from the UI by opening the tests file and clicking the run button beside test case.
```
robot -d reports tests/assessmentSuite.robot
```

# Test Cases Scripted
##### 1. Login As Clerk Successfully
##### 2. Login As Book Keeper Successfully
##### 3. Login As Governor Successfully
##### 4. Login Unsuccessfully With Invalid Credential
##### 5. Upload Valid CSV To Working Class Heroes As Clerk
##### 6. Upload Invalid Date To Working Class Heroes As Clerk
##### 7. Upload Invalid Natid Syntax To Working Class Heroes As Clerk
##### 8. Upload Invalid Natid Length To Working Class Heroes As Clerk
##### 9. Insert Valid Hero Via API
##### 10. Insert Invalid Hero Via API
##### 11. List All Heroes As Governor
##### 12. Search All Heroes List Using Natid As Governor
##### 13. Search All Heroes List Using Name As Governor
##### 14. Search Hero Summary As Governor

# Issues Found

## 1. System does not insert remaining record when a record is invalid
### Pre-requisite:
     - Data file with invalid record in the middle
### Step to replicate(STR):
     1. Login as clerk
     2. Click add hero
     3. Click upload a csv file
     4. Upload data file mention in pre-requisite
     5. Click create button
### Actual behavior:
     - It stopped inserting records when there is invalid record
### Expected behavior:
     - It should continue to insert the remaining records that are valid
### Priority: P1

## 2. Shouldn't be able to upload invalid data successfully
### Pre-requisite:
     - Prepare invalid data. E.g. invalid syntax, invalid length
### Step to replicate(STR):
     1. Login as clerk
     2. Click add hero
     3. Click upload a csv file
     4. Upload data file mention in pre-requisite
     5. Click create button
### Actual behavior:
     - When uploading data with invalid natid syntax (id#######) and also invalid natid length (natid-#########), it was uploaded successfully
### Expected behavior:
     - Should prompt error/warning alert stating unable to upload the data
### Priority: P0

## 3. Unable to upload hero with deathDate
### Pre-requisite:
     - Working Class Hero data with deathDate
### Step to replicate(STR):
     1. Login as clerk
     2. Click add hero
     3. Click upload a csv file
     4. Upload data file mention in pre-requisite
     5. Click create button
### Actual behavior:
     - Unable to upload user with deathDate. It was parsing the 19th index when there is only 18th
#####     https://ibb.co/2t42q2c
### Expected behavior:
     - Able to upload user with deathDate as long as the format is correct and it is not earlier than the birthDate
### Priority: P0
    
## 4. Generating process for tax relief file stuck at in progress
### Pre-requisite:
     - N/A
### Step to replicate(STR):
     1. Login as book keeper
     2. Click generate tax relief file on dashboard
### Actual behavior:
     - It was in progess for 20 minutes
#####     https://ibb.co/cQRPTST
### Expected behavior:
     - The process should take less time
### Priority: P0

## 5. Unable to insert hero via API
### Pre-requisite:
     - Valid payload for the API
### Step to replicate(STR):
     1. Send Insert Post API request
     2. Check the response
### Actual behavior:
     - Get response status 400 and error message "There are some issues with working class hero"
#####     https://ibb.co/CttmJ4d
#####     https://ibb.co/crTCv30
### Expected behavior:
     - Get response status 200 without error message
### Priority: P0
    
# Challenges
## 1. Instruction in how to setup application and database is not clear
    - Step 4, Verify that you can access the login page via http://localhost:9997
    - It does not redirect to login page and showing an error.
#####     https://ibb.co/vsSZNQP

## 2. API Doc is not provided
    - There is no API Doc provided
    - No expected response

## 3. Lack of clarification on csv preparation
    - No header needed. In order to get CSV working have to check on the stacktrace for more information.
#####     https://ibb.co/6nXgkjG
#####     https://ibb.co/K7p2w9K