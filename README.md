docker run -it --rm --name my-maven-project \
  -v ${PWD}:/usr/src/mymaven \
  -w /usr/src/mymaven \
  -v ${PWD}/.m2:/var/maven/.m2 \
  -e MAVEN_CONFIG=/var/maven/.m2 \
  -u 1000 \
  maven \
  mvn -Duser.home=/var/maven clean install