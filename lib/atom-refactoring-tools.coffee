AtomRefactoringToolsView = require './atom-refactoring-tools-view'
{CompositeDisposable} = require 'atom'

module.exports = AtomRefactoringTools =
  atomRefactoringToolsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @atomRefactoringToolsView = new AtomRefactoringToolsView(state.atomRefactoringToolsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @atomRefactoringToolsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-refactoring-tools:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomRefactoringToolsView.destroy()

  serialize: ->
    atomRefactoringToolsViewState: @atomRefactoringToolsView.serialize()

  toggle: ->
    console.log 'AtomRefactoringTools was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
