#!/usr/bin/env bash

aws elasticbeanstalk create-application-version --application-name SpringBoot \
    --version-label SpringBootApp-v3.$TRAVIS_BUILD_NUMBER \
    --source-bundle S3Bucket="aws.ravi.hellospringboot",S3Key="democi-0.0.1-SNAPSHOT.jar"