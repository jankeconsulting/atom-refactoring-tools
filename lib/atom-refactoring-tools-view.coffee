module.exports =
class AtomRefactoringToolsView
  constructor: (serializedState) ->
    # Create root element
    element = document.createElement('div')
    element.classList.add('atom-refactoring-tools')

    # Create message element
    message = document.createElement('div')
    message.textContent = "The AtomRefactoringTools package is Alive! It's ALIVE!"
    message.classList.add('message')
    element.appendChild(message)

    @getElement = ->
      element

    # Tear down any state and detach
    @destroy = ->
      element.remove()

  # Returns an object that can be retrieved when package is activated
  serialize: ->
