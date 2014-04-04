
###
This module is responsible
for presenting the user page
###


class PageModel extends Backbone.Model

  defaults:
    
    ###
    Collection of root
    rows of this page. Each
    row can contain one
    or more columns
    ###
    "rows": []
      
    ###
    Define the active mode of the application.
    Possible values: layout and preview.
    ###
    "mode": "layout"

  initialize: () ->
  
    row = new Pagy.RowModel
    @_initializeRow row
    
    @set "rows", [ row ]
    
    
  _initializeRow: (row) ->
    row.on "addRowAbove", () => @_addRowBelow(row)
    row.on "addRowBelow", () => @_addRowAbove(row)
  
  
  _addRowAbove: (row) ->
    index = @_findRowIndex row
    @_insertRowAt index
    
    
  _addRowBelow: (row) ->
    index = @_findRowIndex row
    @_insertRowAt index + 1


  _findRowIndex: (row) ->
    rows = @get "rows"
    rows.indexOf row


  _insertRowAt: (index) ->
    newRow = new Pagy.RowModel
    @_initializeRow newRow
    
    rows = @get "rows"
    newRows = rows[..index]
    newRows = newRows.concat [ newRow ]
    
    remaining = index + 1
    newRows = newRows.concat rows[remaining..]

    @set "rows", newRows


class PageView extends Backbone.View

  tagName: "div"
    
  className: "page"
    
  initialize: () ->  
    @model = @model || new PageModel
    @model.on "change:rows", () => @render()
    @render()
    
    
  render: () ->
    @$el.empty()
    @_renderRow row for row in @model.get "rows"


  _renderRow: (row) ->    
    rowView = new Pagy.RowView { model: row }    
    rowView.render()    
    @$el.append rowView.$el  



# exports
window.Pagy = window.Pagy || {}
window.Pagy.PageModel = PageModel
window.Pagy.PageView = PageView
