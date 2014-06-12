class MyClass
  
  greet: ->
    "hello"


if module?.exports?
  module.exports = MyClass
else
  window.MyClass = MyClass
