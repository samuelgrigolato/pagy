
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
    @set "rows", [ row ]


  addRow: () ->
    row = new Pagy.RowModel
    rows = @get "rows"
    @set "rows", (rows.concat row)


class PageView extends Backbone.View

  tagName: "div"
    
  className: "page"
    
  events:
    "click > button.add-row": "addRow"
    
  initialize: () ->  
    @model = @model || new PageModel
    @model.on "change:rows", () => @render()
    
    @_addRowButton = $ "<button />"
    @_addRowButton.text Pagy.Dictionary.giveMe "addRowButtonCaption"
    @_addRowButton.addClass "add-row"
    
    @render()
    
    
  render: () ->
    @$el.empty()
    @_renderRow row for row in @model.get "rows"
    @$el.append @_addRowButton


  _renderRow: (row) ->    
    rowView = new Pagy.RowView { model: row }    
    rowView.render()    
    @$el.append rowView.$el  

  addRow: () ->
    @model.addRow()


# exports
window.Pagy = window.Pagy || {}
window.Pagy.PageModel = PageModel
window.Pagy.PageView = PageView
