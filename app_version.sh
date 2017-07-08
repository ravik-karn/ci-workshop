#!/usr/bin/env bash

aws configure set aws_access_key_id $ACCESS_KEY_ID
aws configure set aws_secret_access_key $SECRET_ACCESS_KEY
aws configure set default.region $ACCESS_KEY_REGION

aws s3 cp $TRAVIS_BUILD_DIR/fulljar/democi-$TRAVIS_BUILD_NUMBER-SNAPSHOT.jar s3://aws.ravi.hellospringboot/democi-$TRAVIS_BUILD_NUMBER-SNAPSHOT.jar

aws elasticbeanstalk create-application-version --application-name HelloSpringBoot \
    --version-label SpringBootApp-v3.$TRAVIS_BUILD_NUMBER \
    --source-bundle S3Bucket="aws.ravi.hellospringboot",S3Key="democi-"${TRAVIS_BUILD_NUMBER}"-SNAPSHOT.jar"

aws elasticbeanstalk update-environment --application-name HelloSpringBoot \
    --environment-name springboot-env --version-label HelloSpringBootApp-v3.$TRAVIS_BUILD_NUMBER
