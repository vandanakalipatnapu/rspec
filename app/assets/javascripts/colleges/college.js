 var app = angular.module('myapp1', []);
	      app.controller("collegecontroller",function($scope){
	      	$scope.clear=function(){
	      		$scope.name="";
	      		$scope.email="";
	      		$scope.phno="";
	      		$scope.location="";
	      	}
	      });