 var app = angular.module('myapp', []);
	      app.controller("studentcontroller",function($scope){
	      	$scope.clear=function(){
	      		$scope.name="";
	      		$scope.email="";
	      		$scope.age="";
	      		$scope.dob="";
	      	}
	      });