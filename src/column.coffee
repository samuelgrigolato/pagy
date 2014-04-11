
###
This module is responsible for encapsulating
a column and all its functionality
###
 

class ColumnModel extends Backbone.Model

  defaults:
    
    ###
    Collection of root
    rows of this column.
    ###
    "rows": []


  addRow: () ->
    rows = @get "rows"
    newRows = rows.concat [@_newRow()]
    if newRows.length == 1
      # add extra row if there wasn't any
      newRows = newRows.concat [@_newRow()]
    @set "rows", newRows

  
  _newRow: () ->
    row = new Pagy.RowModel
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
