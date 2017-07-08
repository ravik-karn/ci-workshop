#!/usr/bin/env bash

aws s3 cp -r $TRAVIS_BUILD_DIR/fulljar s3://aws.ravi.hellospringboot

aws elasticbeanstalk create-application-version --application-name HelloSpringBoot \
    --version-label SpringBootApp-v3.$TRAVIS_BUILD_NUMBER \
    --source-bundle S3Bucket="aws.ravi.hellospringboot",S3Key="democi-"${TRAVIS_BUILD_NUMBER}"-SNAPSHOT.jar"

aws elasticbeanstalk update-environment --application-name HelloSpringBoot \
    --environment-name springboot-env --version-label HelloSpringBootApp-v3.$TRAVIS_BUILD_NUMBER
