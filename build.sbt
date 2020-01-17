//
// Copyright 2016 LinkedIn Corp.
//
// Licensed under the Apache License, Version 2.0 (the "License"); you may not
// use this file except in compliance with the License. You may obtain a copy of
// the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
// License for the specific language governing permissions and limitations under
// the License.
//

import play.Project._
import Dependencies._

name := "fk-dr-elephant"

version := "2.2.12"

organization := "com.flipkart.fdp"

javacOptions in Compile ++= Seq("-source", "1.6", "-target", "1.6")

libraryDependencies ++= dependencies map { _.excludeAll(exclusionRules: _*) }

// Create a new custom configuration called compileonly
ivyConfigurations += config("compileonly").hide

// Append all dependencies with 'compileonly' configuration to unmanagedClasspath in Compile.
unmanagedClasspath in Compile ++= update.value.select(configurationFilter("compileonly"))

playJavaSettings

scalaVersion := "2.10.4"

publishTo in ThisBuild := {
val flipkartArtifactory = "http://artifactory.fkinternal.com/artifactory/v1.0/artifacts/"
if (version.value.trim.endsWith("SNAPSHOT"))
Some("snapshots" at flipkartArtifactory + "libs-snapshots-local")
else
Some("releases" at flipkartArtifactory + "libs-release-local")
}

publishArtifact in(Compile, packageDoc) in ThisBuild := false
