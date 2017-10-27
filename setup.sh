
#for copying input file
#cp sample.txt  ~/input

#for compiling java program

export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")

sudo javac -cp :/usr/local/hduser/share/hadoop/common/hadoop-common-2.7.3.jar:/usr/local/hduser/share/hadoop/common/lib/hadoop-annotations-2.7.3.jar:/usr/local/hduser/share/hadoop/mapreduce/hadoop-mapreduce-client-core-2.7.3.jar *.java

#for creating jar file

jar -cvf Example.jar -C *.*

#for executing hadoop 
#make sure to remove ~/grep_example rm -R ~/grep_example/
/usr/local/hduser/bin/hadoop jar Example.jar youtubegroup youtubedata.txt ~/youtubegroup

/usr/local/hduser/bin/hadoop jar Example.jar youtuberating youtubedata.txt ~/youtuberating


/usr/local/hduser/bin/hadoop jar Example.jar youtubeview youtubedata.txt ~/youtubeview

echo "\n\n\n---------------------------------------------------------------OUTPUT------------------------------------------------------------------------------------"

echo "\n\n\n--------------------------------------------------------------TOP FIVE CATEGORIES-------------------------------------------------------------\n\n\n"

cat ~/youtubegroup/part-r-00000 | sort -n -k2 -r | head -n5

echo "\n\n\n--------------------------------------------------------------TOP TWENTY RATED-------------------------------------------------------------\n\n\n"

cat ~/youtuberating/part-r-00000 | sort -n -k2 -r | head -n20

echo "\n\n\n--------------------------------------------------------------TOP TWENTY VIEWED-------------------------------------------------------------\n\n\n"

cat ~/youtubeview/part-r-00000 | sort -n -k2 -r | head -n20
