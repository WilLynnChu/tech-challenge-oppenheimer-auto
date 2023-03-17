*** Settings ***
Documentation   Test Suite for Assessment Purpose
Library         SeleniumLibrary
Resource        ../keywords/generic.robot
Resource        ../keywords/login.robot
Resource        ../keywords/clerk.robot
Resource        ../keywords/governor.robot
Resource        ../keywords/apiRequest.robot
Test Setup      Test Setup Keyword
Test Teardown   Test Teardown Keyword

*** Test Cases ***
Login As Clerk Successfully
    Login As Clerk

Login As Book Keeper Successfully
    Login As Book Keeper

Login As Governor Successfully
    Login As Governor

Login Unsuccessfully With Invalid Credential
    Login With Invalid Credential

Upload Valid CSV To Working Class Heroes As Clerk
    Login As Clerk
    Upload Valid Heroes To Working Class Heroes

Upload Invalid Date To Working Class Heroes As Clerk
    Login As Clerk
    Upload Invalid Heroes With Earlier Death Date Than Birth Date

Upload Invalid Natid Syntax To Working Class Heroes As Clerk
    Login As Clerk
    Upload Heroes With Invalid Natid Syntax

Upload Invalid Natid Length To Working Class Heroes As Clerk
    Login As Clerk
    Upload Heroes With Invalid Natid Length

Insert Valid Hero Via API
    Post Insert Valid Hero Record

Insert Invalid Hero Via API
    Post Insert Invalid Hero Record

List All Heroes As Governor
    Login As Governor
    List All Heroes As Governor
    Verify Searched User

Search All Heroes List Using Natid As Governor
    Login As Governor
    List All Heroes As Governor
    Search All Heroes List Via Natid
    Verify Searched User

Search All Heroes List Using Name As Governor
    Login As Governor
    List All Heroes As Governor
    Search All Heroes List Via Name
    Verify Searched User

Search Hero Summary As Governor
    Login As Governor
    Search Heroes Summary As Governor
    Verify Heroes Summary

*** Keywords ***
Test Setup Keyword
    Open Browser And Navigate To URL

Test Teardown Keyword
    Close Browser