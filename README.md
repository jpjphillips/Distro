<h2 align="center">
  <a href="http://localhost:4010/apps/landing/crowd.html"><img src="https://avatars2.githubusercontent.com/u/12075069?s=400&v=4" style="background-color:rgba(0,0,0,0);" height=230 alt="camicroscope: a web-based image viewer optimized for large bio-medical image data viewing"></a>
</h2>

# caMicroscope Testing Distribution Package

This repository contains a build of caMicroscope designed to be easy installed for testing in progress changes. Aspects of the build have been changed compared to current available versions for the purpose of testing only and are noted where possible.

## What you need to install
- Docker - Installing a local instance of caMicroscope depends on the software Docker. Many versions of Docker are available and should work, but I recommend using Docker Desktop which can be found here: https://www.docker.com/products/docker-desktop
- Ability to clone repositories - You will have to clone this repository in order to build your local instance. Do this anyway that you are comfortable with such as using SmartGit.
- (Optional) RStudio + HTT Raw Package - Included in this repository is an API to extract responses to the registration/exit forms into R. For this, you will need RStudio and the current HTT package

## Setting up your local instance
In order to run this build on your local machine, you will need to build and run Docker containers. The below process outlines the easiest way to do so:
1. Clone this repository onto your local machine
2. Start up your version of Docker. For Docker Desktop, all you need to do is open the application and wait for it to begin running
3. Open a command prompt and set your directory to your cloned repository
4. With Docker running, enter the command `docker-compose -f caMicroscope.yml build` into your command prompt to build your containers (Note: Make sure you have deleted any previously built containers for caMicroscope before running this command)
5. Once the containers have been built, you can run them with the command `docker-compose -f caMicroscope.yml up` (It may take a couple seconds for the containers to start)
6. Navigate to http://localhost:4010/apps/landing/crowd.html and you should see the landing page of caMicroscope
7. There is a common issue of being redirected to the sign in page from the link above. To avoid this, click the sign in button, enter your information and submit. You should recieve and error and be redirected to a new page. At this point you can once again go to the link above and you should be able to access the landing page now.

You now have a local instance of caMicroscope on your device! You can explore the build as much as you want and when you are finished, go to your command prompt an press Ctrl + C to stop the Docker containers from running.

## Using the form response API
If you want to test the form response API, you can follow these steps:
1. With your Docker containers running, navigate to either the registration or exit forms on the caMicroscope landing page
2. Fill out all the required fields in the form and click submit when you are finished. You should be redirected back to the landing page
3. Open the `caMicResponseAPI.R` file from the repository in RStudio
4. With your containers still running, run the script from the file
5. The resulting files will be titled "dfRegistration" and "dfExit" which will contain a table of all the responses you entered into the forms (You can fill out the form multiple times if you want to see what it looks like with multiple entries)
