@first
Feature: 

  Background: 
    * def Base = 'https://reqres.in/api/users'
    * def payload = {first_name:"Palak", last_name:"Vora"}
    * def updatePayload = {first_name: "Hope"}
    * def getData =
      """
      function(arg){
      for(i=0;i<arg.length;i++)
      {
      	if((arg[i].first_name)=="Michael")
      	{
      		return (arg[i])
      	}
      	}
      	}
      """

  Scenario: 01 get all users
    * url Base + '?page=2'
    When method GET
    * status 200
    * url Base
    When method GET
    Then status 200

  Scenario: 02 Update details of user
    Given url Base
    And request payload
    When method post
    Then status 201
    * def id = response.id
    Given url Base + "/" + id
    And request updatePayload
    When method put
    Then status 200

  Scenario: 03 Delete the user
    Given url Base + "/2"
    When method delete
    Then status 204

  Scenario: 04 Get details of user michael
    Given url Base + "?page=2"
    When method get
    * def data = response.data
    * def callingFunc = call getData data
    And print 'Details of user with name Michael: ', callingFunc
