FROM sonarqube:6.7
MAINTAINER Andrey Etin "etinaa@yandex.ru"

#Bundled plugins
ENV GIT_PLUGIN_VERSION=1.3.0.869 \
  JAVA_PLUGIN_VERSION=4.15.0.12310 \
  JAVASCRIPT_PLUGIN_VERSION=3.3.0.5702 \
  WEB_PLUGIN_VERSION=2.5.0.476 \
  XML_PLUGIN_VERSION=1.4.3.1027

WORKDIR $SONARQUBE_HOME/lib/bundled-plugins

RUN set -x \
  && rm -rf sonar-*.jar \
  && curl -fSL -o sonar-scm-git-plugin-${GIT_PLUGIN_VERSION}.jar https://sonarsource.bintray.com/Distribution/sonar-scm-git-plugin/sonar-scm-git-plugin-${GIT_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-java-plugin-${JAVA_PLUGIN_VERSION}.jar https://sonarsource.bintray.com/Distribution/sonar-java-plugin/sonar-java-plugin-${JAVA_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-javascript-plugin-${JAVASCRIPT_PLUGIN_VERSION}.jar https://sonarsource.bintray.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-${JAVASCRIPT_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-web-plugin-${WEB_PLUGIN_VERSION}.jar https://sonarsource.bintray.com/Distribution/sonar-web-plugin/sonar-web-plugin-${WEB_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-xml-plugin-${XML_PLUGIN_VERSION}.jar https://sonarsource.bintray.com/Distribution/sonar-xml-plugin/sonar-xml-plugin-${XML_PLUGIN_VERSION}.jar

#Community plugins
ENV CHECKSTYLE_PLUGIN_VERSION=2.4 \
  FINDBUGS_PLUGIN_VERSION=3.6.0 \
  GROOVY_PLUGIN_VERSION=1.5 \
  PMD_PLUGIN_VERSION=2.6

WORKDIR $SONARQUBE_HOME/extensions/plugins

RUN set -x \
  && curl -fSL -o sonar-checkstyle-plugin-${CHECKSTYLE_PLUGIN_VERSION}.jar https://github.com/SonarQubeCommunity/sonar-checkstyle/releases/download/${CHECKSTYLE_PLUGIN_VERSION}/sonar-checkstyle-plugin-${CHECKSTYLE_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-findbugs-plugin-${FINDBUGS_PLUGIN_VERSION}.jar https://github.com/SonarQubeCommunity/sonar-findbugs/releases/download/${FINDBUGS_PLUGIN_VERSION}/sonar-findbugs-plugin-${FINDBUGS_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-groovy-plugin-${GROOVY_PLUGIN_VERSION}.jar https://github.com/pmayweg/sonar-groovy/releases/download/${GROOVY_PLUGIN_VERSION}/sonar-groovy-plugin-${GROOVY_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-pmd-plugin-${PMD_PLUGIN_VERSION}.jar https://github.com/SonarQubeCommunity/sonar-pmd/releases/download/${PMD_PLUGIN_VERSION}/sonar-pmd-plugin-${PMD_PLUGIN_VERSION}.jar

WORKDIR $SONARQUBE_HOME
