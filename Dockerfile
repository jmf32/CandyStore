#FROM openjdk
#RUN apt-get update && apt-get upgrade -y
# Install git

#RUN apt-get install -y git
# Retrieve the code from github

#RUN git clone https://github.com/jmf32/CandyStore.git
# Set the java home environment var (required for grails to run)

#ENV JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home
# Ready the grails installation
# Running 'test-app' will pull down all the dependencies.
# We run this inside echo to ignore the return value, as the current
# Expose the grails web-app port

#EXPOSE 8080
# Run the application when running the container with no params

#ENTRYPOINT ["/bin/bash"]



FROM mozart/grails:2
MAINTAINER Manuel Ortiz Bey <ortiz.manuel@mozartanalytics.com>

# Copy App files
RUN git clone https://github.com/jmf32/CandyStore.git

# Run Grails refresh-dependencies command to 
# pre-download dependencies but not create
# unnecessary build files or artifacts.
RUN grails refresh-dependencies

# Set Default Behavior
ENTRYPOINT ["grails"]
CMD ["run-app"]
