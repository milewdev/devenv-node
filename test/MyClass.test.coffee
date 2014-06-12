chai      = require("chai")
should    = chai.should()
MyClass   = require("../src/MyClass")

describe "MyClass", ->
  describe "greet()", ->
    it "returns 'hello'", ->
      my_instance = new MyClass()
      my_instance.greet().should.equal("hello")
