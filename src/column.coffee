
###
This module is responsible for encapsulating
a column and all its functionality
###
 

class ColumnModel extends Backbone.Model

  ###
  Defines the maximum nesting level,
  if the current column is in this level
  it should not be allowed to produce
  child rows.
  ###
  @MAX_LEVEL: 2

  defaults:
    
    ###
    Collection of root
    rows of this column.
    ###
    "rows": []

    ###
    Define the nesting level
    of this column, this information
    should be provided by the parent
    element.
    ###
    "level": 1
    
    ###
    Is this column the last
    one in its parent array?
    ###
    "last": false


  addRow: () ->
    rows = @get "rows"
    newRows = rows.concat [@_newRow()]
    if newRows.length == 1
      # add extra row if there wasn't any
      newRows = newRows.concat [@_newRow()]
    @set "rows", newRows

  
  _newRow: () ->
    columnLevel = @get "level"
    row = new Pagy.RowModel { level: columnLevel + 1 }
    row.on "remove", () => @_removeRow row
    row

  
  _removeRow: (row) ->
    rows = @get "rows"
    if rows.length > 2
      idx = rows.indexOf row
      nextIdx = idx + 1
      newRows = rows[...idx].concat rows[nextIdx...]
      @set "rows", newRows
    else
      @set "rows", []


  isMaximumLevelReached: () ->
    level = @get "level"
    level >= @constructor.MAX_LEVEL



class ColumnView extends Backbone.View

  tagName: "div"
    
  className: "column"

  events:
    "click > .controls > .remove": "remove"
    "click > .controls > .add-row": "addRow"


  initialize: () ->  
    @model = @model || new ColumnModel
    @model.on "change:rows", () => @render()
    
    $removeButton = $ "<button></button>"
    $addRowButton = $ "<button></button>"
    
    $removeButton.addClass "remove"
    $addRowButton.addClass "add-row"
    
    $controls = $ "<div></div>"
    $controls.addClass "controls"
    $controls.append $removeButton
    $controls.append $addRowButton
    
    @$el.append $controls
    
    $contents = $ "<div></div>"
    $contents.addClass "contents"
    
    @$el.append $contents
    
    @render()


  render: () ->
    
    @$el.toggleClass "last", @model.get "last"
    
    empty = (@model.get "rows").length == 0
    @$el.toggleClass "empty", empty
    @$el.toggleClass "not-empty", !empty
    
    $controls = @$el.find " > .controls "
    $addRowButton = $controls.find " > .add-row "
    
    maximumLevelReached = @model.isMaximumLevelReached()
    $addRowButton.toggleClass "hidden", maximumLevelReached
    
    $contents = @$el.find " > .contents "
    $contents.empty()
    @_renderRow row for row in @model.get "rows"


  _renderRow: (row) ->    
    rowView = new Pagy.RowView { model: row }    
    rowView.render()
    $contents = @$el.find " > .contents "
    $contents.append rowView.$el


  remove: () ->
    @model.trigger "remove"


  addRow: () ->
    @model.addRow()



# exports
window.Pagy = window.Pagy || {}
window.Pagy.ColumnModel = ColumnModel
window.Pagy.ColumnView = ColumnView
