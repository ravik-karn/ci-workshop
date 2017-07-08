#!/usr/bin/env bash

aws elasticbeanstalk create-application-version --application-name HelloSpringBoot \
    --version-label SpringBootApp-v3.$TRAVIS_BUILD_NUMBER \
    --source-bundle S3Bucket="aws.ravi.hellospringboot",S3Key="democi-0.0.1-SNAPSHOT.jar"

aws elasticbeanstalk update-environment --application-name HelloSpringBoot \
    --environment-name springboot-env --version-label HelloSpringBootApp-v3.$TRAVIS_BUILD_NUMBER

echo $TRAVIS_BUILD_NUMBER
echo $TRAVIS_BUILD_DIR