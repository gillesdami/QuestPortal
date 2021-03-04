# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Inspired by:
# https://hub.docker.com/r/runmymind/docker-android-sdk/~/dockerfile/

FROM ubuntu:18.04
ARG BUILD_VARIANT=assembleOculusvrArm64Debug

# -- System -----------------------------------------------------------------------------

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq

RUN apt-get install -y openjdk-8-jdk \
					   wget \
					   expect \
					   git \
					   curl \
					   ruby \
					   ruby-dev \
					   ruby-build \
					   python \
					   python-pip \
					   optipng \
					   imagemagick \
					   locales

RUN locale-gen en_US.UTF-8

# -- Android SDK ------------------------------------------------------------------------

RUN cd /opt && wget -q https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip -O android-sdk.zip
RUN cd /opt && unzip android-sdk.zip
RUN cd /opt && rm -f android-sdk.zip

ENV ANDROID_BUILD_TOOLS_VERSION_29 "29.0.2"
ENV ANDROID_SDK_HOME /opt
ENV ANDROID_HOME /opt
ENV PATH ${PATH}:${ANDROID_SDK_HOME}/tools/bin:${ANDROID_SDK_HOME}/platform-tools:/opt/tools:${ANDROID_SDK_HOME}/build-tools/${ANDROID_BUILD_TOOLS_VERSION_29}

RUN echo y | sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION_29}" --sdk_root=$ANDROID_SDK_HOME
RUN echo y | sdkmanager "ndk-bundle" --sdk_root=$ANDROID_SDK_HOME
RUN echo y | sdkmanager "cmake;3.10.2.4988404" --sdk_root=$ANDROID_SDK_HOME
RUN echo y | sdkmanager "platforms;android-29" --sdk_root=$ANDROID_SDK_HOME

WORKDIR /opt

# Checkout source code
RUN git clone https://github.com/gillesdami/QuestPortal.git
WORKDIR /opt/QuestPortal
RUN echo sdk.dir=/opt > local.properties && echo ndk.dir=/opt/ndk-bundle >> local.properties
RUN git submodule init
RUN git submodule update

# Copy third_party
ADD third_party /opt/QuestPortal/third_party

# Copy client config & code
ADD gradle.properties /opt/QuestPortal/gradle.properties
ADD app/src/main/assets/app /opt/QuestPortal/app/src/main/assets/app

# Build project and run gradle tasks once to pull all dependencies
RUN ./gradlew $BUILD_VARIANT
