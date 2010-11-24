project {
  modelVersion '4.0.0'
  groupId 'rspec-java-example'
  artifactId 'rspec-java-example'
  version '1.0.0'
  description 'Maven 3 (polyglot) example'
  
  properties {
    'project.build.sourceEncoding''UTF-8'
  }
  
  dependencies {
    dependency {
      groupId 'junit'
      artifactId 'junit'
      version '4.4'
      scope 'test'
    }
  }
  
  build {
    defaultGoal 'package'
    finalName 'test'
    
    plugins {
      plugin {
        artifactId 'maven-surefire-plugin'
        version '2.6'
        configuration {
          skip 'false'
        }
      }
    
      plugin {
        artifactId 'maven-compiler-plugin'
        version '2.3.2'
        configuration {
          source '1.6'
          target '1.6'
          debug 'true'
          showDeprecation 'true'
          showWarnings 'true'
          optimize 'false'
        }
      }
    }
  }
}
                