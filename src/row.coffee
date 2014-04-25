

###
This module is responsible for encapsulating
a row and all its functionality
###


class RowModel extends Backbone.Model

  ###
  Maximum number of columns a row can have
  ###
  @MAX_COLUMNS: 4

  defaults:
    
    ###
    Collection of root
    columns of this page. Each
    row can contain one
    or more rows
    ###
    "columns": []

    ###
    Define the nesting level
    of this row, this information
    should be provided by the parent
    element.
    ###
    "level": 1
    
    
  addColumn: () ->
  
    columns = @get "columns"
    if columns.length == 0
      columns = [@_newColumn()]
    
    currentlyLast = columns[columns.length - 1]
    currentlyLast.set "last", false
    
    newlyLast = @_newColumn()
    newlyLast.set "last", true
    
    newColumns = columns.concat [newlyLast]
    
    @set "columns", newColumns


  _newColumn: () ->
    column = new Pagy.ColumnModel { level: @get "level" }
    column.on "remove", () => @_removeColumn column
    column


  _removeColumn: (column) ->
    columns = @get "columns"
    if columns.length > 2
      idx = columns.indexOf column
      nextIdx = idx + 1
      newColumns = columns[...idx].concat columns[nextIdx...]
      @set "columns", newColumns
    else
      @set "columns", []


  isMaximumColumnsReached: () ->
    columns = @get "columns"
    columns.length >= @constructor.MAX_COLUMNS
  
    

class RowView extends Backbone.View

  tagName: "div"
    
  className: "row"
    
  events:
    "click > .controls > .remove": "remove"
    "click > .controls > .add-column": "addColumn"
    
  initialize: () ->
    @model = @model || new RowModel
    @model.on "change:columns", () => @render()
    
    $removeButton = $ "<button></button>"
    $addColumnButton = $ "<button></button>"
    
    $removeButton.addClass "remove"
    $addColumnButton.addClass "add-column"
    
    $controls = $ "<div></div>"
    $controls.addClass "controls"
    $controls.append $removeButton
    $controls.append $addColumnButton
    
    @$el.append $controls
    
    $contents = $ "<div></div>"
    $contents.addClass "contents"
    
    @$el.append $contents
    
    $clearFix = $ "<div />"
    $clearFix.addClass "clearfix"
    @$el.append $clearFix
    
    @render()


  render: () -> 
    
    $controls = @$el.find " > .controls "
    $addColumnButton = $controls.find " > .add-column "
    
    maximumColumnsReached = @model.isMaximumColumnsReached()
    $addColumnButton.toggleClass "hidden", maximumColumnsReached
    
    @_updateColumnCountClass()
    
    $contents = @$el.find " > .contents "
    $contents.empty()
    @_renderColumn column for column in @model.get "columns"

  
  _renderColumn: (column) ->
    columnView = new Pagy.ColumnView { model: column }    
    $contents = @$el.find " > .contents "
    $contents.append columnView.$el

  _updateColumnCountClass: () ->
    
    for i in [2..RowModel.MAX_COLUMNS]
      @$el.removeClass "columns-#{i}"
    
    columns = @model.get "columns"
    columnCount = columns.length
    if columnCount > 0
      @$el.addClass "columns-#{columnCount}"


  remove: () ->
    @model.trigger "remove"
  
  
  addColumn: () ->
    @model.addColumn()



# exports
window.Pagy = window.Pagy || {}
window.Pagy.RowModel = RowModel
window.Pagy.RowView = RowView
