Based on this.
https://towardsdatascience.com/how-to-deploy-a-flask-api-in-kubernetes-and-connect-it-with-other-micro-services-af16965b67fe


# Install brew


# install dive
brew install dive

brew install postgresql

#    clang: error: linker command failed with exit code 1 (use -v to see invocation)
#    error: command 'clang' failed with exit status 1
# from https://stackoverflow.com/questions/16682156/ld-library-not-found-for-lgsl
export LIBRARY_PATH="/opt/local/lib"

#this did not work
sudo xcode-select --switch /Library/Developer/CommandLineTools
